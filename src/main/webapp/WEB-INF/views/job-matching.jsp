<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Match Analysis | AI Resume Analyzer</title>

    <style>
        :root {
            --bg: #0b1120;
            --card: #111c30;
            --card-light: #17243a;
            --border: #26364e;
            --text: #e5edf8;
            --muted: #9aabc2;
            --cyan: #38bdf8;
            --green: #34d399;
            --purple: #a78bfa;
            --red: #fb7185;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: var(--bg);
            color: var(--text);
            min-height: 100vh;
            line-height: 1.6;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        /* ================= NAVBAR ================= */

        .navbar {
            background: #0f192b;
            border-bottom: 1px solid var(--border);
            padding: 0 5%;
            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.15);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar-top {
            min-height: 62px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
        }

        .logo {
            color: var(--cyan);
            font-size: 21px;
            font-weight: 800;
            white-space: nowrap;
        }

        .top-user {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-name {
            background: rgba(255, 255, 255, 0.07);
            border: 1px solid var(--border);
            color: var(--text);
            padding: 7px 13px;
            border-radius: 20px;
            font-size: 13px;
            white-space: nowrap;
        }

        .logout {
            background: #be354b;
            color: white !important;
            text-decoration: none;
            padding: 7px 13px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
            white-space: nowrap;
            transition: background 0.2s;
        }

        .logout:hover {
            background: #9f2639;
        }

        .nav-links {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            padding: 8px 0 10px;
            overflow-x: auto;
            scrollbar-width: none;
        }

        .nav-links::-webkit-scrollbar {
            display: none;
        }

        .nav-links a {
            color: var(--muted);
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            padding: 7px 10px;
            border-radius: 7px;
            white-space: nowrap;
            transition: all 0.2s ease;
        }

        .nav-links a:hover {
            color: var(--cyan);
            background: rgba(56, 189, 248, 0.09);
        }

        .nav-links a.active {
            color: var(--cyan);
            background: rgba(56, 189, 248, 0.13);
        }

        /* ================= PAGE ================= */

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 38px auto;
        }

        .page-heading {
            text-align: center;
            margin-bottom: 30px;
        }

        .page-icon {
            font-size: 42px;
            margin-bottom: 8px;
        }

        .page-heading h1 {
            font-size: clamp(26px, 4vw, 35px);
            margin-bottom: 8px;
        }

        .page-heading h1 span {
            color: var(--cyan);
        }

        .page-heading p {
            color: var(--muted);
            font-size: 14px;
        }

        .card {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 18px;
            padding: 30px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.12);
        }

        .card h2 {
            font-size: 20px;
            margin-bottom: 8px;
        }

        .card-description {
            color: var(--muted);
            font-size: 13px;
            margin-bottom: 25px;
        }

        /* ================= FORM ================= */

        .form-group {
            margin-bottom: 23px;
        }

        label {
            display: block;
            margin-bottom: 9px;
            font-size: 14px;
            font-weight: 700;
            color: var(--text);
        }

        .required {
            color: var(--red);
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 13px 15px;
            background: #0b1425;
            color: var(--text);
            border: 1px solid var(--border);
            border-radius: 9px;
            font-family: inherit;
            font-size: 14px;
            line-height: 1.6;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input[type="text"]::placeholder,
        textarea::placeholder {
            color: #73859f;
        }

        input[type="text"]:focus,
        textarea:focus {
            border-color: var(--cyan);
            box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.1);
        }

        textarea {
            min-height: 250px;
            resize: vertical;
        }

        .field-help {
            color: var(--muted);
            font-size: 12px;
            margin-top: 7px;
        }

        .btn {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            gap: 9px;
            width: 100%;
            padding: 14px 18px;
            background: var(--cyan);
            color: #07111e;
            border: none;
            border-radius: 9px;
            font-size: 15px;
            font-weight: 800;
            cursor: pointer;
            transition: transform 0.2s, opacity 0.2s;
        }

        .btn:hover {
            transform: translateY(-2px);
            opacity: 0.92;
        }

        .btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        /* ================= INFO ================= */

        .info-card {
            margin-top: 22px;
            padding: 22px;
            background: rgba(56, 189, 248, 0.05);
            border: 1px solid rgba(56, 189, 248, 0.2);
            border-radius: 14px;
        }

        .info-card h3 {
            font-size: 16px;
            margin-bottom: 12px;
            color: var(--cyan);
        }

        .info-card p {
            color: var(--muted);
            font-size: 13px;
            margin-bottom: 12px;
        }

        .info-list {
            list-style: none;
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 12px;
            margin-top: 15px;
        }

        .info-list li {
            background: var(--card-light);
            border: 1px solid var(--border);
            padding: 12px;
            border-radius: 9px;
            color: var(--text);
            font-size: 13px;
        }

        .info-list li span {
            color: var(--green);
            margin-right: 7px;
        }

        /* ================= FOOTER ================= */

        .footer {
            margin-top: 45px;
            border-top: 1px solid var(--border);
            background: #0f192b;
            text-align: center;
            padding: 25px 15px;
            color: var(--muted);
            font-size: 13px;
        }

        .footer strong {
            color: var(--cyan);
        }

        .footer p {
            margin: 4px 0;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 1000px) {
            .navbar {
                padding: 0 20px;
            }

            .nav-links {
                justify-content: flex-start;
            }
        }

        @media (max-width: 650px) {
            .navbar-top {
                flex-direction: column;
                align-items: stretch;
                padding: 12px 0;
                gap: 12px;
            }

            .logo {
                text-align: center;
                font-size: 19px;
            }

            .top-user {
                justify-content: center;
            }

            .nav-links {
                justify-content: flex-start;
                padding-bottom: 10px;
            }

            .nav-links a {
                font-size: 12px;
                padding: 7px 9px;
            }

            .container {
                width: 92%;
                margin: 25px auto;
            }

            .card {
                padding: 21px;
            }

            .info-list {
                grid-template-columns: 1fr;
            }

            textarea {
                min-height: 220px;
            }
        }
    </style>
