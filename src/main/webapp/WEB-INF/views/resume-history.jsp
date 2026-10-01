<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>Resume History - AI Resume Analyzer</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f7f9;
            color: #1f2937;
            min-height: 100vh;
        }

        /* ================= NAVBAR ================= */

        .navbar {
            width: 100%;
            background: #ffffff;
            border-bottom: 1px solid #e5e7eb;
            padding: 16px 6%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 22px;
            font-weight: 700;
            color: #0f766e;
            text-decoration: none;
            white-space: nowrap;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .nav-links a {
            text-decoration: none;
            color: #374151;
            font-size: 14px;
            font-weight: 600;
            padding: 10px 13px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .nav-links a:hover {
            background: #ecfdf5;
            color: #0f766e;
        }

        .nav-links a.active {
            background: #0f766e;
            color: white;
        }

        .user-name {
            color: #0f766e !important;
            background: #ecfdf5;
        }

        .logout {
            color: #dc2626 !important;
        }

        .logout:hover {
            background: #fef2f2 !important;
            color: #b91c1c !important;
        }

        /* ================= CONTAINER ================= */

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 45px auto;
        }

        /* ================= HEADER ================= */

        .page-header {
            margin-bottom: 28px;
        }

        .page-header h1 {
            font-size: 32px;
            color: #111827;
            margin-bottom: 8px;
        }

        .page-header p {
            color: #6b7280;
            font-size: 15px;
        }

        /* ================= INFO BAR ================= */

        .info-bar {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 18px 22px;
            margin-bottom: 22px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.04);
        }

        .info-title {
            font-size: 16px;
            font-weight: 700;
            color: #374151;
        }

        .resume-count {
            background: #ecfdf5;
            color: #0f766e;
            padding: 7px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 700;
        }

        /* ================= TABLE CARD ================= */

        .table-card {
            background: white;
            border-radius: 14px;
            border: 1px solid #e5e7eb;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 750px;
        }

        thead {
            background: #f0fdfa;
        }

        th {
            text-align: left;
            padding: 17px 20px;
            color: #115e59;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1px solid #d1fae5;
        }

        td {
            padding: 18px 20px;
            border-bottom: 1px solid #f0f0f0;
            font-size: 14px;
            color: #374151;
            vertical-align: middle;
        }

        tbody tr {
            transition: 0.2s;
        }

        tbody tr:hover {
            background: #f9fffd;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        /* ================= FILE NAME ================= */

        .file-name {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 600;
            color: #1f2937;
        }

        .file-icon {
            width: 38px;
            height: 38px;
            border-radius: 9px;
            background: #ecfdf5;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0;
        }

        /* ================= SCORE ================= */

        .score-badge {
            display: inline-block;
            padding: 7px 13px;
            border-radius: 20px;
            background: #ecfdf5;
            color: #047857;
            font-weight: 700;
            font-size: 13px;
        }

        /* ================= VIEW BUTTON ================= */

        .view-btn {
            display: inline-block;
            text-decoration: none;
            background: #0f766e;
            color: white;
            padding: 9px 15px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            transition: 0.3s;
        }

        .view-btn:hover {
            background: #115e59;
            transform: translateY(-1px);
        }

        /* ================= EMPTY STATE ================= */

        .empty-state {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 14px;
            padding: 70px 30px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.04);
        }

        .empty-icon {
            font-size: 55px;
            margin-bottom: 18px;
        }

        .empty-state h2 {
            color: #111827;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .empty-state p {
            color: #6b7280;
            font-size: 15px;
            margin-bottom: 25px;
        }

        /* ================= BUTTON ================= */

        .primary-btn {
            display: inline-block;
            text-decoration: none;
            background: #0f766e;
            color: white;
            padding: 12px 20px;
            border-radius: 9px;
            font-size: 14px;
            font-weight: 700;
            transition: 0.3s;
        }

        .primary-btn:hover {
            background: #115e59;
            transform: translateY(-1px);
        }

        /* ================= BOTTOM BUTTON ================= */

        .bottom-action {
            margin-top: 25px;
            text-align: right;
        }

        /* ================= FOOTER ================= */

        footer {
            margin-top: 60px;
            padding: 25px;
            text-align: center;
            color: #6b7280;
            font-size: 13px;
            border-top: 1px solid #e5e7eb;
            background: #ffffff;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .navbar {
                flex-direction: column;
                gap: 15px;
            }

            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }

            .page-header h1 {
                font-size: 27px;
            }

        }

        @media (max-width: 600px) {

            .container {
                width: 94%;
                margin: 30px auto;
            }

            .info-bar {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }

            .page-header h1 {
                font-size: 24px;
            }

            .bottom-action {
                text-align: center;
            }

        }

    </style>

