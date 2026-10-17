
package com.aIresumeanalyzer.security;

import java.util.UUID;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.aIresumeanalyzer.entity.User;
import com.aIresumeanalyzer.repository.UserRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration
public class SecurityConfig {

    private final UserRepository userRepository;

    public SecurityConfig(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(
            HttpSecurity http) throws Exception {

        http
            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                    "/login",
                    "/register",
                    "/adduser",
                    "/checkuser",
                    "/forgot-password",
                    "/css/**",
                    "/js/**",
                    "/images/**",
                    "/videos/**",
                    "/error"
                ).permitAll()
                .anyRequest().permitAll()
            )
            .oauth2Login(oauth -> oauth
                .loginPage("/login")
                .successHandler(googleLoginSuccessHandler())
            );

        return http.build();
    }

    @Bean
    public AuthenticationSuccessHandler googleLoginSuccessHandler() {

        return (request, response, authentication) -> {

            if (!(authentication instanceof OAuth2AuthenticationToken token)
                    || !(token.getPrincipal() instanceof OidcUser oidcUser)) {

                response.sendRedirect(
                    request.getContextPath()
                        + "/login?error=google_login_failed"
                );
                return;
            }

            String email = oidcUser.getEmail();
            String name = oidcUser.getFullName();
            Boolean emailVerified = oidcUser.getEmailVerified();

            if (email == null || email.isBlank()
                    || !Boolean.TRUE.equals(emailVerified)) {

                response.sendRedirect(
                    request.getContextPath()
                        + "/login?error=google_email_not_verified"
                );
                return;
            }

            email = email.trim().toLowerCase();

            User user = userRepository.findByEmail(email);

            if (user == null) {

                user = new User();

                if (name == null || name.isBlank()) {
                    name = email.substring(0, email.indexOf('@'));
                }

                user.setName(name);
                user.setEmail(email);

                // Google handles login; this random value is not a usable password.
                user.setPassword(UUID.randomUUID().toString());

                user = userRepository.save(user);
            }

            request.getSession().setAttribute(
                "USEREMAIL",
                user.getEmail()
            );

            response.sendRedirect(
                request.getContextPath() + "/home"
            );
        };
    }
}