</head>

<body>

    <!-- ================= COMMON NAVBAR ================= -->

    <nav class="navbar">
        <div class="navbar-top">

            <a class="logo"
               href="${pageContext.request.contextPath}/home">
                🤖 AI Resume Analyzer
            </a>

            <div class="top-user">
                <span class="user-name">
                    👋 Hi,
                    <c:out value="${user.name}" default="User" />
                </span>

                <a class="logout"
                   href="${pageContext.request.contextPath}/logout">
                    🚪 Logout
                </a>
            </div>
        </div>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/home">
                🏠 Home
            </a>

            <a href="${pageContext.request.contextPath}/upload_resume">
                📄 Analyze Resume
            </a>

            <a href="${pageContext.request.contextPath}/resume-history">
                📊 Resume History
            </a>

            <a href="${pageContext.request.contextPath}/resume-rewriter">
                ✨ AI Resume Rewriter
            </a>

            <a class="active"
               href="${pageContext.request.contextPath}/job-matching">
                💼 Job Matching
            </a>

            <a href="${pageContext.request.contextPath}/interview-questions">
                🎯 Interview Questions
            </a>

            <a href="${pageContext.request.contextPath}/home#features">
                ✨ Features
            </a>

            <a href="${pageContext.request.contextPath}/home#how-it-works">
                ⚙️ How It Works
            </a>
        </div>
    </nav>

    <!-- ================= MAIN CONTENT ================= -->

    <main class="container">

        <header class="page-heading">
            <div class="page-icon">🎯</div>

            <h1>
                AI <span>Job Match Analysis</span>
            </h1>

            <p>
                Discover how well your resume matches your target job.
            </p>
        </header>

        <section class="card">

            <h2>💼 Job Details</h2>

            <p class="card-description">
                Enter the target role and paste the job description
                to compare it with your uploaded resume using Gemini AI.
            </p>

            <form
                action="${pageContext.request.contextPath}/analyze-job-match"
                method="post"
                id="jobMatchForm">

                <!-- CSRF token: important for Spring Security POST requests -->
                <c:if test="${not empty _csrf}">
                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}" />
                </c:if>

                <!-- Existing controller parameter: resumeId -->
                <input type="hidden"
                       name="resumeId"
                       value="${resume.id}" />

                <div class="form-group">

                    <label for="jobTitle">
                        Job Title <span class="required">*</span>
                    </label>

                    <input
                        type="text"
                        id="jobTitle"
                        name="jobTitle"
                        placeholder="Example: Java Backend Developer"
                        maxlength="200"
                        required>

                    <p class="field-help">
                        Enter the exact role you want to apply for.
                    </p>
                </div>

                <div class="form-group">

                    <label for="description">
                        Job Description <span class="required">*</span>
                    </label>

                    <textarea
                        id="description"
                        name="description"
                        placeholder="Paste the complete job description here, including responsibilities, required skills and qualifications..."
                        required></textarea>

                    <p class="field-help">
                        Tip: Include the required skills and responsibilities
                        for a more useful comparison.
                    </p>
                </div>

                <button type="submit"
                        class="btn"
                        id="analyzeButton">
                    🔍 Analyze Job Match
                </button>

            </form>
        </section>

        <section class="info-card">

            <h3>⚙️ How Job Matching Works</h3>

            <p>
                Your selected resume is compared with the job description
                using Gemini AI. The analysis helps you understand how
                closely your resume aligns with the target role.
            </p>

            <ul class="info-list">
                <li>
                    <span>✓</span>
                    Matching technical skills
                </li>

                <li>
                    <span>✓</span>
                    Skills to develop
                </li>

                <li>
                    <span>✓</span>
                    Relevant experience comparison
                </li>

                <li>
                    <span>✓</span>
                    Resume improvement suggestions
                </li>
            </ul>

        </section>

    </main>

    <!-- ================= FOOTER ================= -->

    <footer class="footer">
        <p><strong>🤖 AI Resume Analyzer</strong></p>
        <p>Intelligent AI Resume Analyzer and Career Assistant</p>
        <p>Developed by Krishnakant Patidar</p>
        <p>Contact: patidarkrishna188@gmail.com</p>
        <p>© 2026 AI Resume Analyzer | All Rights Reserved</p>
    </footer>

    <script>
        document.addEventListener("DOMContentLoaded", function () {

            const form = document.getElementById("jobMatchForm");
            const button = document.getElementById("analyzeButton");
            const title = document.getElementById("jobTitle");
            const description = document.getElementById("description");

            form.addEventListener("submit", function (event) {

                if (!title.value.trim() || !description.value.trim()) {
                    event.preventDefault();
                    alert("Please enter the job title and complete job description.");
                    return;
                }

                button.disabled = true;
                button.textContent = "⏳ Analyzing Job Match...";
            });
        });
    </script>

</body>
</html>
