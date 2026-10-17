<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String success = (String) request.getAttribute("success");
    String error = (String) request.getAttribute("error");
    String notice = (String) request.getAttribute("notice");

    if (success == null) success = request.getParameter("success");
    if (error == null) error = request.getParameter("error");
    if (notice == null) notice = request.getParameter("notice");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | AI Resume Analyzer</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>
*{margin:0;padding:0;box-sizing:border-box}
:root{--cyan:#67e8f9;--blue:#38bdf8;--white:#f8fafc;--muted:#94a3b8;--dark:#08111f}
html{min-height:100%;scroll-behavior:smooth}
body{min-height:100vh;display:flex;flex-direction:column;overflow-x:hidden;background:var(--dark);color:var(--white);font-family:"Segoe UI",Arial,sans-serif}
a{text-decoration:none}
.video-background{position:fixed;inset:0;z-index:-3;overflow:hidden;background:#08111f}
.video-background video{width:100%;height:100%;object-fit:cover;opacity:.32}
.video-overlay{position:fixed;inset:0;z-index:-2;background:linear-gradient(115deg,rgba(5,12,25,.96),rgba(8,20,39,.84),rgba(5,12,25,.94))}
.page{width:100%;flex:1;display:flex;flex-direction:column}
.container{width:min(1180px,90%);margin:0 auto}
.header{width:100%;padding:24px 0}
.header-inner{display:flex;align-items:center;justify-content:space-between;gap:20px}
.brand{display:inline-flex;align-items:center;gap:11px;color:var(--white);font-size:21px;font-weight:750;letter-spacing:-.6px}
.brand-icon{width:42px;height:42px;display:grid;place-items:center;border-radius:12px;color:#07111f;font-size:15px;font-weight:900;background:linear-gradient(135deg,var(--cyan),var(--blue));box-shadow:0 5px 25px rgba(56,189,248,.22)}
.brand-highlight{color:var(--cyan)}
.header-link{padding:10px 18px;border:1px solid rgba(103,232,249,.35);border-radius:9px;color:var(--cyan);font-size:13px;font-weight:600;transition:.2s}
.header-link:hover{color:#08111f;background:var(--cyan)}
.main-content{width:100%;flex:1;display:flex;align-items:center;padding:45px 0 65px}
.content-grid{display:grid;grid-template-columns:1.15fr .85fr;align-items:center;gap:75px}
.hero{max-width:570px}
.eyebrow{display:inline-flex;align-items:center;gap:9px;padding:9px 14px;margin-bottom:25px;border:1px solid rgba(103,232,249,.22);border-radius:30px;color:var(--cyan);background:rgba(15,23,42,.62);font-size:12px;font-weight:650;letter-spacing:.4px}
.eyebrow-dot{width:7px;height:7px;border-radius:50%;background:#34d399;box-shadow:0 0 10px rgba(52,211,153,.7)}
.hero h1{margin-bottom:23px;color:var(--white);font-size:clamp(36px,4.2vw,57px);line-height:1.13;font-weight:800;letter-spacing:-2px}
.hero h1 span{color:var(--cyan)}
.hero-description{max-width:510px;margin-bottom:30px;color:#a7b5c8;font-size:15px;line-height:1.9}
.features{display:grid;gap:17px}
.feature{display:flex;align-items:flex-start;gap:13px}
.feature-icon{width:35px;height:35px;flex-shrink:0;display:grid;place-items:center;border:1px solid rgba(103,232,249,.2);border-radius:10px;color:var(--cyan);background:rgba(56,189,248,.09);font-size:15px}
.feature h3{margin:1px 0 5px;color:#e2e8f0;font-size:14px;font-weight:650}
.feature p{color:#8494aa;font-size:12px;line-height:1.7}
.login-card{width:100%;max-width:440px;justify-self:end;padding:37px;border:1px solid rgba(148,163,184,.2);border-radius:22px;background:rgba(10,20,37,.84);box-shadow:0 25px 80px rgba(0,0,0,.35);backdrop-filter:blur(20px)}
.login-heading{margin-bottom:8px;color:var(--white);font-size:28px;font-weight:750;letter-spacing:-.7px}
.login-subtitle{margin-bottom:27px;color:var(--muted);font-size:13px;line-height:1.7}
.alert{padding:12px 14px;margin-bottom:18px;border:1px solid transparent;border-radius:9px;font-size:12px;line-height:1.65;overflow-wrap:anywhere}
.alert-success{color:#a7f3d0;border-color:rgba(52,211,153,.25);background:rgba(16,185,129,.1)}
.alert-error{color:#fecaca;border-color:rgba(248,113,113,.25);background:rgba(239,68,68,.1)}
.alert-notice{color:#bae6fd;border-color:rgba(56,189,248,.25);background:rgba(56,189,248,.09)}
.form-group{margin-bottom:20px}
.form-label{display:block;margin-bottom:9px;color:#e2e8f0;font-size:12px;font-weight:650}
.input-wrapper{position:relative}
.form-input{width:100%;height:49px;padding:0 14px;outline:none;border:1px solid rgba(148,163,184,.22);border-radius:10px;color:var(--white);background:rgba(15,23,42,.78);font-family:inherit;font-size:13px;transition:border-color .2s,box-shadow .2s}
.form-input::placeholder{color:#64748b}
.form-input:focus{border-color:var(--blue);box-shadow:0 0 0 3px rgba(56,189,248,.1)}
.password-input{padding-right:75px}
.toggle-password{position:absolute;top:50%;right:13px;transform:translateY(-50%);padding:5px;border:none;color:var(--cyan);background:transparent;cursor:pointer;font-family:inherit;font-size:11px;font-weight:650}
.toggle-password:hover{color:white}
.form-options{display:flex;align-items:center;justify-content:space-between;gap:10px;margin:3px 0 24px}
.remember-option{display:inline-flex;align-items:center;gap:7px;color:#a7b5c8;font-size:11px;cursor:pointer}
.remember-option input{accent-color:var(--blue)}
.forgot-link{color:var(--cyan);font-size:11px;font-weight:600}
.forgot-link:hover{text-decoration:underline}
.login-button{width:100%;min-height:49px;display:flex;align-items:center;justify-content:center;gap:10px;border:none;border-radius:10px;color:#07111f;background:linear-gradient(110deg,var(--cyan),var(--blue));box-shadow:0 9px 25px rgba(56,189,248,.17);font-family:inherit;font-size:13px;font-weight:750;cursor:pointer;transition:transform .2s,box-shadow .2s}
.login-button:hover{transform:translateY(-2px);box-shadow:0 12px 30px rgba(56,189,248,.28)}
.login-divider{display:flex;align-items:center;gap:12px;margin:23px 0 17px;color:#94a3b8;font-size:10px;font-weight:700;letter-spacing:1px;white-space:nowrap}
.login-divider::before,.login-divider::after{content:"";height:1px;flex:1;background:rgba(148,163,184,.22)}
.google-login-button{width:100%;min-height:48px;display:flex;align-items:center;justify-content:center;gap:12px;padding:11px 16px;border:1px solid rgba(148,163,184,.3);border-radius:10px;color:#f8fafc;background:rgba(15,23,42,.78);font-family:inherit;font-size:13px;font-weight:650;text-decoration:none;transition:border-color .2s,background .2s,transform .2s}
.google-login-button:hover{border-color:rgba(103,232,249,.65);background:rgba(30,41,59,.95);transform:translateY(-1px)}
.google-login-button img{display:block;flex-shrink:0}
.register-prompt{margin-top:24px;color:var(--muted);text-align:center;font-size:12px;line-height:1.8}
.register-prompt a{color:var(--cyan);font-weight:700}
.register-prompt a:hover{text-decoration:underline}
.security-note{display:flex;align-items:center;justify-content:center;gap:7px;margin-top:20px;color:#64748b;font-size:10px}
.site-footer{position:relative;z-index:2;width:100%;padding:0 5%;color:#cbd5e1;background:rgba(8,15,30,.96);border-top:1px solid rgba(103,232,249,.2);backdrop-filter:blur(18px)}
.footer-main{width:min(1180px,100%);margin:0 auto;padding:38px 0 30px;display:grid;grid-template-columns:1.7fr .8fr 1.2fr;gap:55px}
.footer-logo{display:inline-flex;align-items:center;gap:10px;color:var(--white);font-size:19px;font-weight:750;letter-spacing:-.5px}
.footer-logo-icon{width:38px;height:38px;display:inline-grid;place-items:center;border-radius:11px;color:#07111f;background:linear-gradient(135deg,var(--cyan),var(--blue));font-size:14px;font-weight:900}
.footer-highlight{color:var(--cyan)}
.footer-description{max-width:350px;margin:16px 0;color:#94a3b8;font-size:12px;line-height:1.9}
.footer-status{display:inline-flex;align-items:center;gap:8px;padding:8px 11px;border:1px solid rgba(148,163,184,.17);border-radius:30px;color:#cbd5e1;background:rgba(15,23,42,.75);font-size:10px}
.status-dot{width:7px;height:7px;border-radius:50%;background:#34d399;box-shadow:0 0 10px rgba(52,211,153,.6)}
.footer-column{display:flex;flex-direction:column;align-items:flex-start;gap:12px}
.footer-column h4{margin:7px 0 8px;color:#f8fafc;font-size:13px;font-weight:700;letter-spacing:.3px}
.footer-column>a{color:#94a3b8;font-size:12px;transition:color .2s,transform .2s}
.footer-column>a:hover{color:var(--cyan);transform:translateX(3px)}
.developer-name{color:#f1f5f9;font-size:14px;font-weight:700}
.footer-column .developer-email{display:inline-flex;align-items:flex-start;gap:8px;max-width:100%;margin-top:2px;color:var(--cyan);font-size:12px;overflow-wrap:anywhere;word-break:break-word}
.developer-email:hover{color:white;text-decoration:underline}
.footer-bottom{width:min(1180px,100%);min-height:60px;margin:0 auto;padding:17px 0;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:12px;border-top:1px solid rgba(148,163,184,.14)}
.footer-bottom p{color:#64748b;font-size:11px;line-height:1.7}
.footer-bottom strong{color:#cbd5e1;font-weight:600}
.footer-tagline{color:#94a3b8!important}
@media(max-width:900px){.content-grid{grid-template-columns:1fr .9fr;gap:35px}.login-card{padding:28px}.footer-main{grid-template-columns:1.4fr 1fr;gap:35px}.footer-brand{grid-column:1/-1}}
@media(max-width:700px){.header{padding:18px 0}.brand{font-size:18px}.brand-icon{width:37px;height:37px}.main-content{padding:35px 0 45px}.content-grid{grid-template-columns:1fr;gap:38px}.hero{max-width:100%}.hero h1{font-size:clamp(34px,9vw,48px)}.hero-description{font-size:14px}.login-card{justify-self:center;max-width:480px}.footer-main{grid-template-columns:1fr;gap:27px;padding:30px 0}.footer-brand{grid-column:auto}}
@media(max-width:420px){.container{width:90%}.header-link{padding:9px 12px;font-size:11px}.brand{gap:8px;font-size:16px}.login-card{padding:23px 19px;border-radius:17px}.login-heading{font-size:25px}.form-options{align-items:flex-start}.footer-bottom{align-items:flex-start;flex-direction:column;gap:7px}}
@media(prefers-reduced-motion:reduce){*,*::before,*::after{scroll-behavior:auto!important;transition-duration:.01ms!important}}



/* Premium animated video background */
.video-background {
    position: fixed;
    inset: 0;
    z-index: 0;
    overflow: hidden;
    background: #08111f;
    pointer-events: none;
}

.video-background video {
    width: 100%;
    height: 100%;
    display: block;
    object-fit: cover;
    object-position: center;
    opacity: 0.38;
    filter: saturate(0.8) contrast(1.08);
}

.video-overlay {
    position: fixed;
    inset: 0;
    z-index: 1;
    pointer-events: none;
    background:
        linear-gradient(90deg,
            rgba(4, 11, 25, 0.94) 0%,
            rgba(5, 15, 32, 0.78) 48%,
            rgba(4, 11, 25, 0.90) 100%),
        linear-gradient(0deg,
            rgba(4, 11, 25, 0.88),
            rgba(4, 11, 25, 0.18));
}

.video-glow {
    position: fixed;
    z-index: 1;
    width: 380px;
    height: 380px;
    border-radius: 50%;
    pointer-events: none;
    filter: blur(100px);
    opacity: 0.15;
    animation: glowDrift 12s ease-in-out infinite alternate;
}

.glow-left {
    top: 12%;
    left: -190px;
    background: #06b6d4;
}

.glow-right {
    right: -190px;
    bottom: 8%;
    background: #2563eb;
    animation-delay: -5s;
}

/* Keep every page element above the background */
.page,
.site-footer {
    position: relative;
    z-index: 2;
}

.header,
.main-content {
    position: relative;
    z-index: 2;
}

@keyframes glowDrift {
    from {
        transform: translate3d(0, -15px, 0) scale(0.95);
    }
    to {
        transform: translate3d(30px, 20px, 0) scale(1.12);
    }
}

@media (max-width: 700px) {
    .video-background video {
        object-position: 58% center;
        opacity: 0.30;
    }

    .video-glow {
        width: 240px;
        height: 240px;
        filter: blur(75px);
    }
}

@media (prefers-reduced-motion: reduce) {
    .video-glow {
        animation: none;
    }
}





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
    <video id="loginBackgroundVideo"
           autoplay muted loop playsinline
           preload="metadata">
        <source
            src="${pageContext.request.contextPath}/videos/login-background.mp4"
            type="video/mp4">
    </video>
</div>

<div class="video-overlay" aria-hidden="true"></div>
<div class="video-glow glow-left" aria-hidden="true"></div>
<div class="video-glow glow-right" aria-hidden="true"></div>


<div class="page">

<header class="header">
    <div class="container header-inner">
        <a href="${pageContext.request.contextPath}/login" class="brand">
            <span class="brand-icon">AI</span>
            <span>Resume<span class="brand-highlight">Analyzer</span></span>
        </a>
        <a href="${pageContext.request.contextPath}/register" class="header-link">Create Account</a>
    </div>
</header>

<main class="main-content">
<div class="container content-grid">

<section class="hero">
    <div class="eyebrow"><span class="eyebrow-dot"></span> YOUR CAREER, ENHANCED BY AI</div>
    <h1>Turn Your Resume Into <span>Opportunity.</span></h1>
    <p class="hero-description">
        Get actionable insights into your resume, understand ATS compatibility,
        discover skill gaps, and prepare for your next career opportunity with
        AI-powered assistance.
    </p>

    <div class="features">
        <div class="feature">
            <div class="feature-icon">&#10003;</div>
            <div><h3>AI Resume Analysis</h3><p>Identify strengths, weaknesses and opportunities to improve your resume.</p></div>
        </div>
        <div class="feature">
            <div class="feature-icon">&#9733;</div>
            <div><h3>ATS Compatibility Insights</h3><p>Understand how your resume aligns with applicant tracking systems.</p></div>
        </div>
        <div class="feature">
            <div class="feature-icon">&#8594;</div>
            <div><h3>Smarter Job Matching</h3><p>Compare your skills with job descriptions and identify areas for growth.</p></div>
        </div>
    </div>
</section>

<section class="login-card">
    <h2 class="login-heading">Welcome Back</h2>
    <p class="login-subtitle">Sign in to continue your career journey.</p>

    <% if (success != null && !success.trim().isEmpty()) { %>
        <div class="alert alert-success" role="status"><%= HtmlUtils.htmlEscape(success) %></div>
    <% } %>
    <% if (error != null && !error.trim().isEmpty()) { %>
        <div class="alert alert-error" role="alert"><%= HtmlUtils.htmlEscape(error) %></div>
    <% } %>
    <% if (notice != null && !notice.trim().isEmpty()) { %>
        <div class="alert alert-notice" role="status"><%= HtmlUtils.htmlEscape(notice) %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/checkuser" method="post">

        <%-- Spring Security CSRF token --%>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

        <div class="form-group">
            <label class="form-label" for="email">Email Address</label>
            <input class="form-input" type="email" id="email" name="email"
                   placeholder="Enter your email address" autocomplete="email"
                   maxlength="254" required>
        </div>

        <div class="form-group">
            <label class="form-label" for="password">Password</label>
            <div class="input-wrapper">
                <input class="form-input password-input" type="password"
                       id="password" name="password"
                       placeholder="Enter your password"
                       autocomplete="current-password" required>
                <button class="toggle-password" type="button"
                        id="togglePassword" aria-controls="password"
                        aria-pressed="false">Show</button>
            </div>
        </div>

        <div class="form-options">
            <label class="remember-option">
                <input type="checkbox" name="rememberMe" value="true">
                Remember me
            </label>
            <a class="forgot-link" href="${pageContext.request.contextPath}/forgot-password">Forgot password?</a>
        </div>

        <button class="login-button" type="submit">
            Sign In <span aria-hidden="true">&#8594;</span>
        </button>
    </form>

    <div class="login-divider" aria-hidden="true">OR CONTINUE WITH</div>

    <a class="google-login-button"
       href="${pageContext.request.contextPath}/oauth2/authorization/google">
        <img src="https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google.svg"
             alt="" width="20" height="20">
        <span>Continue with Google</span>
    </a>

    <p class="register-prompt">
        Don't have an account?
        <a href="${pageContext.request.contextPath}/register">Create one</a>
    </p>

    <div class="security-note"><span aria-hidden="true">&#128274;</span> Sign in to access your resume workspace</div>
</section>

</div>
</main>
</div>

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
            <div class="footer-status"><span class="status-dot"></span> AI-Powered Career Assistance</div>
        </div>

        <div class="footer-column">
            <h4>Quick Links</h4>
            <a href="${pageContext.request.contextPath}/login">Login</a>
            <a href="${pageContext.request.contextPath}/register">Create Account</a>
            <a href="${pageContext.request.contextPath}/forgot-password">Forgot Password?</a>
        </div>

        <div class="footer-column footer-developer">
            <h4>Developed By</h4>
            <p class="developer-name">Krishnakant Patidar</p>
            <a class="developer-email" href="mailto:patidarkrishna188@gmail.com">
                <span aria-hidden="true">&#9993;</span>
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

togglePassword.addEventListener("click", function () {
    const showPassword = passwordInput.type === "password";
    passwordInput.type = showPassword ? "text" : "password";
    togglePassword.textContent = showPassword ? "Hide" : "Show";
    togglePassword.setAttribute("aria-pressed", String(showPassword));
});

document.getElementById("footerYear").textContent = new Date().getFullYear();
</script>

</body>
</html>