<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Upload Resume | AI Resume Analyzer</title>

<style>
*{margin:0;padding:0;box-sizing:border-box}
html{scroll-behavior:smooth;scroll-padding-top:110px}
body{font-family:Arial,Helvetica,sans-serif;background:#020617;color:#fff;overflow-x:hidden}
a{text-decoration:none}
button,input{font:inherit}

/* NAVBAR */
.navbar{position:sticky;top:0;z-index:9999;background:rgba(2,6,23,.94);backdrop-filter:blur(20px);border-bottom:1px solid rgba(255,255,255,.08)}
.navbar-top{width:min(1400px,94%);min-height:64px;margin:auto;display:flex;align-items:center;justify-content:space-between;gap:15px}
.logo{font-size:20px;font-weight:800;white-space:nowrap;background:linear-gradient(90deg,#60a5fa,#22d3ee,#a78bfa);-webkit-background-clip:text;background-clip:text;color:transparent}
.top-user{display:flex;align-items:center;gap:10px;min-width:0}
.user-name{padding:8px 14px;border-radius:30px;color:#dbeafe;background:rgba(37,99,235,.12);border:1px solid rgba(96,165,250,.18);font-size:13px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width:240px}
.logout{padding:8px 14px;border-radius:9px;color:#fff;background:linear-gradient(135deg,#ef4444,#dc2626);font-size:13px;font-weight:700;transition:.3s;white-space:nowrap}
.logout:hover{transform:translateY(-2px);box-shadow:0 10px 25px rgba(239,68,68,.35)}
.nav-links{width:min(1400px,94%);margin:auto;display:flex;justify-content:center;gap:5px;padding:5px 0 10px;overflow-x:auto;scrollbar-width:none;-webkit-overflow-scrolling:touch}
.nav-links::-webkit-scrollbar{display:none}
.nav-links a{color:#cbd5e1;font-size:12px;font-weight:600;padding:8px 11px;border-radius:8px;white-space:nowrap;flex-shrink:0;transition:.3s}
.nav-links a:hover{color:#fff;background:rgba(37,99,235,.18)}
.nav-links a.active{color:#fff;background:linear-gradient(135deg,#2563eb,#7c3aed);box-shadow:0 5px 20px rgba(37,99,235,.3)}

/* UPLOAD SECTION */
.upload-section{position:relative;isolation:isolate;min-height:calc(100vh - 150px);padding:65px 20px 75px;background:radial-gradient(circle at 5% 10%,rgba(37,99,235,.20),transparent 30%),radial-gradient(circle at 95% 80%,rgba(124,58,237,.19),transparent 30%),#030712;overflow:hidden}
.upload-section::before{content:"";position:absolute;inset:-50%;z-index:-1;background-image:linear-gradient(rgba(255,255,255,.035) 1px,transparent 1px),linear-gradient(90deg,rgba(255,255,255,.035) 1px,transparent 1px);background-size:45px 45px;transform:perspective(500px) rotateX(55deg);animation:gridMove 14s linear infinite;pointer-events:none}
@keyframes gridMove{from{transform:perspective(500px) rotateX(55deg) translateY(0)}to{transform:perspective(500px) rotateX(55deg) translateY(45px)}}
.section-heading{text-align:center;max-width:760px;margin:0 auto 35px}
.section-badge{display:inline-block;padding:8px 14px;margin-bottom:16px;border-radius:30px;color:#c4b5fd;background:rgba(124,58,237,.10);border:1px solid rgba(167,139,250,.25);font-size:11px;font-weight:800;letter-spacing:.7px}
.section-heading h1{font-size:clamp(30px,4vw,44px);line-height:1.2;margin-bottom:14px;overflow-wrap:anywhere}
.section-heading h1 span{background:linear-gradient(90deg,#60a5fa,#22d3ee,#a78bfa);-webkit-background-clip:text;background-clip:text;color:transparent}
.section-heading p{color:#94a3b8;font-size:14px;line-height:1.8}

/* MAIN LAYOUT */
.upload-layout{width:min(1060px,100%);margin:auto;display:grid;grid-template-columns:minmax(0,1.35fr) minmax(250px,.65fr);gap:22px;align-items:stretch}
.upload-card{min-width:0;padding:27px;border-radius:24px;background:linear-gradient(145deg,rgba(15,23,42,.97),rgba(8,15,32,.96));border:1px solid rgba(96,165,250,.18);box-shadow:0 25px 70px rgba(0,0,0,.35)}
.card-top{display:flex;align-items:center;gap:13px;margin-bottom:22px;padding-bottom:20px;border-bottom:1px solid rgba(255,255,255,.08)}
.card-icon{width:48px;height:48px;flex:0 0 auto;display:grid;place-items:center;border-radius:14px;background:linear-gradient(135deg,rgba(37,99,235,.22),rgba(124,58,237,.22));border:1px solid rgba(96,165,250,.22);font-size:23px}
.card-top h3{font-size:17px;margin-bottom:6px}
.card-top p{font-size:12px;color:#94a3b8;line-height:1.6;overflow-wrap:anywhere}
.secure-badge{margin-left:auto;align-self:flex-start;white-space:nowrap;padding:7px 9px;border-radius:20px;background:rgba(34,197,94,.08);border:1px solid rgba(34,197,94,.2);color:#86efac;font-size:9px;font-weight:800}

/* USER INFO */
.user-strip{display:flex;align-items:center;gap:11px;padding:13px 15px;margin-bottom:20px;border-radius:13px;background:rgba(37,99,235,.07);border:1px solid rgba(96,165,250,.14);min-width:0}
.user-avatar{width:39px;height:39px;flex:0 0 auto;display:grid;place-items:center;border-radius:12px;background:linear-gradient(135deg,#2563eb,#7c3aed);font-size:18px}
.user-details{min-width:0}
.user-details small{display:block;color:#94a3b8;font-size:10px;margin-bottom:5px;letter-spacing:.5px}
.user-details strong{display:block;color:#e2e8f0;font-size:13px;overflow-wrap:anywhere}
.user-status{margin-left:auto;color:#86efac;font-size:10px;white-space:nowrap}

/* ERROR */
.error-message{margin-bottom:18px;padding:13px 15px;border-radius:12px;background:rgba(239,68,68,.10);border:1px solid rgba(248,113,113,.3);color:#fca5a5;font-size:13px;line-height:1.7;overflow-wrap:anywhere}

/* DROP ZONE */
.upload-area{display:flex;flex-direction:column;align-items:center;justify-content:center;min-height:270px;padding:25px 18px;text-align:center;position:relative;overflow:hidden;cursor:pointer;border-radius:19px;background:radial-gradient(circle at 50% 0,rgba(37,99,235,.13),transparent 55%),rgba(2,6,23,.55);border:2px dashed rgba(96,165,250,.36);transition:background .3s,border-color .3s,transform .3s}
.upload-area:hover,.upload-area.dragover{border-color:#22d3ee;background:radial-gradient(circle at 50% 0,rgba(6,182,212,.15),transparent 60%),rgba(2,6,23,.7)}
.upload-area.dragover{transform:scale(1.005)}
.upload-area:focus-within{outline:2px solid #60a5fa;outline-offset:3px}
.upload-icon{width:76px;height:76px;display:grid;place-items:center;border-radius:23px;margin-bottom:18px;font-size:34px;background:linear-gradient(145deg,rgba(37,99,235,.25),rgba(124,58,237,.23));border:1px solid rgba(96,165,250,.28);box-shadow:0 0 35px rgba(37,99,235,.14);animation:iconFloat 3s ease-in-out infinite}
@keyframes iconFloat{50%{transform:translateY(-5px)}}
.upload-area h3{font-size:20px;margin-bottom:10px;line-height:1.4}
.upload-area h3 span{color:#67e8f9}
.upload-area p{color:#94a3b8;font-size:12px;line-height:1.8}
.browse-btn{display:inline-block;margin-top:17px;padding:11px 19px;border-radius:10px;color:#fff;background:linear-gradient(135deg,#2563eb,#7c3aed);font-size:12px;font-weight:800;box-shadow:0 8px 25px rgba(37,99,235,.2);transition:.3s}
.upload-area:hover .browse-btn{box-shadow:0 10px 30px rgba(37,99,235,.35)}
.file-input{position:absolute;width:1px;height:1px;overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;clip-path:inset(50%)}
.file-feedback{display:none;width:100%;margin-top:17px;padding:12px 13px;text-align:left;border-radius:11px;background:rgba(34,197,94,.08);border:1px solid rgba(34,197,94,.22);color:#86efac;font-size:12px;line-height:1.7;overflow-wrap:anywhere}
.file-feedback.visible{display:block}
.file-feedback.invalid{color:#fca5a5;background:rgba(239,68,68,.08);border-color:rgba(248,113,113,.3)}
.file-hint{margin-top:17px;color:#64748b;font-size:10px;line-height:1.7}

/* BUTTON */
.analyze-btn{display:flex;align-items:center;justify-content:center;gap:10px;width:100%;margin-top:19px;padding:15px 18px;border:0;border-radius:12px;color:#fff;background:linear-gradient(110deg,#2563eb,#7c3aed,#2563eb);background-size:200% 100%;font-size:14px;font-weight:800;cursor:pointer;transition:transform .3s,box-shadow .3s,opacity .3s}
.analyze-btn:hover:not(:disabled){transform:translateY(-3px);box-shadow:0 12px 32px rgba(37,99,235,.35);background-position:100% 0}
.analyze-btn:focus-visible{outline:2px solid #67e8f9;outline-offset:4px}
.analyze-btn:disabled{opacity:.45;cursor:not-allowed;box-shadow:none}
.btn-spark{font-size:19px}
.loading-spinner{display:none;width:16px;height:16px;border:2px solid rgba(255,255,255,.35);border-top-color:#fff;border-radius:50%;animation:spin .7s linear infinite}
@keyframes spin{to{transform:rotate(360deg)}}
.analyze-btn.loading .loading-spinner{display:inline-block}
.analyze-btn.loading .btn-spark{display:none}

/* BENEFITS */
.side-panel{min-width:0;padding:23px;border-radius:24px;background:linear-gradient(145deg,rgba(15,23,42,.9),rgba(8,15,32,.96));border:1px solid rgba(255,255,255,.09)}
.side-heading{font-size:16px;margin-bottom:7px}
.side-subtitle{font-size:11px;color:#94a3b8;line-height:1.7;margin-bottom:22px}
.benefit{display:flex;gap:12px;padding:15px 0;border-bottom:1px solid rgba(255,255,255,.07);min-width:0}
.benefit:last-of-type{border-bottom:0}
.benefit-icon{width:39px;height:39px;flex:0 0 auto;display:grid;place-items:center;border-radius:12px;background:rgba(37,99,235,.13);border:1px solid rgba(96,165,250,.14);font-size:19px}
.benefit-text{min-width:0}
.benefit-text strong{display:block;font-size:12px;margin-bottom:6px}
.benefit-text p{font-size:11px;color:#94a3b8;line-height:1.7;overflow-wrap:anywhere}
.privacy-note{margin-top:20px;padding:13px;border-radius:12px;background:rgba(34,197,94,.055);border:1px solid rgba(34,197,94,.14);color:#a7f3d0;font-size:10px;line-height:1.8}

/* STEPS */
.steps-section{width:min(1060px,100%);margin:30px auto 0;padding:24px;border-radius:20px;background:rgba(15,23,42,.65);border:1px solid rgba(255,255,255,.08)}
.steps-title{text-align:center;font-size:16px;margin-bottom:22px}
.steps-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:17px}
.step{text-align:center;padding:12px 10px;min-width:0}
.step-number{width:42px;height:42px;margin:0 auto 12px;display:grid;place-items:center;border-radius:14px;background:linear-gradient(135deg,#2563eb,#7c3aed);box-shadow:0 7px 22px rgba(37,99,235,.2);font-size:15px;font-weight:800}
.step h4{font-size:12px;margin-bottom:7px}
.step p{font-size:10px;line-height:1.7;color:#94a3b8}

/* FOOTER */
.site-footer{padding:35px 20px 22px;text-align:center;background:#030712;border-top:1px solid rgba(255,255,255,.06)}
.footer-logo{font-size:20px;font-weight:800;margin-bottom:10px;background:linear-gradient(90deg,#60a5fa,#22d3ee,#a78bfa);-webkit-background-clip:text;background-clip:text;color:transparent}
.footer-project-title{color:#cbd5e1;font-size:12px;margin-bottom:14px;line-height:1.7}
.footer-developer{font-size:13px;margin-bottom:7px;color:#e2e8f0}
.footer-email a{color:#5eead4;font-size:12px;overflow-wrap:anywhere}
.footer-line{width:min(900px,100%);height:1px;margin:22px auto 15px;background:#1e293b}
.footer-copyright{color:#64748b;font-size:11px;line-height:1.7}

/* RESPONSIVE */
@media(max-width:1050px){.upload-layout{grid-template-columns:minmax(0,1.15fr) minmax(235px,.85fr)}.upload-card{padding:21px}.side-panel{padding:20px}}
@media(max-width:850px){.nav-links{justify-content:flex-start}.upload-layout{grid-template-columns:1fr;max-width:700px}.side-panel{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:0 20px}.side-heading,.side-subtitle{grid-column:1/-1}.privacy-note{grid-column:1/-1}}
@media(max-width:600px){
.navbar-top{width:94%;padding:12px 0;flex-wrap:wrap;gap:10px}
.logo{font-size:17px;white-space:normal}
.top-user{gap:7px}
.user-name{max-width:125px;padding:7px 9px;font-size:10px}
.logout{font-size:11px;padding:8px 10px}
.nav-links{width:94%;padding-bottom:9px}
.nav-links a{font-size:10px;padding:8px 9px}
.upload-section{padding:45px 13px 55px}
.section-heading{margin-bottom:25px}
.section-heading h1{font-size:30px}
.section-heading p{font-size:12px}
.section-badge{font-size:9px}
.upload-card{padding:16px;border-radius:19px}
.card-top{gap:10px;flex-wrap:wrap}
.card-icon{width:42px;height:42px;font-size:20px}
.card-top h3{font-size:15px}
.card-top p{font-size:11px}
.secure-badge{font-size:8px;margin-left:auto}
.user-strip{padding:11px}
.user-avatar{width:35px;height:35px}
.user-details strong{font-size:12px}
.upload-area{min-height:245px;padding:22px 11px}
.upload-icon{width:64px;height:64px;font-size:29px;border-radius:19px}
.upload-area h3{font-size:18px}
.upload-area p{font-size:11px}
.browse-btn{font-size:11px;padding:10px 14px}
.file-hint{font-size:9px}
.analyze-btn{font-size:12px;padding:14px 10px}
.side-panel{display:block;padding:18px}
.side-heading{font-size:15px}
.benefit{padding:13px 0}
.steps-section{padding:17px 12px;margin-top:23px}
.steps-title{font-size:14px}
.steps-grid{grid-template-columns:1fr;gap:6px}
.step{display:grid;grid-template-columns:42px minmax(0,1fr);gap:0 12px;text-align:left;align-items:center;padding:10px 5px}
.step-number{grid-row:1/3;margin:0}
.step h4{font-size:12px;margin-bottom:4px}
.step p{font-size:10px}
.site-footer{padding:30px 15px 20px}
}
@media(max-width:360px){
.logo{font-size:15px}
.user-name{max-width:100px}
.logout{font-size:10px;padding:7px 8px}
.section-heading h1{font-size:27px}
.upload-card{padding:12px}
.card-top{gap:8px}
.secure-badge{margin-left:0}
.upload-area h3{font-size:16px}
.upload-area p{font-size:10px}
.analyze-btn{font-size:11px}
}
@media(prefers-reduced-motion:reduce){
*,*::before,*::after{animation-duration:.01ms!important;animation-iteration-count:1!important;scroll-behavior:auto!important;transition-duration:.01ms!important}
}
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar">
    <div class="navbar-top">
        <div class="logo">🤖 AI Resume Analyzer</div>
        <div class="top-user">
            <span class="user-name">👋 Hi, ${user.name}</span>
            <a class="logout" href="${pageContext.request.contextPath}/logout">🚪 Logout</a>
        </div>
    </div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/home">🏠 Home</a>
        <a class="active" href="${pageContext.request.contextPath}/upload_resume">📄 Analyze Resume</a>
        <a href="${pageContext.request.contextPath}/resume-history">📊 Resume History</a>
        <a href="${pageContext.request.contextPath}/resume-rewriter">✨ AI Resume Rewriter</a>
        <a href="${pageContext.request.contextPath}/job-matching">💼 Job Matching</a>
        <a href="${pageContext.request.contextPath}/interview-questions">🎯 Interview Questions</a>
        <a href="${pageContext.request.contextPath}/home#features">✨ Features</a>
        <a href="${pageContext.request.contextPath}/home#how-it-works">⚙️ How It Works</a>
    </div>
</nav>

<section class="upload-section" id="upload">
    <div class="section-heading">
        <div class="section-badge">✦ AI-POWERED RESUME ANALYSIS</div>
        <h1>Upload Your <span>Resume</span></h1>
        <p>
            Upload your resume and discover your ATS score, technical skills,
            strengths, weaknesses and personalized improvement suggestions.
            Take the next step towards your career goals with AI.
        </p>
    </div>

    <div class="upload-layout">
        <!-- UPLOAD FORM -->
        <div class="upload-card">
            <div class="card-top">
                <div class="card-icon">📄</div>
                <div>
                    <h3>Resume Upload Center</h3>
                    <p>PDF format · Maximum file size 10 MB</p>
                </div>
                <div class="secure-badge">● READY</div>
            </div>

            <div class="user-strip">
                <div class="user-avatar">👤</div>
                <div class="user-details">
                    <small>LOGGED IN AS</small>
                    <strong>${user.name}</strong>
                </div>
                <div class="user-status">✓ Account</div>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message" role="alert">
                    ⚠️ ${error}
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/upload"
                  method="post"
                  enctype="multipart/form-data"
                  id="uploadForm">

                <!-- CSRF token: required by Spring Security -->
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}" />

                <label for="file" class="upload-area" id="uploadArea">
                    <div class="upload-icon">📤</div>
                    <h3>Drag &amp; Drop Your <span>Resume</span></h3>
                    <p>
                        Drop your PDF file here or browse your device<br>
                        to choose the resume you want to analyze.
                    </p>
                    <span class="browse-btn">📁 Choose PDF File</span>
                    <div class="file-feedback" id="fileFeedback" aria-live="polite"></div>
                    <div class="file-hint">PDF only &nbsp; • &nbsp; Maximum 10 MB</div>
                </label>

                <input class="file-input"
                       type="file"
                       id="file"
                       name="file"
                       accept=".pdf,application/pdf"
                       required>

                <button type="submit" class="analyze-btn" id="analyzeBtn" disabled>
                    <span class="btn-spark">✦</span>
                    <span class="loading-spinner" aria-hidden="true"></span>
                    <span id="buttonText">Analyze Resume with AI</span>
                    <span>→</span>
                </button>
            </form>
        </div>

        <!-- BENEFITS -->
        <aside class="side-panel">
            <h3 class="side-heading">What You'll Discover</h3>
            <p class="side-subtitle">
                Get useful insights to understand and improve your resume.
            </p>

            <div class="benefit">
                <div class="benefit-icon">📊</div>
                <div class="benefit-text">
                    <strong>ATS Compatibility Score</strong>
                    <p>Review your resume's ATS-oriented score and compatibility insights.</p>
                </div>
            </div>

            <div class="benefit">
                <div class="benefit-icon">💻</div>
                <div class="benefit-text">
                    <strong>Technical Skills</strong>
                    <p>Identify technical skills and strengths detected in your resume.</p>
                </div>
            </div>

            <div class="benefit">
                <div class="benefit-icon">🔎</div>
                <div class="benefit-text">
                    <strong>Missing Skills &amp; Gaps</strong>
                    <p>Understand possible skill gaps and areas for improvement.</p>
                </div>
            </div>

            <div class="benefit">
                <div class="benefit-icon">🚀</div>
                <div class="benefit-text">
                    <strong>AI Recommendations</strong>
                    <p>Receive suggestions to help make your resume more effective.</p>
                </div>
            </div>

            <div class="privacy-note">
                🔐 <strong>Before uploading:</strong> Choose a PDF resume you are comfortable sharing with this application. Your resume is processed by the application's backend and AI service.
            </div>
        </aside>
    </div>

    <!-- HOW IT WORKS -->
    <div class="steps-section" id="how-it-works">
        <h3 class="steps-title">⚡ Your Resume Analysis Journey</h3>
        <div class="steps-grid">
            <div class="step">
                <div class="step-number">01</div>
                <h4>Upload Resume</h4>
                <p>Select your PDF resume from your device.</p>
            </div>
            <div class="step">
                <div class="step-number">02</div>
                <h4>AI Analysis</h4>
                <p>AI reviews the extracted resume content.</p>
            </div>
            <div class="step">
                <div class="step-number">03</div>
                <h4>Explore Insights</h4>
                <p>Review your score, skills and suggestions.</p>
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer class="site-footer">
    <div class="footer-logo">🤖 AI Resume Analyzer</div>
    <div class="footer-project-title">Intelligent AI Resume Analyzer and Career Assistant</div>
    <div class="footer-developer">Developed by Krishnakant Patidar</div>
    <div class="footer-email">
        <a href="mailto:patidarkrishna188@gmail.com">patidarkrishna188@gmail.com</a>
    </div>
    <div class="footer-line"></div>
    <div class="footer-copyright">© 2026 AI Resume Analyzer | All Rights Reserved</div>
</footer>

<script>
(function () {
    "use strict";

    const fileInput = document.getElementById("file");
    const uploadArea = document.getElementById("uploadArea");
    const uploadForm = document.getElementById("uploadForm");
    const fileFeedback = document.getElementById("fileFeedback");
    const analyzeBtn = document.getElementById("analyzeBtn");
    const buttonText = document.getElementById("buttonText");

    const MAX_FILE_SIZE = 10 * 1024 * 1024;
    const DEFAULT_BUTTON_TEXT = "Analyze Resume with AI";
    let submitting = false;

    function showFeedback(message, invalid) {
        fileFeedback.textContent = message;
        fileFeedback.classList.add("visible");
        fileFeedback.classList.toggle("invalid", Boolean(invalid));
    }

    function validateFile(file) {
        if (!file) {
            showFeedback("Please choose a PDF resume first.", true);
            analyzeBtn.disabled = true;
            return false;
        }

        if (!file.name.toLowerCase().endsWith(".pdf")) {
            showFeedback("Invalid file type. Please select a PDF resume.", true);
            analyzeBtn.disabled = true;
            return false;
        }

        if (file.size === 0) {
            showFeedback("This file is empty. Please choose another PDF.", true);
            analyzeBtn.disabled = true;
            return false;
        }

        if (file.size > MAX_FILE_SIZE) {
            showFeedback("File exceeds 10 MB. Please select a smaller PDF.", true);
            analyzeBtn.disabled = true;
            return false;
        }

        const size = (file.size / (1024 * 1024)).toFixed(2);
        showFeedback("✓ Selected: " + file.name + " (" + size + " MB)", false);
        analyzeBtn.disabled = false;
        buttonText.textContent = DEFAULT_BUTTON_TEXT;
        return true;
    }

    fileInput.addEventListener("change", function () {
        submitting = false;
        analyzeBtn.classList.remove("loading");

        const file = this.files && this.files.length ? this.files[0] : null;

        if (!file) {
            fileFeedback.textContent = "";
            fileFeedback.classList.remove("visible", "invalid");
            analyzeBtn.disabled = true;
            buttonText.textContent = DEFAULT_BUTTON_TEXT;
            return;
        }

        validateFile(file);
    });

    ["dragenter", "dragover"].forEach(function (eventName) {
        uploadArea.addEventListener(eventName, function (event) {
            event.preventDefault();
            event.stopPropagation();
            uploadArea.classList.add("dragover");
        });
    });

    ["dragleave", "dragend", "drop"].forEach(function (eventName) {
        uploadArea.addEventListener(eventName, function (event) {
            event.preventDefault();
            event.stopPropagation();
            uploadArea.classList.remove("dragover");
        });
    });

    uploadArea.addEventListener("drop", function (event) {
        const files = event.dataTransfer && event.dataTransfer.files;
        if (!files || !files.length) return;

        try {
            const transfer = new DataTransfer();
            transfer.items.add(files[0]);
            fileInput.files = transfer.files;

            submitting = false;
            analyzeBtn.classList.remove("loading");
            validateFile(fileInput.files[0]);
        } catch (error) {
            showFeedback("Please click Choose PDF File to select your resume.", true);
            analyzeBtn.disabled = true;
        }
    });

    uploadForm.addEventListener("submit", function (event) {
        const file = fileInput.files && fileInput.files.length
            ? fileInput.files[0]
            : null;

        if (submitting) {
            event.preventDefault();
            return;
        }

        if (!validateFile(file)) {
            event.preventDefault();
            return;
        }

        submitting = true;
        analyzeBtn.disabled = true;
        analyzeBtn.classList.add("loading");
        buttonText.textContent = "AI is analyzing your resume...";
    });
})();
</script>
</body>
</html>