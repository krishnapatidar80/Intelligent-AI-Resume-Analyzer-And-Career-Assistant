<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>AI Resume Rewriter | AI Resume Analyzer</title>

<style>
:root {
    --primary: #0f766e;
    --primary-dark: #115e59;
    --accent: #2dd4bf;
    --text: #e2e8f0;
    --muted: #94a3b8;
    --panel: rgba(15, 23, 42, .82);
    --border: rgba(148, 163, 184, .2);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}

html {
    scroll-behavior: smooth;
}

body {
    min-height: 100vh;
    color: var(--text);
    background: #07111f;
    overflow-x: hidden;
}

/* ANIMATED BACKGROUND */

.background {
    position: fixed;
    inset: 0;
    z-index: -2;
    overflow: hidden;
    background:
        radial-gradient(ellipse at 15% 15%, rgba(13,148,136,.25), transparent 40%),
        radial-gradient(ellipse at 85% 25%, rgba(37,99,235,.18), transparent 35%),
        radial-gradient(ellipse at 50% 100%, rgba(20,184,166,.12), transparent 40%),
        #07111f;
}

.background::before {
    content: "";
    position: absolute;
    inset: -50%;
    background-image:
        linear-gradient(rgba(45,212,191,.055) 1px, transparent 1px),
        linear-gradient(90deg, rgba(45,212,191,.055) 1px, transparent 1px);
    background-size: 48px 48px;
    transform: perspective(600px) rotateX(35deg);
    animation: gridMove 18s linear infinite;
}

.orb {
    position: absolute;
    width: 280px;
    height: 280px;
    border-radius: 50%;
    filter: blur(85px);
    opacity: .3;
    animation: floatOrb 12s ease-in-out infinite alternate;
}

.orb-one {
    background: #0d9488;
    top: 15%;
    left: -130px;
}

.orb-two {
    background: #2563eb;
    top: 45%;
    right: -150px;
    animation-delay: -5s;
}

.orb-three {
    width: 180px;
    height: 180px;
    background: #14b8a6;
    bottom: -80px;
    left: 45%;
    animation-delay: -3s;
}

@keyframes gridMove {
    from { background-position: 0 0; }
    to { background-position: 48px 48px; }
}

@keyframes floatOrb {
    from { transform: translate(0, 0) scale(1); }
    to { transform: translate(55px, -35px) scale(1.15); }
}

/* NAVBAR */

.navbar {
    position: sticky;
    top: 0;
    z-index: 1000;
    padding: 0 5%;
    color: white;
    background: rgba(7, 17, 31, .91);
    border-bottom: 1px solid rgba(45,212,191,.2);
    box-shadow: 0 8px 30px rgba(0,0,0,.2);
    backdrop-filter: blur(18px);
}

.navbar-top {
    min-height: 64px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 18px;
}

.logo {
    color: white;
    font-size: 21px;
    font-weight: 750;
    white-space: nowrap;
    letter-spacing: -.4px;
}

.logo span {
    color: var(--accent);
}

.top-user {
    display: flex;
    align-items: center;
    gap: 10px;
}

.user-name {
    max-width: 240px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    background: rgba(255,255,255,.07);
    border: 1px solid var(--border);
    padding: 8px 13px;
    border-radius: 30px;
    font-size: 13px;
}

.logout {
    background: #dc2626;
    color: white !important;
    text-decoration: none;
    padding: 9px 14px;
    border-radius: 8px;
    font-size: 13px;
    font-weight: 650;
    white-space: nowrap;
    transition: .25s;
}

.logout:hover {
    background: #b91c1c;
    transform: translateY(-2px);
}

.nav-links {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 5px;
    padding: 8px 0 11px;
    overflow-x: auto;
    scrollbar-width: none;
}

.nav-links::-webkit-scrollbar {
    display: none;
}

.nav-links a {
    color: #cbd5e1;
    text-decoration: none;
    font-size: 12.5px;
    font-weight: 600;
    padding: 9px 11px;
    border-radius: 8px;
    white-space: nowrap;
    transition: .25s;
}

.nav-links a:hover {
    color: white;
    background: rgba(45,212,191,.12);
}

.nav-links a.active {
    color: #99f6e4;
    background: rgba(13,148,136,.2);
    border: 1px solid rgba(45,212,191,.2);
}

/* MAIN CONTAINER */

.container {
    position: relative;
    width: 90%;
    max-width: 1120px;
    margin: 48px auto 0;
}

/* HEADER */

.page-header {
    text-align: center;
    margin-bottom: 32px;
    animation: fadeUp .65s ease both;
}

.eyebrow {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: #99f6e4;
    background: rgba(13,148,136,.12);
    border: 1px solid rgba(45,212,191,.22);
    padding: 8px 14px;
    border-radius: 30px;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
}

