<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    Object scoreAttr = request.getAttribute("resumeScore");
    int scoreForJs = 0;

    if (scoreAttr != null) {
        try {
            scoreForJs = Integer.parseInt(scoreAttr.toString());
        } catch (NumberFormatException e) {
            scoreForJs = 0;
        }
    }

    if (scoreForJs < 0) {
        scoreForJs = 0;
    }

    if (scoreForJs > 100) {
        scoreForJs = 100;
    }

    String aiResultText = request.getAttribute("aiResult") == null
            ? ""
            : request.getAttribute("aiResult").toString();

    String resumeTextValue = request.getAttribute("resumeText") == null
            ? ""
            : request.getAttribute("resumeText").toString();

    String scoreStatus;

    if (scoreForJs >= 85) {
        scoreStatus = "Excellent";
    } else if (scoreForJs >= 70) {
        scoreStatus = "Good";
    } else if (scoreForJs >= 50) {
        scoreStatus = "Average";
    } else {
        scoreStatus = "Needs Improvement";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Resume Analysis Result | AI Resume Analyzer</title>

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

        .navbar {
            background: #0f192b;
            border-bottom: 1px solid var(--border);
            padding: 16px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .brand {
            font-size: 21px;
            font-weight: 800;
            color: var(--cyan);
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 18px;
            flex-wrap: wrap;
        }

        .nav-links a {
            color: var(--muted);
            font-size: 14px;
            transition: color 0.2s;
        }

        .nav-links a:hover {
            color: var(--cyan);
        }

        .container {
            width: 90%;
            max-width: 1150px;
            margin: 35px auto;
        }

        .page-heading {
            text-align: center;
            margin-bottom: 30px;
        }

        .page-heading .icon {
            font-size: 42px;
            margin-bottom: 8px;
        }

        .page-heading h1 {
            font-size: clamp(25px, 4vw, 35px);
            margin-bottom: 8px;
        }

        .page-heading h1 span {
            color: var(--cyan);
        }

        .page-heading p {
            color: var(--muted);
            font-size: 15px;
        }

        .success-banner {
            padding: 16px 20px;
            background: rgba(52, 211, 153, 0.09);
            border: 1px solid rgba(52, 211, 153, 0.3);
            border-radius: 12px;
            color: #a7f3d0;
            margin-bottom: 25px;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
            gap: 22px;
            align-items: stretch;
        }

        .card {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 18px;
            padding: 25px;
            min-width: 0;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.12);
        }

        .card h2 {
            font-size: 19px;
            margin-bottom: 8px;
        }

        .card-description {
            color: var(--muted);
            font-size: 13px;
            margin-bottom: 20px;
        }

        .score-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            min-height: 310px;
        }

        .score-circle {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            margin: 12px 0 20px;
            background: conic-gradient(
                var(--cyan) <%= scoreForJs * 3.6 %>deg,
                #26364e <%= scoreForJs * 3.6 %>deg
            );
        }

        .score-circle::before {
            content: "";
            position: absolute;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: var(--card);
        }

        .score-value {
            position: relative;
            z-index: 1;
            font-size: 43px;
            font-weight: 800;
        }

        .score-value small {
            font-size: 17px;
            color: var(--muted);
        }

        .score-status {
            display: inline-block;
            border-radius: 25px;
            padding: 6px 15px;
            background: rgba(56, 189, 248, 0.12);
            border: 1px solid rgba(56, 189, 248, 0.3);
            color: var(--cyan);
            font-weight: 700;
            font-size: 13px;
        }

        .score-note {
            color: var(--muted);
            font-size: 12px;
            margin-top: 15px;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            padding: 13px 0;
            border-bottom: 1px solid var(--border);
            font-size: 14px;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-label {
            color: var(--muted);
        }

        .info-value {
            text-align: right;
            overflow-wrap: anywhere;
            font-weight: 600;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .analysis-content,
        .resume-content {
            background: #0b1425;
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 20px;
            color: #d6e2f1;
            font-size: 14px;
            white-space: pre-wrap;
            overflow-wrap: anywhere;
            max-height: 650px;
            overflow-y: auto;
        }

        .analysis-content {
            line-height: 1.85;
        }

        .resume-content {
            line-height: 1.8;
            max-height: 450px;
        }

        .actions {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 24px;
        }

        .btn {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            padding: 12px 18px;
            border: 1px solid transparent;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: transform 0.2s, opacity 0.2s;
        }

        .btn:hover {
            transform: translateY(-2px);
            opacity: 0.9;
        }

        .btn-primary {
            background: var(--cyan);
            color: #07111e;
        }

        .btn-secondary {
            background: var(--card-light);
            color: var(--text);
            border-color: var(--border);
        }

        .btn-purple {
            background: var(--purple);
            color: #100b20;
        }

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

        @media (max-width: 760px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }

            .navbar {
                padding: 15px 5%;
            }

            .nav-links {
                gap: 12px;
            }

            .container {
                width: 92%;
                margin: 25px auto;
            }

            .card {
                padding: 20px;
            }

            .actions {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar">
        <a class="brand"
           href="${pageContext.request.contextPath}/home">
            🤖 AI Resume Analyzer
        </a>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/home">🏠 Home</a>
            <a href="${pageContext.request.contextPath}/upload_resume">📄 Upload Resume</a>
            <a href="${pageContext.request.contextPath}/resume-history">📊 History</a>
            <a href="${pageContext.request.contextPath}/job-matching">🎯 Job Matching</a>
            <a href="${pageContext.request.contextPath}/logout">🚪 Logout</a>
        </div>
    </nav>

    <main class="container">

        <header class="page-heading">
            <div class="icon">🎉</div>
            <h1>Resume <span>Analysis Result</span></h1>
            <p>Your resume has been processed. Review your score and AI feedback below.</p>
        </header>

        <div class="success-banner">
            ✅ <strong>Analysis completed!</strong>
            Review the results and use the suggestions to improve your resume.
        </div>

        <section class="dashboard-grid">

            <div class="card score-card">
                <h2>ATS Compatibility Score</h2>
                <p class="card-description">
                    Your resume's estimated compatibility score
                </p>

                <div class="score-circle">
                    <div class="score-value">
                        <%= scoreForJs %><small>/100</small>
                    </div>
                </div>

                <span class="score-status"><%= scoreStatus %></span>

                <p class="score-note">
                    AI-generated estimate. Actual ATS results may vary by employer and system.
                </p>
            </div>

            <div class="card">
                <h2>📋 Resume Information</h2>
                <p class="card-description">
                    Details of your analyzed resume
                </p>

                <div class="info-row">
                    <span class="info-label">Candidate</span>
                    <span class="info-value">
                        <%= request.getAttribute("user") != null
                            && ((com.aIresumeanalyzer.entity.User) request.getAttribute("user")).getName() != null
                            ? org.springframework.web.util.HtmlUtils.htmlEscape(
                                ((com.aIresumeanalyzer.entity.User) request.getAttribute("user")).getName())
                            : "User" %>
                    </span>
                </div>

                <div class="info-row">
                    <span class="info-label">Resume File</span>
                    <span class="info-value">
                        <%= request.getAttribute("resume") != null
                            && ((com.aIresumeanalyzer.entity.Resume) request.getAttribute("resume")).getFileName() != null
                            ? org.springframework.web.util.HtmlUtils.htmlEscape(
                                ((com.aIresumeanalyzer.entity.Resume) request.getAttribute("resume")).getFileName())
                            : "Resume PDF" %>
                    </span>
                </div>

                <div class="info-row">
                    <span class="info-label">ATS Score</span>
                    <span class="info-value"><%= scoreForJs %>/100</span>
                </div>

                <div class="info-row">
                    <span class="info-label">Result</span>
                    <span class="info-value"><%= scoreStatus %></span>
                </div>

                <div class="actions">
                    <a class="btn btn-primary"
                       href="${pageContext.request.contextPath}/upload_resume">
                        📤 Analyze Another Resume
                    </a>

                    <a class="btn btn-secondary"
                       href="${pageContext.request.contextPath}/resume-history">
                        📚 Resume History
                    </a>
                </div>
            </div>

            <section class="card full-width">
                <h2>✨ AI-Powered Resume Insights</h2>
                <p class="card-description">
                    Your personalized resume evaluation, skill insights and career improvement points.
                </p>

                <div class="analysis-content" id="analysisContent"><%= org.springframework.web.util.HtmlUtils.htmlEscape(aiResultText) %></div>

                <div class="actions">
                    <button type="button" class="btn btn-secondary"
                            onclick="copyAnalysis()">
                        📋 Copy Analysis
                    </button>

                    <button type="button" class="btn btn-secondary"
                            onclick="downloadAnalysis()">
                        ⬇️ Download Analysis
                    </button>

                    <a class="btn btn-purple"
                       href="${pageContext.request.contextPath}/job-matching">
                        🎯 Match With Job
                    </a>
                </div>
            </section>

            <section class="card full-width">
                <h2>📄 Extracted Resume Text</h2>
                <p class="card-description">
                    Text extracted from the uploaded PDF for AI analysis.
                </p>

                <div class="resume-content" id="resumeContent"><%= org.springframework.web.util.HtmlUtils.htmlEscape(resumeTextValue) %></div>

                <div class="actions">
                    <button type="button" class="btn btn-secondary"
                            onclick="copyResumeText()">
                        📋 Copy Resume Text
                    </button>
                </div>
            </section>

        </section>

    </main>

    <footer class="footer">
        <p><strong>🤖 AI Resume Analyzer</strong></p>
        <p>Intelligent AI Resume Analyzer and Career Assistant</p>
        <p>Developed by Krishnakant Patidar</p>
        <p>Contact: patidarkrishna188@gmail.com</p>
        <p>© 2026 AI Resume Analyzer | All Rights Reserved</p>
    </footer>

    <script>
        /*
         * Changes only the displayed analysis headings.
         * The original AI response in the database is not modified.
         */
        function formatAnalysisHeadings() {
            const analysisElement = document.getElementById("analysisContent");

            if (!analysisElement) {
                return;
            }

            const headingMap = {
                "ATS SCORE": "ATS COMPATIBILITY SCORE",
                "PROFILE SUMMARY": "CANDIDATE SNAPSHOT",
                "TECHNICAL SKILLS": "TECHNICAL SKILLSET",
                "SKILL ANALYSIS": "SKILLS OVERVIEW",
                "STRENGTHS": "KEY STRENGTHS",
                "WEAKNESSES": "GROWTH AREAS",
                "EXPERIENCE ANALYSIS": "PROFESSIONAL EXPERIENCE INSIGHTS",
                "IMPROVEMENT SUGGESTIONS": "CAREER BOOSTER RECOMMENDATIONS",
                "MISSING SKILLS": "SKILLS TO DEVELOP"
            };

            const originalText = analysisElement.innerText || "";
            const lines = originalText.split("\n");

            const updatedLines = lines.map(function (line) {
                const trimmedLine = line.trim();
                const colonIndex = trimmedLine.indexOf(":");

                let heading = "";
                let remainder = "";

                if (colonIndex >= 0) {
                    heading = trimmedLine.substring(0, colonIndex).trim();
                    remainder = trimmedLine.substring(colonIndex);
                } else {
                    heading = trimmedLine;
                }

                const upperHeading = heading.toUpperCase();

                if (Object.prototype.hasOwnProperty.call(headingMap, upperHeading)) {
                    const replacement = headingMap[upperHeading];

                    if (colonIndex >= 0) {
                        return line.substring(0, line.indexOf(trimmedLine))
                            + replacement + remainder;
                    }

                    return line.substring(0, line.indexOf(trimmedLine))
                        + replacement;
                }

                return line;
            });

            analysisElement.textContent = updatedLines.join("\n");
        }

        function copyText(elementId, successMessage) {
            const element = document.getElementById(elementId);
            const text = element ? element.innerText : "";

            if (!text.trim()) {
                alert("There is no text available to copy.");
                return;
            }

            if (navigator.clipboard && window.isSecureContext) {
                navigator.clipboard.writeText(text)
                    .then(function () {
                        alert(successMessage);
                    })
                    .catch(function () {
                        fallbackCopy(text, successMessage);
                    });
            } else {
                fallbackCopy(text, successMessage);
            }
        }

        function fallbackCopy(text, successMessage) {
            const textarea = document.createElement("textarea");
            textarea.value = text;
            textarea.style.position = "fixed";
            textarea.style.left = "-9999px";

            document.body.appendChild(textarea);
            textarea.select();

            try {
                const copied = document.execCommand("copy");
                alert(copied ? successMessage : "Unable to copy text.");
            } catch (error) {
                alert("Unable to copy text. Please select and copy it manually.");
            }

            document.body.removeChild(textarea);
        }

        function copyAnalysis() {
            copyText("analysisContent", "AI analysis copied successfully!");
        }

        function copyResumeText() {
            copyText("resumeContent", "Resume text copied successfully!");
        }

        function downloadAnalysis() {
            const element = document.getElementById("analysisContent");
            const text = element ? element.innerText : "";

            if (!text.trim()) {
                alert("No analysis is available to download.");
                return;
            }

            const blob = new Blob([text], {
                type: "text/plain;charset=utf-8"
            });

            const url = URL.createObjectURL(blob);
            const link = document.createElement("a");

            link.href = url;
            link.download = "resume-analysis.txt";

            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);

            URL.revokeObjectURL(url);
        }

        document.addEventListener("DOMContentLoaded", function () {
            formatAnalysisHeadings();
        });
    </script>

</body>
</html>
