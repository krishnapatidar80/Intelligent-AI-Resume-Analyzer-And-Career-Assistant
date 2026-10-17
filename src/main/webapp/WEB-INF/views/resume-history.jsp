<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Resume History | AI Resume Analyzer</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg: #070b17;
            --card: rgba(17, 25, 46, 0.78);
            --border: rgba(148, 163, 184, 0.18);
            --text: #e5edf9;
            --muted: #94a3b8;
            --cyan: #38bdf8;
            --purple: #a78bfa;
            --green: #34d399;
        }

        body {
            min-height: 100vh;
            font-family: "Segoe UI", Arial, sans-serif;
            color: var(--text);
            background:
                radial-gradient(ellipse at 15% 10%, rgba(56, 189, 248, 0.12), transparent 35%),
                radial-gradient(ellipse at 85% 35%, rgba(139, 92, 246, 0.13), transparent 35%),
                var(--bg);
            overflow-x: hidden;
        }

        body::before {
            content: "";
            position: fixed;
            inset: 0;
            z-index: -1;
            pointer-events: none;
            background-image:
                linear-gradient(rgba(148, 163, 184, 0.035) 1px, transparent 1px),
                linear-gradient(90deg, rgba(148, 163, 184, 0.035) 1px, transparent 1px);
            background-size: 45px 45px;
            animation: gridMove 25s linear infinite;
        }

        @keyframes gridMove {
            from { background-position: 0 0; }
            to { background-position: 45px 45px; }
        }

        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(18px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes glow {
            0%, 100% { opacity: 0.4; }
            50% { opacity: 0.8; }
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        .navbar {
            width: 100%;
            min-height: 74px;
            padding: 15px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            background: rgba(7, 11, 23, 0.82);
            border-bottom: 1px solid var(--border);
            backdrop-filter: blur(16px);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 11px;
            font-size: 19px;
            font-weight: 750;
            letter-spacing: 0.2px;
        }

        .brand-icon {
            width: 42px;
            height: 42px;
            display: grid;
            place-items: center;
            border-radius: 13px;
            color: white;
            background: linear-gradient(135deg, #0284c7, #7c3aed);
            box-shadow: 0 0 25px rgba(56, 189, 248, 0.2);
        }

        .brand span:last-child {
            color: var(--cyan);
        }

        .nav-links {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            flex-wrap: wrap;
        }

        .nav-links a {
            padding: 9px 12px;
            color: #b7c4d8;
            border-radius: 9px;
            font-size: 13px;
            transition: 0.25s ease;
        }

        .nav-links a:hover,
        .nav-links a.active {
            color: #ffffff;
            background: rgba(56, 189, 248, 0.12);
        }

        .nav-links a.active {
            border: 1px solid rgba(56, 189, 248, 0.25);
        }

        .container {
            width: min(1180px, 91%);
            margin: 0 auto;
        }

        .hero {
            padding: 64px 0 35px;
            animation: fadeUp 0.7s ease both;
        }

        .eyebrow {
            display: inline-flex;
            align-items: center;
            gap: 9px;
            padding: 8px 13px;
            border: 1px solid rgba(56, 189, 248, 0.25);
            border-radius: 30px;
            background: rgba(56, 189, 248, 0.08);
            color: #7dd3fc;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .status-dot {
            width: 7px;
            height: 7px;
            border-radius: 50%;
            background: var(--green);
            box-shadow: 0 0 12px var(--green);
            animation: glow 2s infinite;
        }

        .hero h1 {
            margin: 20px 0 13px;
            font-size: clamp(30px, 4vw, 46px);
            line-height: 1.15;
            letter-spacing: -1.3px;
        }

        .gradient-text {
            color: var(--cyan);
            background: linear-gradient(90deg, #38bdf8, #a78bfa);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero p {
            max-width: 680px;
            color: var(--muted);
            line-height: 1.8;
            font-size: 15px;
        }

        .summary {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            padding: 22px 25px;
            margin-bottom: 25px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 18px;
            backdrop-filter: blur(16px);
            animation: fadeUp 0.8s ease both;
        }

        .summary-left {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .summary-icon {
            width: 49px;
            height: 49px;
            border-radius: 14px;
            display: grid;
            place-items: center;
            font-size: 22px;
            background: rgba(56, 189, 248, 0.12);
            border: 1px solid rgba(56, 189, 248, 0.2);
        }

        .summary h2 {
            font-size: 16px;
            margin-bottom: 5px;
        }

        .summary p {
            color: var(--muted);
            font-size: 13px;
        }

        .count {
            min-width: 48px;
            height: 42px;
            padding: 0 12px;
            display: grid;
            place-items: center;
            border-radius: 12px;
            color: #7dd3fc;
            background: rgba(56, 189, 248, 0.1);
            border: 1px solid rgba(56, 189, 248, 0.2);
            font-size: 18px;
            font-weight: 800;
        }

        .primary-btn,
        .view-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            border: 1px solid transparent;
            border-radius: 10px;
            font-size: 13px;
            font-weight: 700;
            transition: 0.25s ease;
        }

        .primary-btn {
            padding: 12px 17px;
            color: #06111f;
            background: linear-gradient(135deg, #38bdf8, #818cf8);
        }

        .primary-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(56, 189, 248, 0.22);
        }

        .table-card {
            overflow: hidden;
            margin-bottom: 65px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 19px;
            backdrop-filter: blur(16px);
            animation: fadeUp 0.9s ease both;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            padding: 23px 25px;
            border-bottom: 1px solid var(--border);
        }

        .table-header h2 {
            font-size: 17px;
        }

        .table-header p {
            color: var(--muted);
            font-size: 12px;
            margin-top: 6px;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 760px;
        }

        thead {
            background: rgba(15, 23, 42, 0.7);
        }

        th {
            padding: 16px 22px;
            color: #94a3b8;
            text-align: left;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            font-size: 11px;
            font-weight: 700;
            white-space: nowrap;
        }

        td {
            padding: 19px 22px;
            border-top: 1px solid rgba(148, 163, 184, 0.1);
            color: #dbe6f5;
            font-size: 13px;
            vertical-align: middle;
        }

        tbody tr {
            transition: background 0.25s ease;
        }

        tbody tr:hover {
            background: rgba(56, 189, 248, 0.045);
        }

        .row-number {
            color: #718096;
            font-weight: 700;
        }

        .file-cell {
            display: flex;
            align-items: center;
            gap: 13px;
            min-width: 230px;
        }

        .pdf-icon {
            width: 42px;
            height: 46px;
            flex-shrink: 0;
            display: grid;
            place-items: center;
            border-radius: 10px;
            color: #fda4af;
            background: rgba(244, 63, 94, 0.1);
            border: 1px solid rgba(244, 63, 94, 0.18);
            font-size: 11px;
            font-weight: 800;
        }

        .file-name {
            max-width: 250px;
            overflow-wrap: anywhere;
            color: #e5edf9;
            font-weight: 650;
            line-height: 1.5;
        }

        .file-subtitle {
            margin-top: 4px;
            color: #718096;
            font-size: 11px;
        }

        .score {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-weight: 800;
            white-space: nowrap;
        }

        .score-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 55px;
            padding: 7px 10px;
            color: #6ee7b7;
            background: rgba(16, 185, 129, 0.1);
            border: 1px solid rgba(52, 211, 153, 0.18);
            border-radius: 9px;
        }

        .score-low {
            color: #fcd34d;
            background: rgba(245, 158, 11, 0.1);
            border-color: rgba(245, 158, 11, 0.2);
        }

        .date {
            color: #aab8cc;
            white-space: nowrap;
        }

        .view-btn {
            padding: 10px 13px;
            color: #7dd3fc;
            background: rgba(56, 189, 248, 0.08);
            border-color: rgba(56, 189, 248, 0.22);
            white-space: nowrap;
        }

        .view-btn:hover {
            color: #ffffff;
            background: rgba(56, 189, 248, 0.18);
            transform: translateY(-1px);
        }

        .empty-state {
            padding: 65px 25px 70px;
            text-align: center;
        }

        .empty-icon {
            width: 82px;
            height: 82px;
            margin: 0 auto 22px;
            display: grid;
            place-items: center;
            border-radius: 25px;
            font-size: 34px;
            background: linear-gradient(
                135deg,
                rgba(56, 189, 248, 0.13),
                rgba(139, 92, 246, 0.13)
            );
            border: 1px solid rgba(148, 163, 184, 0.17);
        }

        .empty-state h3 {
            margin-bottom: 12px;
            font-size: 23px;
        }

        .empty-state p {
            max-width: 460px;
            margin: 0 auto 25px;
            color: var(--muted);
            font-size: 14px;
            line-height: 1.8;
        }

        .footer {
            padding: 25px 5%;
            text-align: center;
            border-top: 1px solid var(--border);
            color: #718096;
            font-size: 12px;
            line-height: 1.9;
        }

        .footer strong {
            color: #a5b4fc;
        }

        @media (max-width: 900px) {
            .navbar {
                justify-content: center;
            }

            .brand {
                width: 100%;
                justify-content: center;
            }

            .hero {
                padding-top: 45px;
            }
        }

        @media (max-width: 600px) {
            .navbar {
                padding: 13px 4%;
            }

            .nav-links {
                gap: 3px;
            }

            .nav-links a {
                padding: 8px;
                font-size: 12px;
            }

            .container {
                width: 92%;
            }

            .hero {
                padding-top: 36px;
            }

            .summary {
                padding: 18px;
            }

            .summary .primary-btn {
                width: 100%;
            }

            .table-header {
                padding: 19px;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            *,
            *::before,
            *::after {
                animation-duration: 0.01ms !important;
                animation-iteration-count: 1 !important;
                scroll-behavior: auto !important;
                transition-duration: 0.01ms !important;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar">
        <a class="brand"
           href="${pageContext.request.contextPath}/home">
            <span class="brand-icon">✦</span>
            <span>AI Resume <span>Analyzer</span></span>
        </a>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/upload_resume">Upload Resume</a>
            <a class="active"
               href="${pageContext.request.contextPath}/resume-history">History</a>
            <a href="${pageContext.request.contextPath}/resume-rewriter">Resume Rewriter</a>
            <a href="${pageContext.request.contextPath}/job-matching">Job Matching</a>
            <a href="${pageContext.request.contextPath}/interview-questions">Interview Prep</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
    </nav>

    <main class="container">

        <section class="hero">
            <div class="eyebrow">
                <span class="status-dot"></span>
                Your Career Progress
            </div>

            <h1>
                Resume Analysis <span class="gradient-text">History</span>
            </h1>

            <p>
                Track your previous resume analyses, review your ATS scores,
                and revisit AI-powered feedback to keep improving your resume.
            </p>
        </section>

        <section class="summary">
            <div class="summary-left">
                <div class="summary-icon">▤</div>
                <div>
                    <h2>Your Resume Reports</h2>
                    <p>All resumes analyzed through your account</p>
                </div>
                <div class="count">
                    <c:out value="${empty resumes ? 0 : resumes.size()}" />
                </div>
            </div>

            <a class="primary-btn"
               href="${pageContext.request.contextPath}/upload_resume">
                + Analyze New Resume
            </a>
        </section>

        <section class="table-card">

            <div class="table-header">
                <div>
                    <h2>Previous Analyses</h2>
                    <p>Open any report to view its analysis details.</p>
                </div>
            </div>

            <c:choose>
                <c:when test="${empty resumes}">
                    <div class="empty-state">
                        <div class="empty-icon">📄</div>

                        <h3>No Resume History Yet</h3>

                        <p>
                            You haven't analyzed a resume yet. Upload your
                            resume to get an AI-powered review, ATS score,
                            strengths, weaknesses, and improvement suggestions.
                        </p>

                        <a class="primary-btn"
                           href="${pageContext.request.contextPath}/upload_resume">
                            Upload Your First Resume →
                        </a>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Resume Details</th>
                                    <th>ATS Score</th>
                                    <th>Uploaded Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="resume"
                                           items="${resumes}"
                                           varStatus="status">
                                    <tr>
                                        <td class="row-number">
                                            <c:out value="${status.count}" />
                                        </td>

                                        <td>
                                            <div class="file-cell">
                                                <div class="pdf-icon">PDF</div>

                                                <div>
                                                    <div class="file-name">
                                                        <c:choose>
                                                            <c:when test="${not empty resume.fileName}">
                                                                <c:out value="${resume.fileName}" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                Resume Report
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>

                                                    <div class="file-subtitle">
                                                        AI Analysis Report
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <td>
                                            <c:choose>
                                                <c:when test="${resume.resumeScore >= 70}">
                                                    <span class="score-badge">
                                                        <c:out value="${resume.resumeScore}" />/100
                                                    </span>
                                                </c:when>

                                                <c:when test="${not empty resume.resumeScore}">
                                                    <span class="score-badge score-low">
                                                        <c:out value="${resume.resumeScore}" />/100
                                                    </span>
                                                </c:when>

                                                <c:otherwise>
                                                    <span class="score-badge score-low">
                                                        N/A
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td class="date">
                                            <c:choose>
                                                <c:when test="${not empty resume.uploadedAt}">
                                                    <c:out value="${resume.uploadedAt}" />
                                                </c:when>
                                                <c:otherwise>
                                                    Not available
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td>
                                            <a class="view-btn"
                                               href="${pageContext.request.contextPath}/resume/${resume.id}">
                                                View Analysis →
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>

        </section>
    </main>

    <footer class="footer">
        <div>
            <strong>Intelligent AI Resume Analyzer &amp; Career Assistant</strong>
        </div>
        <div>
            Developed by Krishnakant Patidar
        </div>
        <div>
            Java · Spring Boot · JSP · MySQL · Gemini AI
        </div>
    </footer>

</body>
</html>