.pulse-dot {
    width: 7px;
    height: 7px;
    background: #2dd4bf;
    border-radius: 50%;
    box-shadow: 0 0 12px #2dd4bf;
}

.page-header .icon {
    width: 76px;
    height: 76px;
    margin: 19px auto 15px;
    border-radius: 23px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 35px;
    background: linear-gradient(135deg, rgba(13,148,136,.35), rgba(37,99,235,.25));
    border: 1px solid rgba(45,212,191,.3);
    box-shadow: 0 0 35px rgba(13,148,136,.16);
    animation: iconFloat 3.5s ease-in-out infinite;
}

.page-header h1 {
    font-size: clamp(28px, 4vw, 42px);
    line-height: 1.2;
    letter-spacing: -1.1px;
    color: #f8fafc;
}

.page-header h1 span {
    color: #5eead4;
}

.page-header p {
    max-width: 660px;
    margin: 13px auto 0;
    color: #a7b5c8;
    font-size: 15px;
    line-height: 1.8;
}

@keyframes iconFloat {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-7px); }
}

@keyframes fadeUp {
    from { opacity: 0; transform: translateY(18px); }
    to { opacity: 1; transform: translateY(0); }
}

/* MAIN CARD */

.card {
    position: relative;
    padding: 34px;
    border: 1px solid var(--border);
    border-radius: 20px;
    background: var(--panel);
    box-shadow: 0 25px 75px rgba(0,0,0,.27);
    backdrop-filter: blur(18px);
    animation: fadeUp .8s ease both;
}

