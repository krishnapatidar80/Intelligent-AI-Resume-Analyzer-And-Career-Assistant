<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AI Interview Question Generator | AI Resume Analyzer</title>

<style>
:root {
    --bg: #020617;
    --panel: rgba(15,23,42,.78);
    --border: rgba(148,163,184,.18);
    --text: #f8fafc;
    --muted: #94a3b8;
    --blue: #38bdf8;
}
* { box-sizing:border-box; margin:0; padding:0; }
html { scroll-behavior:smooth; }
body {
    min-height:100vh;
    font-family:Arial,Helvetica,sans-serif;
    color:var(--text);
    background:
        radial-gradient(ellipse at 10% 5%,rgba(37,99,235,.20),transparent 35%),
        radial-gradient(ellipse at 90% 25%,rgba(147,51,234,.16),transparent 35%),
        radial-gradient(ellipse at 50% 90%,rgba(6,182,212,.10),transparent 40%),
        var(--bg);
    line-height:1.6;
}
a { color:inherit; }
.navbar {
    position:sticky; top:0; z-index:1000;
    padding:12px 5%;
    background:rgba(2,6,23,.92);
    border-bottom:1px solid var(--border);
    backdrop-filter:blur(18px);
}
.navbar-top {
    max-width:1400px; margin:auto; min-height:48px;
    display:flex; align-items:center; justify-content:space-between; gap:20px;
}
.logo { text-decoration:none; font-size:21px; font-weight:800; white-space:nowrap; }
.logo span,.footer-brand span { color:var(--blue); }
.top-user { display:flex; align-items:center; gap:12px; }
.user-name {
    color:#e2e8f0; background:rgba(148,163,184,.10);
    border:1px solid var(--border); padding:7px 13px;
    border-radius:30px; font-size:13px;
}
.logout {
    text-decoration:none; padding:8px 14px; border-radius:9px;
    background:rgba(239,68,68,.12);
    border:1px solid rgba(248,113,113,.3);
    color:#fca5a5; font-size:13px; font-weight:700;
}
.logout:hover { background:#dc2626; color:white; }
.nav-links {
    max-width:1400px; margin:8px auto 0;
    display:flex; align-items:center; gap:7px;
    overflow-x:auto; scrollbar-width:none; padding-bottom:3px;
}
.nav-links::-webkit-scrollbar { display:none; }
.nav-links a {
    text-decoration:none; color:#cbd5e1; white-space:nowrap;
    padding:8px 12px; border-radius:9px; font-size:12px;
    font-weight:600; border:1px solid transparent;
}
.nav-links a:hover {
    color:white; background:rgba(56,189,248,.09);
    border-color:rgba(56,189,248,.2);
}
.nav-links a.active {
    color:#7dd3fc;
    background:linear-gradient(120deg,rgba(37,99,235,.22),rgba(147,51,234,.18));
    border-color:rgba(56,189,248,.3);
}
.container { width:min(1100px,90%); margin:55px auto 70px; }
.page-header { text-align:center; margin-bottom:38px; }
.eyebrow {
    display:inline-flex; padding:7px 14px; margin-bottom:17px;
    border:1px solid rgba(56,189,248,.25); border-radius:30px;
    background:rgba(56,189,248,.07); color:#7dd3fc;
    font-size:12px; font-weight:700; letter-spacing:.5px;
    text-transform:uppercase;
}
.page-header h1 {
    font-size:clamp(30px,4vw,46px); line-height:1.2;
    letter-spacing:-1.3px; margin-bottom:17px;
}
.gradient-text {
    background:linear-gradient(100deg,#38bdf8,#818cf8,#c084fc);
    -webkit-background-clip:text; background-clip:text;
    -webkit-text-fill-color:transparent;
}
.page-header p {
    max-width:700px; margin:auto; color:var(--muted);
    font-size:15px; line-height:1.9;
}
.card {
    background:var(--panel); border:1px solid var(--border);
    border-radius:20px; padding:30px; margin-bottom:25px;
    box-shadow:0 20px 60px rgba(0,0,0,.18);
    backdrop-filter:blur(14px);
}
.card-heading { display:flex; align-items:flex-start; gap:15px; margin-bottom:27px; }
.heading-icon {
    width:52px; height:52px; min-width:52px;
    display:flex; align-items:center; justify-content:center;
    font-size:25px; border-radius:15px;
    background:linear-gradient(135deg,rgba(56,189,248,.17),rgba(139,92,246,.20));
    border:1px solid rgba(129,140,248,.22);
}
.card-heading h2 { font-size:22px; line-height:1.4; margin:2px 0 7px; }
.card-description { color:var(--muted); font-size:14px; line-height:1.8; }
.form-grid { display:grid; grid-template-columns:repeat(2,minmax(0,1fr)); gap:22px; }
.form-group { min-width:0; }
.form-group.full { grid-column:1/-1; }
label { display:block; margin-bottom:9px; color:#e2e8f0; font-size:13px; font-weight:700; }
.optional { color:#64748b; font-weight:400; font-size:12px; }
select,input,textarea {
    width:100%; padding:13px 14px; color:#f1f5f9;
    background:rgba(2,6,23,.65);
    border:1px solid rgba(148,163,184,.25); border-radius:11px;
    font-family:Arial,Helvetica,sans-serif; font-size:14px; outline:none;
    transition:border-color .25s,box-shadow .25s;
}
select { cursor:pointer; }
select option { color:#f8fafc; background:#0f172a; }
input::placeholder,textarea::placeholder { color:#64748b; }
select:focus,input:focus,textarea:focus {
    border-color:var(--blue); box-shadow:0 0 0 3px rgba(56,189,248,.10);
}
textarea { min-height:155px; resize:vertical; line-height:1.8; }
.form-actions {
    display:flex; flex-wrap:wrap; align-items:center;
    gap:13px; margin-top:27px;
}
.btn {
    display:inline-flex; align-items:center; justify-content:center; gap:9px;
    min-height:46px; padding:13px 21px;
    border:1px solid rgba(56,189,248,.35); border-radius:11px;
    background:linear-gradient(100deg,#2563eb,#7c3aed);
    color:white; font-size:13px; font-weight:700;
    text-decoration:none; cursor:pointer; transition:.25s;
}
.btn:hover { transform:translateY(-2px); box-shadow:0 10px 28px rgba(59,130,246,.20); filter:brightness(1.1); }
.btn-secondary { color:#e2e8f0; background:rgba(148,163,184,.07); border-color:var(--border); }
.btn-secondary:hover { background:rgba(148,163,184,.14); box-shadow:none; }
.info-box {
    margin-top:26px; padding:19px 20px;
    border:1px solid rgba(56,189,248,.20); border-left:4px solid var(--blue);
    border-radius:12px; background:rgba(14,165,233,.055);
    color:#cbd5e1; font-size:13px; line-height:1.9;
}
.info-title { margin-bottom:5px; color:#7dd3fc; }
.steps { display:grid; grid-template-columns:repeat(3,minmax(0,1fr)); gap:16px; margin-top:23px; }
.step {
    padding:21px; border:1px solid var(--border); border-radius:15px;
    background:rgba(2,6,23,.35); transition:.25s;
}
.step:hover { transform:translateY(-3px); border-color:rgba(56,189,248,.35); }
.step-number {
    display:flex; align-items:center; justify-content:center;
    width:36px; height:36px; margin-bottom:15px; border-radius:11px;
    background:linear-gradient(135deg,#2563eb,#7c3aed);
    font-size:14px; font-weight:800;
}
.step h3 { margin-bottom:9px; font-size:15px; }
.step p { color:var(--muted); font-size:13px; line-height:1.8; }
.site-footer {
    padding:27px 5%; border-top:1px solid var(--border);
    background:rgba(2,6,23,.6); text-align:center;
}
.footer-brand { font-size:16px; font-weight:800; margin-bottom:5px; }
.footer-tagline { color:var(--muted); font-size:12px; margin-bottom:8px; }
.footer-copy { color:#64748b; font-size:12px; }
@media(max-width:900px) {
    .navbar { padding-left:4%; padding-right:4%; }
    .nav-links { justify-content:flex-start; }
    .steps { grid-template-columns:1fr; }
}
@media(max-width:650px) {
    .navbar-top { flex-direction:column; align-items:stretch; padding:7px 0; gap:12px; }
    .logo { text-align:center; font-size:19px; }
    .top-user { justify-content:center; flex-wrap:wrap; }
    .nav-links a { font-size:12px; padding:8px 10px; }
    .container { width:92%; margin:35px auto 45px; }
    .page-header { margin-bottom:27px; }
    .page-header h1 { letter-spacing:-.6px; }
    .card { padding:21px; border-radius:16px; }
    .card-heading { gap:12px; }
    .heading-icon { width:44px; height:44px; min-width:44px; font-size:21px; }
    .card-heading h2 { font-size:19px; }
    .form-grid { grid-template-columns:1fr; gap:19px; }
    .form-group.full { grid-column:auto; }
    .form-actions { flex-direction:column; align-items:stretch; }
    .form-actions .btn { width:100%; }
}
</style>
</head>

<body>

<nav class="navbar">
    <div class="navbar-top">
        <a class="logo" href="${pageContext.request.contextPath}/home">
            🤖 AI Resume Analyzer
        </a>
        <div class="top-user">
            <span class="user-name">👋 Hi, ${user.name}</span>
            <a class="logout" href="${pageContext.request.contextPath}/logout">🚪 Logout</a>
        </div>
    </div>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/home">🏠 Home</a>
        <a href="${pageContext.request.contextPath}/upload_resume">📄 Analyze Resume</a>
        <a href="${pageContext.request.contextPath}/resume-history">📊 Resume History</a>
        <a href="${pageContext.request.contextPath}/resume-rewriter">✨ AI Resume Rewriter</a>
        <a href="${pageContext.request.contextPath}/job-matching">💼 Job Matching</a>
        <a class="active" href="${pageContext.request.contextPath}/interview-questions">🎯 Interview Questions</a>
        <a href="${pageContext.request.contextPath}/home#features">✨ Features</a>
        <a href="${pageContext.request.contextPath}/home#how-it-works">⚙️ How It Works</a>
    </div>
</nav>

<main class="container">

    <header class="page-header">
        <div class="eyebrow">✨ AI-Powered Interview Preparation</div>
        <h1>AI Interview <span class="gradient-text">Question Generator</span></h1>
        <p>
            Practise with personalized interview questions and AI-generated answers
            based on your resume, skills, projects and target job role.
        </p>
    </header>

    <section class="card">
        <div class="card-heading">
            <div class="heading-icon">🎯</div>
            <div>
                <h2>Generate Interview Questions</h2>
                <p class="card-description">
                    Customize your interview practice session. Add a target role and
                    job description for more relevant questions.
                </p>
            </div>
        </div>

        <form method="post"
              action="${pageContext.request.contextPath}/generate-interview-questions">

            <%-- CSRF token: required by Spring Security for POST requests --%>
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}">

            <input type="hidden" name="resumeId" value="${resume.id}">

            <div class="form-grid">
                <div class="form-group">
                    <label for="questionType">Question Type</label>
                    <select id="questionType" name="questionType" required>
                        <option value="ALL">All Questions</option>
                        <option value="RESUME">Resume Based</option>
                        <option value="TECHNICAL">Technical</option>
                        <option value="PROJECT">Project Based</option>
                        <option value="HR">HR &amp; Behavioral</option>
                        <option value="JOB-SPECIFIC">Job Specific</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="difficulty">Difficulty Level</label>
                    <select id="difficulty" name="difficulty" required>
                        <option value="Mixed">Mixed</option>
                        <option value="Easy">Easy</option>
                        <option value="Medium">Medium</option>
                        <option value="Hard">Hard</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="numberOfQuestions">Number of Questions</label>
                    <select id="numberOfQuestions" name="numberOfQuestions" required>
                        <option value="5">5 Questions</option>
                        <option value="10" selected>10 Questions</option>
                        <option value="15">15 Questions</option>
                        <option value="20">20 Questions</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="jobTitle">
                        Target Job Title <span class="optional">(Optional)</span>
                    </label>
                    <input type="text" id="jobTitle" name="jobTitle"
                           maxlength="150" placeholder="e.g. Java Developer">
                </div>

                <div class="form-group full">
                    <label for="jobDescription">
                        Job Description <span class="optional">(Optional)</span>
                    </label>
                    <textarea id="jobDescription" name="jobDescription"
                              placeholder="Paste the job description here to generate role-specific interview questions..."></textarea>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn">
                    🚀 Generate AI Interview Questions
                </button>
                <a href="${pageContext.request.contextPath}/home"
                   class="btn btn-secondary">← Back to Home</a>
            </div>
        </form>

        <div class="info-box">
            <div class="info-title"><strong>💡 How it works</strong></div>
            Gemini AI analyzes your resume and generates questions relevant to your
            profile. Adding a job title and job description helps tailor the questions
            to your target role. Try answering the questions yourself before reviewing
            the AI-generated answers.
        </div>
    </section>

    <section class="card">
        <div class="card-heading">
            <div class="heading-icon">📚</div>
            <div>
                <h2>How to Prepare</h2>
                <p class="card-description">
                    Make every practice session count with a structured interview
                    preparation approach.
                </p>
            </div>
        </div>

        <div class="steps">
            <div class="step">
                <div class="step-number">1</div>
                <h3>Choose Your Questions</h3>
                <p>Select the category, difficulty and number of questions that suit your preparation goals.</p>
            </div>
            <div class="step">
                <div class="step-number">2</div>
                <h3>Practise Your Answers</h3>
                <p>Answer questions in your own words and support your responses with relevant project examples.</p>
            </div>
            <div class="step">
                <div class="step-number">3</div>
                <h3>Review and Improve</h3>
                <p>Compare your responses with the generated answers and revise topics where needed.</p>
            </div>
        </div>
    </section>
</main>

<footer class="site-footer">
    <div class="footer-brand">🤖 AI Resume Analyzer</div>
    <p class="footer-tagline">Smart Resume Analysis • Career Guidance • Interview Preparation</p>
    <p class="footer-copy">
        Built by Krishnakant Patidar &nbsp;|&nbsp; patidarkrishna188@gmail.com
        <br>© 2026 AI Resume Analyzer. All rights reserved.
    </p>
</footer>

</body>
</html>