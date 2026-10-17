package com.aIresumeanalyzer.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.time.Instant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aIresumeanalyzer.daoimpl.UserDaoImpl;
import com.aIresumeanalyzer.entity.User;
import com.aIresumeanalyzer.repository.UserRepository;
import com.aIresumeanalyzer.service.EmailService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ForgotPasswordController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserDaoImpl userDaoImpl;

    @Autowired
    private EmailService emailService;

    private final SecureRandom secureRandom = new SecureRandom();

    private static final long OTP_VALIDITY_SECONDS = 300;
    private static final int MAX_OTP_ATTEMPTS = 5;

    // =========================================================
    // FORGOT PASSWORD PAGE
    // =========================================================

    @GetMapping("/forgot-password")
    public String forgotPasswordPage() {
        return "forgot-password";
    }

    // =========================================================
    // SEND RESET OTP
    // =========================================================

    @PostMapping("/send-reset-otp")
    public String sendResetOtp(
            @RequestParam("email") String email,
            HttpSession session,
            Model model) {

        email = email.trim().toLowerCase();

        User user = userRepository.findByEmail(email);

        // Generic response avoids revealing whether an account exists.
        if (user == null) {
            model.addAttribute(
                    "message",
                    "If the account exists, an OTP will be sent to its email."
            );

            return "forgot-password";
        }

        String otp = String.format(
                "%06d",
                secureRandom.nextInt(1_000_000)
        );

        session.removeAttribute("RESET_OTP");
        session.removeAttribute("RESET_EMAIL");
        session.removeAttribute("RESET_OTP_EXPIRY");
        session.removeAttribute("RESET_OTP_ATTEMPTS");
        session.removeAttribute("RESET_OTP_VERIFIED");

        try {
            emailService.sendOtp(email, otp);

            session.setAttribute("RESET_OTP", otp);
            session.setAttribute("RESET_EMAIL", email);

            session.setAttribute(
                    "RESET_OTP_EXPIRY",
                    Instant.now()
                            .plusSeconds(OTP_VALIDITY_SECONDS)
                            .toEpochMilli()
            );

            session.setAttribute("RESET_OTP_ATTEMPTS", 0);
            session.setAttribute("RESET_OTP_VERIFIED", false);

            return "redirect:/verify-otp";

        } catch (Exception e) {
            e.printStackTrace();

            model.addAttribute(
                    "error",
                    "Unable to send OTP right now. Please try again later."
            );

            return "forgot-password";
        }
    }

    // =========================================================
    // VERIFY OTP PAGE
    // =========================================================

    @GetMapping("/verify-otp")
    public String verifyOtpPage(HttpSession session) {

        if (session.getAttribute("RESET_OTP") == null) {
            return "redirect:/forgot-password";
        }

        return "verify-otp";
    }

    // =========================================================
    // VERIFY OTP
    // =========================================================

    @PostMapping("/verify-otp")
    public String verifyOtp(
            @RequestParam("otp") String enteredOtp,
            HttpSession session,
            Model model) {

        String savedOtp =
                (String) session.getAttribute("RESET_OTP");

        String email =
                (String) session.getAttribute("RESET_EMAIL");

        Long expiry =
                (Long) session.getAttribute("RESET_OTP_EXPIRY");

        Integer attempts =
                (Integer) session.getAttribute("RESET_OTP_ATTEMPTS");

        if (savedOtp == null || email == null || expiry == null) {
            return "redirect:/forgot-password";
        }

        if (Boolean.TRUE.equals(
                session.getAttribute("RESET_OTP_VERIFIED"))) {

            return "redirect:/reset-password";
        }

        if (attempts == null) {
            attempts = 0;
        }

        if (attempts >= MAX_OTP_ATTEMPTS) {
            clearResetSession(session);

            model.addAttribute(
                    "error",
                    "Too many incorrect attempts. Please request a new OTP."
            );

            return "forgot-password";
        }

        if (System.currentTimeMillis() > expiry) {
            clearResetSession(session);

            model.addAttribute(
                    "error",
                    "OTP expired. Please request a new one."
            );

            return "forgot-password";
        }

        if (!savedOtp.equals(enteredOtp.trim())) {

            attempts++;

            session.setAttribute("RESET_OTP_ATTEMPTS", attempts);

            if (attempts >= MAX_OTP_ATTEMPTS) {
                clearResetSession(session);

                model.addAttribute(
                        "error",
                        "Too many incorrect attempts. Please request a new OTP."
                );

                return "forgot-password";
            }

            model.addAttribute(
                    "error",
                    "Invalid OTP. Please try again."
            );

            return "verify-otp";
        }

        session.setAttribute("RESET_OTP_VERIFIED", true);

        return "redirect:/reset-password";
    }

    // =========================================================
    // RESET PASSWORD PAGE
    // =========================================================

    @GetMapping("/reset-password")
    public String resetPasswordPage(HttpSession session) {

        if (!Boolean.TRUE.equals(
                session.getAttribute("RESET_OTP_VERIFIED"))) {

            return "redirect:/forgot-password";
        }

        return "reset-password";
    }

    // =========================================================
    // RESET PASSWORD
    // =========================================================

    @PostMapping("/reset-password")
    public String resetPassword(
            @RequestParam("password") String password,
            @RequestParam("confirmPassword") String confirmPassword,
            HttpSession session,
            Model model) {

        if (!Boolean.TRUE.equals(
                session.getAttribute("RESET_OTP_VERIFIED"))) {

            return "redirect:/forgot-password";
        }

        String email =
                (String) session.getAttribute("RESET_EMAIL");

        Long expiry =
                (Long) session.getAttribute("RESET_OTP_EXPIRY");

        if (email == null || expiry == null
                || System.currentTimeMillis() > expiry) {

            clearResetSession(session);

            model.addAttribute(
                    "error",
                    "OTP expired. Please request a new one."
            );

            return "forgot-password";
        }

        if (password == null || password.length() < 8) {

            model.addAttribute(
                    "error",
                    "Password must contain at least 8 characters."
            );

            return "reset-password";
        }

        if (!password.equals(confirmPassword)) {

            model.addAttribute(
                    "error",
                    "Passwords do not match."
            );

            return "reset-password";
        }

        User user = userRepository.findByEmail(email);

        if (user == null) {

            clearResetSession(session);

            return "redirect:/forgot-password";
        }

        // Keep the existing BCrypt password encoding.
        user.setPassword(userDaoImpl.encodePassword(password));

        userRepository.save(user);

        // Clear reset-related session attributes after success.
        clearResetSession(session);

        // Redirect with a success parameter understood by login.jsp.
        String successMessage =
                URLEncoder.encode(
                        "Password reset successfully. Please log in.",
                        StandardCharsets.UTF_8
                );

        return "redirect:/login?success=" + successMessage;
    }

    // =========================================================
    // CLEAR PASSWORD RESET SESSION
    // =========================================================

    private void clearResetSession(HttpSession session) {

        session.removeAttribute("RESET_OTP");
        session.removeAttribute("RESET_EMAIL");
        session.removeAttribute("RESET_OTP_EXPIRY");
        session.removeAttribute("RESET_OTP_ATTEMPTS");
        session.removeAttribute("RESET_OTP_VERIFIED");
    }
}