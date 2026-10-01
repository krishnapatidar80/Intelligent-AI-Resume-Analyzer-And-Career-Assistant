<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>AI Rewritten Resume</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f7fb;
            color: #1e293b;
        }

        .navbar {
            background: #0f172a;
            color: white;
            padding: 18px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 21px;
            font-weight: bold;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 14px;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 35px auto;
        }

        .header-card {
            background: white;
            padding: 28px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }

        .header-card h1 {
            color: #0f172a;
            margin-bottom: 10px;
        }

        .header-card p {
            color: #64748b;
            line-height: 1.6;
        }

        .job-info {
            margin-top: 18px;
            padding: 15px;
            background: #f8fafc;
            border-left: 4px solid #38bdf8;
            border-radius: 8px;
        }

        .job-info strong {
            color: #0f172a;
        }

        .resume-card {
            background: white;
            border-radius: 14px;
            padding: 35px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .resume-card h2 {
            color: #0f172a;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 2px solid #e2e8f0;
        }

        .resume-content {
            white-space: pre-wrap;
            line-height: 1.7;
            font-size: 15px;
            color: #334155;
            background: #f8fafc;
            padding: 25px;
            border-radius: 10px;
            border: 1px solid #e2e8f0;
        }

        .actions {
            margin-top: 25px;
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-primary {
            background: #0f172a;
            color: white;
        }

        .btn-primary:hover {
            background: #1e293b;
        }

        .btn-secondary {
            background: #e2e8f0;
            color: #0f172a;
        }

        .btn-secondary:hover {
            background: #cbd5e1;
        }

        .success {
            background: #ecfdf5;
            color: #047857;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #10b981;
        }

        @media print {

            .navbar,
            .actions,
            .header-card {
                display: none;
            }

            body {
                background: white;
            }

            .container {
                width: 100%;
                margin: 0;
            }

            .resume-card {
                box-shadow: none;
                padding: 0;
            }

            .resume-content {
                border: none;
                background: white;
            }
        }

        @media(max-width: 700px) {

            .navbar {
                flex-direction: column;
                gap: 12px;
            }

            .nav-links a {
                margin: 0 7px;
            }

            .resume-card {
                padding: 20px;
            }

            .resume-content {
                padding: 15px;
            }
        }

    </style>

</head>

<body>

<!-- =====================================================
     NAVBAR
===================================================== -->

<nav class="navbar">

    <div class="logo">
        AI Resume Analyzer
    </div>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/home">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/resume-rewriter">
            Resume Rewriter
        </a>

    </div>

</nav>


<!-- =====================================================
     MAIN CONTAINER
===================================================== -->

<div class="container">


    <!-- HEADER -->

    <div class="header-card">

        <h1>
            AI Rewritten Resume
        </h1>

        <p>
            Your resume has been professionally rewritten using
            Gemini AI while preserving the original information
            and improving clarity, structure and ATS readability.
        </p>


        <div class="job-info">

            <p>
                <strong>Target Job:</strong>

                ${empty jobTitle ? "General Professional Resume" : jobTitle}

            </p>

        </div>

    </div>


    <!-- SUCCESS MESSAGE -->

    <div class="success">

        ✓ Resume successfully rewritten by Gemini AI.

    </div>


    <!-- REWRITTEN RESUME -->

    <div class="resume-card">

        <h2>
            Rewritten Resume
        </h2>


        <div class="resume-content">

${rewrittenResume}

        </div>


        <!-- ACTION BUTTONS -->

        <div class="actions">

            <button
                    class="btn btn-primary"
                    onclick="window.print()">

                Print / Save as PDF

            </button>


            <a
                    href="${pageContext.request.contextPath}/resume-rewriter"
                    class="btn btn-secondary">

                Rewrite Again

            </a>


            <a
                    href="${pageContext.request.contextPath}/home"
                    class="btn btn-secondary">

                Back to Dashboard

            </a>

        </div>

    </div>

</div>


</body>

</html> --%>





<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>AI Rewritten Resume | AI Resume Analyzer</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f1f5f9;
            color: #1e293b;
            line-height: 1.6;
        }

        /* =====================================================
           NAVBAR
        ===================================================== */

        .navbar {
            background: #0f766e;
            color: white;
            padding: 0 5%;
            box-shadow: 0 3px 15px rgba(0,0,0,0.15);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar-top {
            min-height: 58px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            color: white;
            font-size: 21px;
            font-weight: 700;
            white-space: nowrap;
        }

        .top-user {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-name {
            background: rgba(255,255,255,0.14);
            padding: 7px 13px;
            border-radius: 20px;
            font-size: 13px;
            white-space: nowrap;
        }

        .logout {
            background: #dc2626;
            color: white !important;
            text-decoration: none;
            padding: 7px 13px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
            white-space: nowrap;
            transition: 0.2s;
        }

        .logout:hover {
            background: #b91c1c;
        }

        .nav-links {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            padding: 8px 0 10px;
            overflow-x: auto;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            padding: 7px 10px;
            border-radius: 7px;
            white-space: nowrap;
            transition: 0.2s;
        }

        .nav-links a:hover,
        .nav-links a.active {
            background: rgba(255,255,255,0.16);
        }

        /* =====================================================
           PAGE
        ===================================================== */

        .container {
            width: 92%;
            max-width: 1150px;
            margin: 35px auto 60px;
        }

        /* =====================================================
           PAGE HEADER
        ===================================================== */

        .page-header {
            background: white;
            border-radius: 16px;
            padding: 28px 30px;
            margin-bottom: 20px;
            box-shadow: 0 5px 22px rgba(15,23,42,0.07);
            border: 1px solid #e2e8f0;
        }

        .success-title {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 9px;
        }

        .success-icon {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #dcfce7;
            color: #15803d;
            border-radius: 50%;
            font-size: 21px;
            font-weight: bold;
        }

        .page-header h1 {
            color: #0f172a;
            font-size: 27px;
        }

        .page-header p {
            color: #64748b;
            font-size: 15px;
            margin-left: 54px;
        }

        /* =====================================================
           INFO ROW
        ===================================================== */

        .info-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
            margin-bottom: 22px;
        }

        .info-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 18px 20px;
            box-shadow: 0 4px 15px rgba(15,23,42,0.05);
        }

        .info-label {
            display: block;
            color: #64748b;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 5px;
        }

        .info-value {
            color: #0f172a;
            font-size: 15px;
            font-weight: 600;
        }

        /* =====================================================
           RESUME PREVIEW
        ===================================================== */

        .resume-wrapper {
            background: #e2e8f0;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 5px 25px rgba(15,23,42,0.08);
        }

        .resume-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
            color: #475569;
        }

        .resume-toolbar h2 {
            font-size: 17px;
            color: #0f172a;
        }

        .resume-toolbar span {
            font-size: 12px;
        }

        /*
           A4-like resume document
        */

        .resume-paper {
            background: white;
            width: 100%;
            max-width: 900px;
            min-height: 1050px;
            margin: 0 auto;
            padding: 48px 55px;
            box-shadow: 0 8px 30px rgba(15,23,42,0.14);
            border-radius: 3px;
        }

        .resume-content {
            white-space: pre-wrap;
            word-wrap: break-word;
            overflow-wrap: anywhere;
            color: #1e293b;
            font-size: 14px;
            line-height: 1.75;
            font-family: Arial, Helvetica, sans-serif;
        }

        /* =====================================================
           ACTIONS
        ===================================================== */

        .actions-section {
            background: white;
            border-radius: 14px;
            padding: 22px;
            margin-top: 22px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 15px rgba(15,23,42,0.05);
        }

        .actions-title {
            color: #0f172a;
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 14px;
        }

        .actions {
            display: flex;
            gap: 11px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            padding: 11px 17px;
            border-radius: 8px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .btn-primary {
            background: #0f766e;
            color: white;
        }

        .btn-primary:hover {
            background: #115e59;
            transform: translateY(-1px);
        }

        .btn-secondary {
            background: #f1f5f9;
            color: #0f172a;
            border: 1px solid #cbd5e1;
        }

        .btn-secondary:hover {
            background: #e2e8f0;
        }

        .btn-dark {
            background: #0f172a;
            color: white;
        }

        .btn-dark:hover {
            background: #1e293b;
        }

        /* =====================================================
           FOOTER NOTE
        ===================================================== */

        .footer-note {
            text-align: center;
            color: #94a3b8;
            font-size: 12px;
            margin-top: 25px;
        }

        /* =====================================================
           PRINT
        ===================================================== */

        @media print {

            body {
                background: white;
            }

            .navbar,
            .page-header,
            .info-row,
            .resume-toolbar,
            .actions-section,
            .footer-note {
                display: none !important;
            }

            .container {
                width: 100%;
                max-width: none;
                margin: 0;
            }

            .resume-wrapper {
                padding: 0;
                background: white;
                box-shadow: none;
            }

            .resume-paper {
                width: 100%;
                max-width: none;
                min-height: auto;
                padding: 0;
                box-shadow: none;
                border-radius: 0;
            }

            .resume-content {
                font-size: 12px;
                line-height: 1.55;
            }
        }

        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 900px) {

            .navbar {
                padding: 0 20px;
            }

            .nav-links {
                justify-content: flex-start;
            }

            .info-row {
                grid-template-columns: 1fr;
            }

            .resume-paper {
                padding: 35px;
            }
        }

        @media (max-width: 650px) {

            .navbar-top {
                flex-wrap: wrap;
                gap: 8px;
                padding: 10px 0;
            }

            .logo {
                font-size: 18px;
            }

            .top-user {
                width: 100%;
                justify-content: flex-end;
            }

            .container {
                width: 94%;
                margin-top: 20px;
            }

            .page-header {
                padding: 22px;
            }

            .page-header h1 {
                font-size: 22px;
            }

            .page-header p {
                margin-left: 0;
                margin-top: 10px;
            }

            .success-title {
                align-items: flex-start;
            }

            .resume-wrapper {
                padding: 12px;
            }

            .resume-paper {
                padding: 25px 20px;
            }

            .resume-content {
                font-size: 13px;
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


<!-- =====================================================
     NAVBAR
===================================================== -->

<nav class="navbar">

    <div class="navbar-top">

        <div class="logo">
            🤖 AI Resume Analyzer
        </div>

        <div class="top-user">

            <span class="user-name">
                👋 Hi, ${user.name}
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

        <a class="active"
           href="${pageContext.request.contextPath}/resume-rewriter">
            ✨ AI Resume Rewriter
        </a>

        <a href="${pageContext.request.contextPath}/job-matching">
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


<!-- =====================================================
     MAIN
===================================================== -->

<div class="container">


    <!-- =================================================
         SUCCESS HEADER
    ================================================== -->

    <div class="page-header">

        <div class="success-title">

            <div class="success-icon">
                ✓
            </div>

            <h1>
                Resume Successfully Rewritten
            </h1>

        </div>

        <p>
            Gemini AI has professionally rewritten your resume
            while preserving your original information and improving
            clarity, structure, professional wording and ATS readability.
        </p>

    </div>


    <!-- =================================================
         INFORMATION
    ================================================== -->

    <div class="info-row">

        <div class="info-card">

            <span class="info-label">
                Target Job
            </span>

            <span class="info-value">
                ${empty jobTitle ? "General Professional Resume" : jobTitle}
            </span>

        </div>


        <div class="info-card">

            <span class="info-label">
                AI Processing
            </span>

            <span class="info-value">
                ✓ Gemini AI Resume Rewriting
            </span>

        </div>

    </div>


    <!-- =================================================
         RESUME PREVIEW
    ================================================== -->

    <div class="resume-wrapper">

        <div class="resume-toolbar">

            <h2>
                📄 Rewritten Resume Preview
            </h2>

            <span>
                Professional ATS-friendly format
            </span>

        </div>


        <div class="resume-paper">

            <div class="resume-content">${rewrittenResume}</div>

        </div>

    </div>


    <!-- =================================================
         ACTIONS
    ================================================== -->

    <div class="actions-section">

        <div class="actions-title">
            What would you like to do next?
        </div>


        <div class="actions">


            <button
                    class="btn btn-primary"
                    onclick="window.print()">

                🖨️ Print / Save as PDF

            </button>


            <a
                    href="${pageContext.request.contextPath}/resume-rewriter"
                    class="btn btn-dark">

                ✨ Rewrite Again

            </a>


            <a
                    href="${pageContext.request.contextPath}/job-matching"
                    class="btn btn-secondary">

                💼 Check Job Match

            </a>


            <a
                    href="${pageContext.request.contextPath}/interview-questions"
                    class="btn btn-secondary">

                🎯 Practice Interview

            </a>


            <a
                    href="${pageContext.request.contextPath}/home"
                    class="btn btn-secondary">

                🏠 Back to Dashboard

            </a>

        </div>

    </div>


    <div class="footer-note">

        AI Resume Analyzer • Powered by Gemini AI

    </div>


</div>


</body>

</html>