.card::before {
    content: "";
    position: absolute;
    top: 0;
    left: 8%;
    right: 8%;
    height: 1px;
    background: linear-gradient(90deg, transparent, #2dd4bf, transparent);
}

.card-heading {
    display: flex;
    align-items: center;
    gap: 13px;
    margin-bottom: 23px;
}

.card-heading-icon {
    width: 45px;
    height: 45px;
    flex-shrink: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    border-radius: 13px;
    background: rgba(13,148,136,.16);
    border: 1px solid rgba(45,212,191,.2);
}

.card-heading h2 {
    color: #f8fafc;
    font-size: 20px;
}

.card-heading p {
    margin-top: 4px;
    color: var(--muted);
    font-size: 13px;
}

/* INFO BOX */

.info-box {
    display: flex;
    gap: 15px;
    align-items: flex-start;
    background: rgba(13,148,136,.09);
    border: 1px solid rgba(45,212,191,.18);
    border-radius: 12px;
    padding: 18px;
    margin-bottom: 28px;
}

.info-icon {
    font-size: 23px;
    flex-shrink: 0;
}

.info-box h3 {
    color: #99f6e4;
    font-size: 15px;
    margin-bottom: 7px;
}

.info-box p {
    color: #b7c6d8;
    font-size: 13px;
    line-height: 1.8;
}

/* FORM */

.form-group {
    margin-bottom: 23px;
    min-width: 0;
}

label {
    display: block;
    font-size: 13px;
    font-weight: 700;
    color: #e2e8f0;
    margin-bottom: 10px;
}

.required {
    color: #fb7185;
}

select,
input,
textarea {
    display: block;
    width: 100%;
    padding: 14px 15px;
    border: 1px solid #334155;
    border-radius: 10px;
    font-size: 14px;
    color: #e2e8f0;
    background: rgba(15,23,42,.82);
    outline: none;
    transition: border-color .25s, box-shadow .25s, background .25s;
}

select option {
    color: #e2e8f0;
    background: #0f172a;
}

input::placeholder,
textarea::placeholder {
    color: #718096;
}

select:focus,
input:focus,
textarea:focus {
    border-color: #2dd4bf;
    background: rgba(15,23,42,.98);
    box-shadow: 0 0 0 3px rgba(45,212,191,.1);
}

textarea {
    min-height: 135px;
    resize: vertical;
    line-height: 1.7;
}

.helper-text {
    margin-top: 8px;
    font-size: 12px;
    color: #94a3b8;
    line-height: 1.6;
}

.two-column {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

/* SUBMIT BUTTON */

.button-area {
    display: flex;
    justify-content: center;
    margin-top: 8px;
}

.rewrite-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    min-width: 265px;
    border: 1px solid rgba(153,246,228,.4);
    background: linear-gradient(135deg, #0f766e, #0d9488);
    color: white;
    padding: 15px 25px;
    border-radius: 10px;
    font-size: 14px;
    font-weight: 750;
    cursor: pointer;
    transition: .3s;
    box-shadow: 0 8px 25px rgba(13,148,136,.2);
}

.rewrite-btn:hover {
    background: linear-gradient(135deg, #115e59, #0f766e);
    transform: translateY(-3px);
    box-shadow: 0 13px 30px rgba(13,148,136,.3);
}

.rewrite-btn:disabled {
    cursor: wait;
    opacity: .75;
    transform: none;
}

/* LOADING */

.loading {
    display: none;
    text-align: center;
    margin-top: 22px;
    color: #99f6e4;
    font-size: 13px;
    line-height: 1.8;
}

.spinner {
    display: inline-block;
    width: 17px;
    height: 17px;
    border: 2px solid rgba(45,212,191,.25);
    border-top-color: #2dd4bf;
    border-radius: 50%;
    animation: spin .8s linear infinite;
    vertical-align: middle;
    margin-right: 8px;
}

@keyframes spin {
    to { transform: rotate(360deg); }
}

/* FEATURE CARDS */

.features-title {
    margin-top: 35px;
    margin-bottom: 16px;
    color: #dbeafe;
    font-size: 15px;
    font-weight: 700;
}

.features {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 15px;
}

.feature {
    position: relative;
    overflow: hidden;
    background: rgba(15,23,42,.63);
    border: 1px solid var(--border);
    border-radius: 13px;
    padding: 22px 17px;
    transition: .3s;
}

.feature:hover {
    transform: translateY(-4px);
    border-color: rgba(45,212,191,.45);
    background: rgba(13,148,136,.09);
}

.feature-icon {
    width: 43px;
    height: 43px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    background: rgba(255,255,255,.05);
    border-radius: 12px;
    margin-bottom: 15px;
}

.feature h4 {
    font-size: 14px;
    color: #f1f5f9;
    margin-bottom: 8px;
}

.feature p {
    font-size: 12px;
    color: #94a3b8;
    line-height: 1.8;
}

/* PRIVACY NOTE */

.privacy-note {
    margin-top: 23px;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    color: #94a3b8;
    font-size: 12px;
    text-align: center;
    line-height: 1.7;
}

/* FOOTER */

.footer {
    text-align: center;
    margin-top: 38px;
    padding: 22px 10px 28px;
    border-top: 1px solid rgba(148,163,184,.12);
    color: #8292a8;
    font-size: 12px;
    line-height: 1.9;
}

.footer strong {
    color: #cbd5e1;
}

/* RESPONSIVE */

@media(max-width: 1000px) {
    .navbar {
        padding: 0 20px;
    }

    .nav-links {
        justify-content: flex-start;
    }

    .container {
        width: 92%;
    }
}

@media(max-width: 700px) {
    .navbar-top {
        flex-wrap: wrap;
        padding: 12px 0 8px;
        gap: 12px;
    }

    .logo {
        font-size: 19px;
    }

    .top-user {
        gap: 7px;
    }

    .user-name {
        max-width: 150px;
        font-size: 12px;
    }

    .nav-links {
        justify-content: flex-start;
        padding-top: 6px;
    }

    .nav-links a {
        font-size: 12px;
        padding: 8px 10px;
    }

    .container {
        width: 94%;
        margin-top: 32px;
    }

    .card {
        padding: 22px 18px;
        border-radius: 15px;
    }

    .two-column,
    .features {
        grid-template-columns: 1fr;
        gap: 0;
    }

    .features {
        gap: 12px;
    }

    .page-header h1 {
        font-size: 29px;
    }

    .page-header p {
        font-size: 13px;
    }

    .button-area {
        display: block;
    }

    .rewrite-btn {
        width: 100%;
        min-width: 0;
    }

    .info-box {
        padding: 15px;
    }

    .card-heading h2 {
        font-size: 18px;
    }
}

@media(prefers-reduced-motion: reduce) {
    *,
    *::before,
    *::after {
        animation-duration: .01ms !important;
        animation-iteration-count: 1 !important;
        scroll-behavior: auto !important;
        transition-duration: .01ms !important;
    }
}
</style>
</head>

<body>

<div class="background" aria-hidden="true">
    <div class="orb orb-one"></div>
    <div class="orb orb-two"></div>
    <div class="orb orb-three"></div>
</div>

<!-- NAVBAR -->
<nav class="navbar">
    <div class="navbar-top">

        <div class="logo">
            🤖 AI Resume <span>Analyzer</span>
        </div>

        <div class="top-user">
            <span class="user-name">
                👋 Hi, <c:out value="${user.name}" default="User"/>
            </span>

            <a class="logout"
               href="${pageContext.request.contextPath}/logout">
                🚪 Logout
            </a>
        </div>

    </div>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/home">🏠 Home</a>
        <a href="${pageContext.request.contextPath}/upload_resume">📄 Analyze Resume</a>
        <a href="${pageContext.request.contextPath}/resume-history">📊 Resume History</a>
        <a class="active" href="${pageContext.request.contextPath}/resume-rewriter">✨ AI Resume Rewriter</a>
        <a href="${pageContext.request.contextPath}/job-matching">💼 Job Matching</a>
        <a href="${pageContext.request.contextPath}/interview-questions">🎯 Interview Questions</a>
        <a href="${pageContext.request.contextPath}/home#features">✨ Features</a>
        <a href="${pageContext.request.contextPath}/home#how-it-works">⚙️ How It Works</a>
    </div>
</nav>

<!-- MAIN CONTENT -->
<main class="container">

    <header class="page-header">

        <div class="eyebrow">
            <span class="pulse-dot"></span>
            AI-Powered Career Tool
        </div>

        <div class="icon">✨</div>

        <h1>AI Resume <span>Rewriter</span></h1>

        <p>
            Transform your existing resume into a clear, professional
            and ATS-friendly document tailored to your career goals.
        </p>

    </header>

    <section class="card">

        <div class="card-heading">
            <div class="card-heading-icon">🪄</div>
            <div>
                <h2>Rewrite Your Resume</h2>
                <p>Choose your resume and provide optional job details.</p>
            </div>
        </div>

        <div class="info-box">
            <div class="info-icon">💡</div>
            <div>
                <h3>How AI Resume Rewriter Works</h3>
                <p>
                    Select your existing resume and optionally enter a target
                    job title and job description. Gemini AI can improve
                    professional wording, clarity, structure and ATS
                    readability while keeping the content based on your
                    actual skills and experience.
                </p>
            </div>
        </div>

        <form
            id="rewriteForm"
            action="${pageContext.request.contextPath}/rewrite-resume"
            method="post"
            onsubmit="return showLoading();">

            <!-- CSRF TOKEN: ADDED FOR SPRING SECURITY -->
            <c:if test="${not empty _csrf}">
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}" />
            </c:if>

            <div class="form-group">

                <label for="resumeId">
                    Select Resume <span class="required">*</span>
                </label>

                <select id="resumeId" name="resumeId" required>
                    <option value="">-- Select your resume --</option>

                    <c:forEach var="resume" items="${resumes}">
                        <option value="${resume.id}">
                            <c:out value="${resume.fileName}"/>
                        </option>
                    </c:forEach>

                </select>

                <div class="helper-text">
                    Select the resume you want Gemini AI to rewrite.
                </div>

            </div>

            <div class="two-column">

                <div class="form-group">

                    <label for="jobTitle">Target Job Title</label>

                    <input
                        type="text"
                        id="jobTitle"
                        name="jobTitle"
                        maxlength="150"
                        placeholder="Example: Java Developer">

                    <div class="helper-text">
                        Optional — helps tailor the resume to your target role.
                    </div>

                </div>

                <div class="form-group">

                    <label for="jobDescription">Job Description</label>

                    <textarea
                        id="jobDescription"
                        name="jobDescription"
                        maxlength="15000"
                        placeholder="Paste the job description here (optional)..."></textarea>

                    <div class="helper-text">
                        Optional — include job requirements for more relevant
                        wording and keywords.
                    </div>

                </div>

            </div>

            <div class="button-area">
                <button id="rewriteButton" type="submit" class="rewrite-btn">
                    <span>✨</span>
                    <span>Rewrite Resume with AI</span>
                    <span>→</span>
                </button>
            </div>

            <div id="loading" class="loading" role="status" aria-live="polite">
                <span class="spinner"></span>
                Gemini AI is rewriting your resume. Please wait...
            </div>

        </form>

        <div class="privacy-note">
            🔒 Your resume should be processed only through your application's
            authorized backend.
        </div>

    </section>

    <h3 class="features-title">What AI Rewriting Can Help With</h3>

    <section class="features">

        <article class="feature">
            <div class="feature-icon">📝</div>
            <h4>Professional Writing</h4>
            <p>
                Improve grammar, sentence clarity, wording and professional
                presentation.
            </p>
        </article>

        <article class="feature">
            <div class="feature-icon">🎯</div>
            <h4>ATS-Friendly Structure</h4>
            <p>
                Make sections clearer and highlight relevant keywords
                supported by your experience.
            </p>
        </article>

        <article class="feature">
            <div class="feature-icon">🛡️</div>
            <h4>Fact-Preserving Content</h4>
            <p>
                Keep your resume grounded in your real skills, projects
                and professional experience.
            </p>
        </article>

    </section>

    <footer class="footer">
        <div>Intelligent AI Resume Analyzer and Career Assistant</div>
        <div>Developed by <strong>Krishnakant Patidar</strong></div>
    </footer>

</main>

<script>
function showLoading() {
    const resumeSelect = document.getElementById("resumeId");
    const loading = document.getElementById("loading");
    const button = document.getElementById("rewriteButton");

    if (!resumeSelect.value) {
        resumeSelect.focus();
        return false;
    }

    loading.style.display = "block";
    button.disabled = true;

    button.innerHTML =
        '<span class="spinner"></span><span>Rewriting Resume...</span>';

    return true;
}
</script>

</body>
</html>