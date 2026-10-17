package com.aIresumeanalyzer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendOtp(String recipientEmail, String otp) {

        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom(System.getenv("MAIL_USERNAME"));
        message.setTo(recipientEmail);
        message.setSubject("AI Resume Analyzer - Password Reset OTP");

        message.setText(
            "Hello,\n\n"
            + "Your password reset OTP is: " + otp + "\n\n"
            + "This OTP is valid for 5 minutes.\n"
            + "Do not share this OTP with anyone.\n\n"
            + "If you did not request a password reset, ignore this email."
        );

        mailSender.send(message);
    }
}
