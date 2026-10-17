<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ page import="org.springframework.web.util.HtmlUtils" %>

<%
    String success = (String) request.getAttribute("success");
    String error = (String) request.getAttribute("error");

    if (success == null) success = request.getParameter("success");
    if (error == null) error = request.getParameter("error");

    if (success != null) success = HtmlUtils.htmlEscape(success);
    if (error != null) error = HtmlUtils.htmlEscape(error);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Account | AI Resume Analyzer</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>
:root {
    --cyan:#38bdf8;--blue:#3b82f6;--purple:#8b5cf6;
    --white:#f8fafc;--muted:#a5b4cc;--border:rgba(255,255,255,.14);
}
*{margin:0;padding:0;box-sizing:border-box}
body{min-height:100vh;display:flex;flex-direction:column;font-family:'Inter',sans-serif;color:var(--white);background:#020617;overflow-x:hidden}
a{color:inherit;text-decoration:none}
.video-background{position:fixed;inset:0;z-index:-3;overflow:hidden;background:radial-gradient(ellipse at 20% 20%,#172554 0%,transparent 45%),radial-gradient(ellipse at 80% 80%,#3b0764 0%,transparent 45%),#020617}
.video-background video{position:absolute;inset:0;width:100%;height:100%;object-fit:cover;opacity:.45}
.video-overlay{position:absolute;inset:0;background:linear-gradient(90deg,rgba(2,6,23,.82),rgba(2,6,23,.58),rgba(2,6,23,.80)),linear-gradient(0deg,rgba(2,6,23,.88),transparent 55%)}
.ambient-glow{position:absolute;width:420px;height:420px;border-radius:50%;filter:blur(100px);opacity:.18;pointer-events:none;animation:floatGlow 12s ease-in-out infinite alternate}
.glow-one{background:#2563eb;top:10%;left:-130px}
.glow-two{background:#9333ea;bottom:-160px;right:-100px;animation-delay:-5s}
@keyframes floatGlow{from{transform:translate(0,0) scale(1)}to{transform:translate(80px,-40px) scale(1.15)}}
.site-header{position:relative;z-index:5;border-bottom:1px solid rgba(255,255,255,.10);background:rgba(2,6,23,.42);backdrop-filter:blur(18px)}
.navbar{width:min(1240px,92%);min-height:76px;margin:auto;display:flex;align-items:center;justify-content:space-between;gap:18px}
.brand{display:flex;align-items:center;gap:12px;font-size:16px;font-weight:800;letter-spacing:-.5px}
.brand-icon{width:43px;height:43px;display:grid;place-items:center;border-radius:14px;background:linear-gradient(135deg,#38bdf8,#6366f1,#a855f7);box-shadow:0 0 30px rgba(56,189,248,.25)}
.brand-text span{color:var(--cyan)}
.nav-actions{display:flex;align-items:center;gap:12px}
.nav-home{padding:11px 15px;border-radius:10px;color:#dbeafe;font-size:12px;transition:.25s}
.nav-home:hover{color:var(--cyan);background:rgba(255,255,255,.08)}
.nav-login{padding:11px 17px;border-radius:10px;font-size:12px;font-weight:700;background:linear-gradient(110deg,#2563eb,#7c3aed);box-shadow:0 7px 25px rgba(79,70,229,.25);transition:.25s}
.nav-login:hover{transform:translateY(-2px);box-shadow:0 10px 30px rgba(79,70,229,.4)}
.main-content{width:min(1240px,92%);flex:1;margin:auto;padding:38px 0;display:grid;grid-template-columns:1fr 490px;align-items:center;gap:65px}
.intro{animation:appear .8s ease both}
.eyebrow{display:inline-flex;align-items:center;gap:9px;padding:10px 14px;margin-bottom:23px;border:1px solid rgba(56,189,248,.28);border-radius:50px;background:rgba(14,165,233,.09);color:#bae6fd;font-size:10px;font-weight:800;letter-spacing:1.5px}
.eyebrow i{color:#c4b5fd}
.intro h1{max-width:650px;font-size:clamp(38px,4.2vw,61px);line-height:1.12;letter-spacing:-2.5px;margin-bottom:22px;font-weight:800}
.gradient-text{background:linear-gradient(100deg,#67e8f9,#60a5fa,#c4b5fd);-webkit-background-clip:text;background-clip:text;color:transparent}
.intro-description{max-width:520px;margin-bottom:28px;color:#c0cbe0;font-size:13px;line-height:1.9}
.feature-list{display:grid;gap:16px}
.feature{display:flex;align-items:center;gap:13px;color:#dbe5f5;font-size:12px;line-height:1.65}
.feature-icon{width:39px;height:39px;flex-shrink:0;display:grid;place-items:center;border-radius:12px;color:#7dd3fc;background:rgba(15,23,42,.70);border:1px solid rgba(125,211,252,.19)}
.feature strong{color:white;font-size:12px}
.register-card{width:100%;padding:32px;border:1px solid rgba(255,255,255,.17);border-radius:25px;background:rgba(9,16,37,.78);box-shadow:0 30px 100px rgba(0,0,0,.4),inset 0 1px 0 rgba(255,255,255,.07);backdrop-filter:blur(24px);-webkit-backdrop-filter:blur(24px);animation:appear .9s ease both}
.card-top{display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:22px}
.register-icon{width:54px;height:54px;display:grid;place-items:center;border-radius:17px;background:linear-gradient(135deg,#2563eb,#7c3aed);box-shadow:0 10px 35px rgba(79,70,229,.32);font-size:21px}
.secure-label{display:flex;align-items:center;gap:6px;padding-top:7px;color:#86efac;font-size:9px;font-weight:700}
.register-card h2{font-size:27px;letter-spacing:-.8px;margin-bottom:8px;font-weight:800}
.card-subtitle{margin-bottom:23px;color:var(--muted);font-size:11px;line-height:1.8}
.alert{display:flex;align-items:flex-start;gap:10px;padding:12px;margin-bottom:16px;border-radius:11px;font-size:11px;line-height:1.6;overflow-wrap:anywhere;animation:appear .35s ease both}
.alert i{margin-top:2px}
.alert.success{color:#86efac;background:rgba(34,197,94,.09);border:1px solid rgba(34,197,94,.25)}
.alert.error{color:#fca5a5;background:rgba(239,68,68,.09);border:1px solid rgba(239,68,68,.25)}
.alert-close{margin-left:auto;border:none;background:transparent;color:inherit;cursor:pointer;font-size:17px}
.form-group{margin-bottom:16px}
.form-group label{display:block;margin-bottom:8px;color:#e2e8f0;font-size:11px;font-weight:700}
.input-wrap{position:relative}
.input-icon{position:absolute;top:50%;left:14px;transform:translateY(-50%);color:#94a3b8;font-size:13px;pointer-events:none}
.form-input{width:100%;height:48px;padding:0 43px;outline:none;color:white;background:rgba(2,6,23,.54);border:1px solid rgba(148,163,184,.24);border-radius:11px;font-family:inherit;font-size:12px;transition:.25s}
.form-input::placeholder{color:#718096}
.form-input:focus{border-color:#38bdf8;box-shadow:0 0 0 4px rgba(56,189,248,.10);background:rgba(2,6,23,.75)}
.password-toggle{position:absolute;top:50%;right:13px;transform:translateY(-50%);padding:5px;border:none;background:transparent;color:#94a3b8;cursor:pointer}
.password-toggle:hover{color:var(--cyan)}
.password-hint{margin-top:7px;color:#8493ad;font-size:9px;line-height:1.6}
.password-strength{display:none;margin-top:8px}
.strength-track{height:4px;border-radius:10px;background:rgba(148,163,184,.18);overflow:hidden}
.strength-bar{height:100%;width:0;border-radius:inherit;transition:width .25s,background .25s}
.strength-label{display:block;margin-top:5px;color:#94a3b8;font-size:9px}
.terms{display:flex;align-items:flex-start;gap:9px;margin:17px 0 19px;color:#a5b4cc;font-size:10px;line-height:1.7}
.terms input{margin-top:3px;accent-color:#6366f1;flex-shrink:0}
.terms a{color:#7dd3fc;font-weight:700}
.register-button{width:100%;min-height:50px;display:flex;align-items:center;justify-content:center;gap:10px;border:none;border-radius:12px;color:white;font-family:inherit;font-size:12px;font-weight:800;background:linear-gradient(100deg,#2563eb,#6366f1,#7c3aed);box-shadow:0 10px 30px rgba(79,70,229,.27);cursor:pointer;transition:.25s}
.register-button:hover{transform:translateY(-2px);box-shadow:0 14px 35px rgba(79,70,229,.4)}
.register-button:disabled{opacity:.75;cursor:wait;transform:none}
.login-text{margin-top:20px;color:#a5b4cc;font-size:11px;text-align:center;line-height:1.8}
.login-text a{color:#7dd3fc;font-weight:800}
.login-text a:hover{color:#c4b5fd}
.divider{height:1px;background:rgba(255,255,255,.10);margin:19px 0 15px}
.bottom-note{display:flex;align-items:center;justify-content:center;gap:8px;color:#8493ad;font-size:9px;text-align:center}
.bottom-note i{color:#34d399}
.site-footer{position:relative;z-index:2;width:100%;padding:0 5%;color:#cbd5e1;background:rgba(8,15,30,.96);border-top:1px solid rgba(103,232,249,.20);backdrop-filter:blur(18px);-webkit-backdrop-filter:blur(18px)}
.footer-main{width:min(1240px,100%);margin:0 auto;padding:38px 0 30px;display:grid;grid-template-columns:1.7fr .8fr 1.2fr;gap:55px}
.footer-logo{display:inline-flex;align-items:center;gap:10px;color:var(--white);font-size:19px;font-weight:750;letter-spacing:-.5px}
.footer-logo-icon{width:38px;height:38px;display:inline-grid;place-items:center;border-radius:11px;color:#07111f;background:linear-gradient(135deg,#67e8f9,#38bdf8);box-shadow:0 5px 20px rgba(56,189,248,.2);font-size:14px;font-weight:900}
.footer-highlight{color:var(--cyan)}
.footer-description{max-width:350px;margin:16px 0;color:#94a3b8;font-size:12px;line-height:1.9}
.footer-status{display:inline-flex;align-items:center;gap:8px;padding:8px 11px;border:1px solid rgba(148,163,184,.17);border-radius:30px;color:#cbd5e1;background:rgba(15,23,42,.75);font-size:10px}
.status-dot{width:7px;height:7px;border-radius:50%;background:#34d399;box-shadow:0 0 10px rgba(52,211,153,.6)}
.footer-column{display:flex;flex-direction:column;align-items:flex-start;gap:12px}
.footer-column h4{margin:7px 0 8px;color:#f8fafc;font-size:13px;font-weight:700;letter-spacing:.3px}
.footer-column>a{color:#94a3b8;font-size:12px;text-decoration:none;transition:color .2s,transform .2s}
.footer-column>a:hover{color:var(--cyan);transform:translateX(3px)}
.developer-name{margin:0;color:#f1f5f9;font-size:14px;font-weight:700}
.footer-column .developer-email{display:inline-flex;align-items:flex-start;gap:8px;max-width:100%;margin-top:2px;color:var(--cyan);font-size:12px;overflow-wrap:anywhere;word-break:break-word}
.developer-email:hover{color:#fff;text-decoration:underline}
.developer-email-icon{font-size:16px}
.footer-bottom{width:min(1240px,100%);min-height:60px;margin:0 auto;padding:17px 0;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:12px;border-top:1px solid rgba(148,163,184,.14)}
.footer-bottom p{margin:0;color:#64748b;font-size:11px;line-height:1.7}
.footer-bottom strong{color:#cbd5e1;font-weight:600}
.footer-tagline{color:#94a3b8!important}
@keyframes appear{from{opacity:0;transform:translateY(16px)}to{opacity:1;transform:translateY(0)}}
@media(max-width:1000px){.main-content{grid-template-columns:1fr 440px;gap:35px}.register-card{padding:27px}.intro h1{font-size:clamp(36px,4.5vw,51px);letter-spacing:-1.8px}.footer-main{grid-template-columns:1.4fr 1fr;gap:35px}.footer-brand{grid-column:1/-1}}
@media(max-width:820px){.main-content{grid-template-columns:1fr;max-width:520px;gap:32px;padding:36px 0}.intro{text-align:center}.intro h1,.intro-description{margin-left:auto;margin-right:auto}.feature-list{width:fit-content;max-width:100%;margin:auto;text-align:left}}
@media(max-width:560px){.navbar{min-height:68px;width:91%}.brand{font-size:12px;gap:8px}.brand-icon{width:37px;height:37px;border-radius:12px}.nav-home{display:none}.nav-login{padding:10px 12px;font-size:10px}.main-content{width:90%;padding:30px 0;gap:28px}.intro h1{font-size:38px;letter-spacing:-1.5px}.intro-description{font-size:12px}.register-card{padding:23px 19px;border-radius:20px}.register-card h2{font-size:24px}.footer-main{grid-template-columns:1fr;gap:27px;padding:30px 0}.footer-brand{grid-column:auto}.footer-bottom{align-items:flex-start;flex-direction:column;gap:7px}}
@media(prefers-reduced-motion:reduce){*,*::before,*::after{animation:none!important;transition:none!important}}


/* Compact Footer Social Icons */
.footer-socials {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-top: 7px;
    margin-bottom: 0;
}

.footer-socials a {
    width: 28px;
    height: 28px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: #94a3b8;
    font-size: 12px;
    text-decoration: none;
    border: 1px solid rgba(148, 163, 184, 0.22);
    border-radius: 6px;
    background: rgba(255, 255, 255, 0.04);
    transition: all 0.25s ease;
}

.footer-socials a:hover {
    color: #fff;
    border-color: #38bdf8;
    background: rgba(56, 189, 248, 0.12);
    transform: translateY(-1px);
}

/* Remove unnecessary spacing around email */
.footer-column .developer-email {
    margin-bottom: 0;
}

</style>
</head>

<body>

<div class="video-background" aria-hidden="true">
    <video autoplay muted loop playsinline preload="metadata">
        <source src="https://videos.pexels.com/video-files/3141208/3141208-hd_1920_1080_25fps.mp4" type="video/mp4">
    </video>
    <div class="video-overlay"></div>
    <div class="ambient-glow glow-one"></div>
    <div class="ambient-glow glow-two"></div>
</div>

<header class="site-header">
    <nav class="navbar">
        <a class="brand" href="${pageContext.request.contextPath}/login">
            <span class="brand-icon"><i class="fa-solid fa-brain"></i></span>
            <span class="brand-text">AI Resume <span>Analyzer</span></span>
        </a>

        <div class="nav-actions">
            <a class="nav-home" href="${pageContext.request.contextPath}/login">
                <i class="fa-solid fa-house"></i> Home
            </a>
            <a class="nav-login" href="${pageContext.request.contextPath}/login">
                <i class="fa-solid fa-right-to-bracket"></i> Login
            </a>
        </div>
    </nav>
</header>

<main class="main-content">

    <section class="intro">
        <div class="eyebrow">
            <i class="fa-solid fa-wand-magic-sparkles"></i>
            AI-POWERED CAREER PLATFORM
        </div>

        <h1>Start Your <span class="gradient-text">Career Journey.</span></h1>

        <p class="intro-description">
            Create your account and unlock AI-powered tools to analyze,
            improve and optimize your resume. Discover skill gaps,
            match job descriptions and prepare for interviews with confidence.
        </p>

        <div class="feature-list">
            <div class="feature">
                <span class="feature-icon"><i class="fa-solid fa-file-pdf"></i></span>
                <span><strong>Upload Your Resume</strong><br>Start with your resume in PDF format.</span>
            </div>

            <div class="feature">
                <span class="feature-icon"><i class="fa-solid fa-brain"></i></span>
                <span><strong>AI-Powered Analysis</strong><br>Explore your ATS score and resume insights.</span>
            </div>

            <div class="feature">
                <span class="feature-icon"><i class="fa-solid fa-bullseye"></i></span>
                <span><strong>Discover Skill Gaps</strong><br>Identify areas to improve for your target role.</span>
            </div>

            <div class="feature">
                <span class="feature-icon"><i class="fa-solid fa-rocket"></i></span>
                <span><strong>Grow Your Career</strong><br>Prepare for opportunities with AI assistance.</span>
            </div>
        </div>
    </section>

    <section class="register-card">
        <div class="card-top">
            <div class="register-icon"><i class="fa-solid fa-user-plus"></i></div>
            <span class="secure-label"><i class="fa-solid fa-shield-halved"></i> CREATE ACCOUNT</span>
        </div>

        <h2>Create Your Account</h2>
        <p class="card-subtitle">Join us and take the next step in your career.</p>

        <% if (success != null && !success.isEmpty()) { %>
            <div class="alert success" id="successAlert" role="status">
                <i class="fa-solid fa-circle-check"></i>
                <span><%= success %></span>
                <button type="button" class="alert-close" aria-label="Close message"
                        onclick="closeAlert('successAlert')">&times;</button>
            </div>
        <% } %>

        <% if (error != null && !error.isEmpty()) { %>
            <div class="alert error" id="errorAlert" role="alert">
                <i class="fa-solid fa-circle-exclamation"></i>
                <span><%= error %></span>
                <button type="button" class="alert-close" aria-label="Close message"
                        onclick="closeAlert('errorAlert')">&times;</button>
            </div>
        <% } %>

        <form id="registerForm"
              action="${pageContext.request.contextPath}/adduser"
              method="post">

            <%-- Required Spring Security CSRF token --%>
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}">

            <div class="form-group">
                <label for="name">Full Name</label>
                <div class="input-wrap">
                    <i class="fa-regular fa-user input-icon"></i>
                    <input class="form-input" type="text" id="name" name="name"
                           placeholder="Enter your full name" autocomplete="name"
                           maxlength="100" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <div class="input-wrap">
                    <i class="fa-regular fa-envelope input-icon"></i>
                    <input class="form-input" type="email" id="email" name="email"
                           placeholder="Enter your email address" autocomplete="email"
                           maxlength="254" required>
                </div>
            </div>

            <div class="form-group">
                <label for="password">Create Password</label>
                <div class="input-wrap">
                    <i class="fa-solid fa-lock input-icon"></i>
                    <input class="form-input" type="password" id="password" name="password"
                           placeholder="Create a strong password" autocomplete="new-password"
                           minlength="8" required>

                    <button type="button" class="password-toggle" id="togglePassword"
                            aria-label="Show password" aria-pressed="false">
                        <i class="fa-regular fa-eye" id="passwordIcon"></i>
                    </button>
                </div>

                <div class="password-strength" id="strengthContainer">
                    <div class="strength-track">
                        <div class="strength-bar" id="strengthBar"></div>
                    </div>
                    <span class="strength-label" id="strengthLabel"></span>
                </div>

                <p class="password-hint">Use at least 8 characters for your password.</p>
            </div>

            <label class="terms">
                <input type="checkbox" id="terms" required>
                <span>I confirm that the information provided is accurate and agree to use the platform responsibly.</span>
            </label>

            <button type="submit" class="register-button" id="registerButton">
                <i class="fa-solid fa-user-plus"></i>
                <span id="buttonText">Create My Account</span>
            </button>
        </form>

        <p class="login-text">
            Already have an account?
            <a href="${pageContext.request.contextPath}/login">
                Sign In <i class="fa-solid fa-arrow-right"></i>
            </a>
        </p>

        <div class="divider"></div>

        <div class="bottom-note">
            <i class="fa-solid fa-circle-check"></i>
            Your career journey starts with one step.
        </div>
    </section>

</main>

<footer class="site-footer">
    <div class="footer-main">

        <div class="footer-brand">
            <a href="${pageContext.request.contextPath}/login" class="footer-logo">
                <span class="footer-logo-icon">AI</span>
                <span>Resume<span class="footer-highlight">Analyzer</span></span>
            </a>

            <p class="footer-description">
                Build a stronger career with AI-powered resume insights,
                ATS analysis and smarter job matching.
            </p>

            <div class="footer-status">
                <span class="status-dot"></span>
                AI-Powered Career Assistance
            </div>
        </div>

        <div class="footer-column">
            <h4>Quick Links</h4>
            <a href="${pageContext.request.contextPath}/login">
                <i class="fa-solid fa-right-to-bracket"></i> &nbsp; Login
            </a>
            <a href="${pageContext.request.contextPath}/register">
                <i class="fa-solid fa-user-plus"></i> &nbsp; Create Account
            </a>
            <a href="${pageContext.request.contextPath}/forgot-password">
                <i class="fa-solid fa-key"></i> &nbsp; Forgot Password?
            </a>
        </div>

        <div class="footer-column footer-developer">
            <h4>Developed By</h4>
            <p class="developer-name">Krishnakant Patidar</p>
            <a class="developer-email" href="mailto:patidarkrishna188@gmail.com">
                <span class="developer-email-icon"><i class="fa-regular fa-envelope"></i></span>
                <span>patidarkrishna188@gmail.com</span>
            </a>
            
            <!-- Social Media Icons -->
<div class="footer-socials">
    <a href="https://www.linkedin.com/in/krishnakant-patidar-3358772b9/"
       target="_blank" rel="noopener noreferrer"
       aria-label="LinkedIn" title="LinkedIn">
        <i class="fa-brands fa-linkedin-in"></i>
    </a>

    <a href="https://krishnapatidar80.github.io/portfolio/"
       target="_blank" rel="noopener noreferrer"
       aria-label="Portfolio" title="Portfolio">
        <i class="fa-solid fa-globe"></i>
    </a>

    <a href="https://github.com/krishnapatidar80"
       target="_blank" rel="noopener noreferrer"
       aria-label="GitHub" title="GitHub">
        <i class="fa-brands fa-github"></i>
    </a>

    <a href="https://www.instagram.com/krishnapatidar188/"
       target="_blank" rel="noopener noreferrer"
       aria-label="Instagram" title="Instagram">
        <i class="fa-brands fa-instagram"></i>
    </a>
</div>
            
        </div>
        
        

    </div>

    <div class="footer-bottom">
        <p>&copy; <span id="footerYear"></span> <strong>AI Resume Analyzer</strong>. All rights reserved.</p>
        <p class="footer-tagline">Designed to help you move forward.</p>
    </div>
</footer>

<script>
    const passwordInput = document.getElementById("password");
    const togglePassword = document.getElementById("togglePassword");
    const passwordIcon = document.getElementById("passwordIcon");

    togglePassword.addEventListener("click", function () {
        const showPassword = passwordInput.type === "password";

        passwordInput.type = showPassword ? "text" : "password";
        passwordIcon.className = showPassword
            ? "fa-regular fa-eye-slash"
            : "fa-regular fa-eye";

        togglePassword.setAttribute(
            "aria-label",
            showPassword ? "Hide password" : "Show password"
        );
        togglePassword.setAttribute("aria-pressed", String(showPassword));
    });

    const strengthContainer = document.getElementById("strengthContainer");
    const strengthBar = document.getElementById("strengthBar");
    const strengthLabel = document.getElementById("strengthLabel");

    passwordInput.addEventListener("input", function () {
        const value = passwordInput.value;
        strengthContainer.style.display = value ? "block" : "none";

        if (!value) {
            strengthBar.style.width = "0";
            strengthLabel.textContent = "";
            return;
        }

        let score = 0;
        if (value.length >= 8) score++;
        if (/[A-Z]/.test(value)) score++;
        if (/[a-z]/.test(value)) score++;
        if (/[0-9]/.test(value)) score++;
        if (/[^A-Za-z0-9]/.test(value)) score++;

        if (score <= 2) {
            strengthBar.style.width = "33%";
            strengthBar.style.background = "#f87171";
            strengthLabel.textContent = "Keep strengthening your password";
        } else if (score <= 3) {
            strengthBar.style.width = "66%";
            strengthBar.style.background = "#fbbf24";
            strengthLabel.textContent = "Moderate password";
        } else {
            strengthBar.style.width = "100%";
            strengthBar.style.background = "#34d399";
            strengthLabel.textContent = "Stronger password";
        }
    });

    function closeAlert(id) {
        const element = document.getElementById(id);
        if (element) element.remove();
    }

    window.setTimeout(function () {
        closeAlert("successAlert");
        closeAlert("errorAlert");
    }, 5000);

    const registerForm = document.getElementById("registerForm");
    const registerButton = document.getElementById("registerButton");
    const buttonText = document.getElementById("buttonText");

    registerForm.addEventListener("submit", function () {
        if (!registerForm.checkValidity()) return;

        registerButton.disabled = true;
        buttonText.textContent = "Creating Account...";
        registerButton.querySelector("i").className = "fa-solid fa-spinner fa-spin";
    });

    document.getElementById("footerYear").textContent = new Date().getFullYear();
</script>

</body>
</html>