</head>


<body>

    <!-- Navbar -->

    <nav class="navbar">

        <a href="${pageContext.request.contextPath}/home"
           class="logo">
            🤖 AI Resume Analyzer
        </a>

        <div class="nav-links">

            <a href="${pageContext.request.contextPath}/home">
                🏠 Home
            </a>

            <a href="${pageContext.request.contextPath}/upload_resume">
                📄 Analyze Resume
            </a>

            <a href="${pageContext.request.contextPath}/resume-history"
               class="active">
                📊 Resume History
            </a>

            <a href="${pageContext.request.contextPath}/home#features">
                ✨ Features
            </a>

            <a href="${pageContext.request.contextPath}/home#how-it-works">
                ⚙️ How It Works
            </a>

            <c:if test="${not empty user}">
                <a href="#" class="user-name">
                    👋 Hi, ${user.name}
                </a>
            </c:if>

            <a href="${pageContext.request.contextPath}/logout"
               class="logout">
                🚪 Logout
            </a>

        </div>

    </nav>


    <!-- Main Content -->

    <main class="container">

        <div class="page-header">

            <h1>
                📊 Resume Analysis History
            </h1>

            <p>
                View and manage your previously analyzed resumes and ATS scores.
            </p>

        </div>


        <c:choose>

            <c:when test="${empty resumes}">

                <div class="empty-state">

                    <div class="empty-icon">
                        📄
                    </div>

                    <h2>
                        No Resume History Found
                    </h2>

                    <p>
                        You have not analyzed any resume yet.
                        Upload your first resume to get an AI-powered ATS analysis.
                    </p>

                    <a href="${pageContext.request.contextPath}/upload_resume"
                       class="primary-btn">
                        ✨ Analyze Your First Resume
                    </a>

                </div>

            </c:when>


            <c:otherwise>

                <div class="info-bar">

                    <div class="info-title">
                        📁 Your Resume Reports
                    </div>

                    <div class="resume-count">
                        ${resumes.size()} Resume(s)
                    </div>

                </div>


                <div class="table-card">

                    <div class="table-wrapper">

                        <table>

                            <thead>

                                <tr>

                                    <th>
                                        #
                                    </th>

                                    <th>
                                        Resume
                                    </th>

                                    <th>
                                        ATS Score
                                    </th>

                                    <th>
                                        Uploaded Date
                                    </th>

                                    <th>
                                        Action
                                    </th>

                                </tr>

                            </thead>


                            <tbody>

                                <c:forEach var="resume"
                                           items="${resumes}"
                                           varStatus="status">

                                    <tr>

                                        <td>
                                            ${status.count}
                                        </td>


                                        <td>

                                            <div class="file-name">

                                                <div class="file-icon">
                                                    📄
                                                </div>

                                                <span>
                                                    ${resume.fileName}
                                                </span>

                                            </div>

                                        </td>


                                        <td>

                                            <span class="score-badge">
                                                ${resume.resumeScore}/100
                                            </span>

                                        </td>


                                        <td>
                                            ${resume.uploadedAt}
                                        </td>


                                        <td>

                                            <a href="${pageContext.request.contextPath}/resume/${resume.id}"
                                               class="view-btn">
                                                👁 View Analysis
                                            </a>

                                        </td>

                                    </tr>

                                </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </div>


                <div class="bottom-action">

                    <a href="${pageContext.request.contextPath}/upload_resume"
                       class="primary-btn">
                        ➕ Analyze Another Resume
                    </a>

                </div>

            </c:otherwise>

        </c:choose>

    </main>


    <!-- Footer -->

    <footer>

        © 2026 AI Resume Analyzer |
        Built with Java, Spring Boot, JSP, MySQL & Gemini AI

    </footer>


</body>

</html>