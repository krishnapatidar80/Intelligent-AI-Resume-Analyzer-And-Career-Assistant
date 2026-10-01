<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>AI Resume Rewriter</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #1e293b;
            min-height: 100vh;
        }

        /* =========================
           NAVBAR
        ========================= */

        .navbar {
            height: 70px;
            background: #0f172a;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 45px;
            color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.12);
        }

        .logo {
            font-size: 21px;
            font-weight: 700;
            letter-spacing: 0.3px;
        }

        .logo span {
            color: #38bdf8;
        }

        .user-area {
            display: flex;
            align-items: center;
            gap: 15px;
            font-size: 14px;
        }

        .user-name {
            color: #e2e8f0;
        }

        .home-btn {
            text-decoration: none;
            color: white;
            border: 1px solid #475569;
            padding: 8px 16px;
            border-radius: 7px;
            transition: 0.3s;
        }

        .home-btn:hover {
            background: #1e293b;
        }


        /* =========================
           MAIN CONTAINER
        ========================= */

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 45px auto;
        }


        /* =========================
           HEADER
        ========================= */

        .page-header {
            text-align: center;
            margin-bottom: 35px;
        }

        .page-header .icon {
            width: 65px;
            height: 65px;
            margin: auto;
            border-radius: 50%;
            background: #e0f2fe;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 29px;
        }

        .page-header h1 {
            margin-top: 16px;
            font-size: 31px;
            color: #0f172a;
        }

        .page-header p {
            margin-top: 9px;
            color: #64748b;
            font-size: 15px;
        }


        /* =========================
           CARD
        ========================= */

        .card {
            background: white;
            border-radius: 14px;
            padding: 35px;
            box-shadow: 0 6px 25px rgba(15, 23, 42, 0.08);
            border: 1px solid #e2e8f0;
        }


        /* =========================
           INFO BOX
        ========================= */

        .info-box {
            background: #eff6ff;
            border-left: 4px solid #38bdf8;
            padding: 17px 20px;
            border-radius: 7px;
            margin-bottom: 30px;
        }

        .info-box h3 {
            color: #0f172a;
            font-size: 16px;
            margin-bottom: 6px;
        }

        .info-box p {
            color: #475569;
            font-size: 14px;
            line-height: 1.6;
        }


        /* =========================
           FORM
        ========================= */

        .form-group {
            margin-bottom: 24px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 9px;
        }

        .required {
            color: #ef4444;
        }

        select,
        input,
        textarea {

            width: 100%;

            padding: 13px 14px;

            border: 1px solid #cbd5e1;

            border-radius: 8px;

            font-size: 14px;

            color: #1e293b;

            background: white;

            outline: none;

            transition: 0.25s;
        }

        select:focus,
        input:focus,
        textarea:focus {

            border-color: #38bdf8;

            box-shadow:
                0 0 0 3px rgba(56,189,248,0.12);
        }

        textarea {

            min-height: 190px;

            resize: vertical;

            line-height: 1.6;
        }

        .helper-text {
            margin-top: 7px;
            font-size: 12px;
            color: #64748b;
        }


        /* =========================
           GRID
        ========================= */

        .two-column {

            display: grid;

            grid-template-columns:
                1fr 1fr;

            gap: 20px;
        }


        /* =========================
           BUTTON
        ========================= */

        .button-area {

            display: flex;

            justify-content: center;

            margin-top: 30px;
        }

        .rewrite-btn {

            border: none;

            background: #0f172a;

            color: white;

            padding: 14px 35px;

            border-radius: 8px;

            font-size: 15px;

            font-weight: 600;

            cursor: pointer;

            transition: 0.3s;

            min-width: 210px;
        }

        .rewrite-btn:hover {

            background: #1e293b;

            transform: translateY(-1px);

            box-shadow:
                0 6px 15px
                rgba(15,23,42,0.18);
        }


        /* =========================
           FEATURES
        ========================= */

        .features {

            margin-top: 35px;

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 18px;
        }

        .feature {

            background: #f8fafc;

            border: 1px solid #e2e8f0;

            border-radius: 10px;

            padding: 20px;

            text-align: center;
        }

        .feature-icon {

            font-size: 25px;

            margin-bottom: 10px;
        }

        .feature h4 {

            font-size: 14px;

            color: #0f172a;

            margin-bottom: 6px;
        }

        .feature p {

            font-size: 12px;

            color: #64748b;

            line-height: 1.5;
        }


        /* =========================
           FOOTER
        ========================= */

        .footer {

            text-align: center;

            margin-top: 35px;

            padding-bottom: 30px;

            color: #94a3b8;

            font-size: 12px;
        }


        /* =========================
           LOADING
        ========================= */

        .loading {

            display: none;

            text-align: center;

            margin-top: 20px;

            color: #475569;

            font-size: 14px;
        }

        .spinner {

            display: inline-block;

            width: 17px;

            height: 17px;

            border: 2px solid #cbd5e1;

            border-top-color: #0f172a;

            border-radius: 50%;

            animation: spin 0.8s linear infinite;

            vertical-align: middle;

            margin-right: 7px;
        }

        @keyframes spin {

            to {
                transform: rotate(360deg);
            }

        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media(max-width: 768px) {

            .navbar {
                padding: 0 20px;
            }

            .container {
                width: 94%;
                margin: 30px auto;
            }

            .card {
                padding: 22px;
            }

            .two-column {
                grid-template-columns: 1fr;
            }

            .features {
                grid-template-columns: 1fr;
            }

            .page-header h1 {
                font-size: 25px;
            }

            .user-name {
                display: none;
            }

        }

    </style>

</head>


<body>


<!-- =========================================================
     NAVBAR
========================================================= -->

<nav class="navbar">

    <div class="logo">
        Intelligent <span>AI</span> Resume Analyzer
    </div>

    <div class="user-area">

        <span class="user-name">
            Welcome, ${user.name}
        </span>

        <a href="${pageContext.request.contextPath}/home"
            class="home-btn">
            Home
        </a>

    </div>

</nav>


<!-- =========================================================
     MAIN
========================================================= -->

<div class="container">


    <!-- PAGE HEADER -->

    <div class="page-header">

        <div class="icon">
            ✨
        </div>

        <h1>
            AI Resume Rewriter
        </h1>

        <p>
            Improve your resume with AI-powered professional
            and ATS-friendly rewriting.
        </p>

    </div>


    <!-- =====================================================
         MAIN CARD
    ===================================================== -->

    <div class="card">


        <!-- INFORMATION -->

        <div class="info-box">

            <h3>
                How AI Resume Rewriter Works
            </h3>

            <p>
                Select your existing resume and optionally provide
                a target job title and job description. Gemini AI
                will rewrite your resume using only your existing
                information while improving professional wording,
                structure, clarity and ATS readability.
            </p>

        </div>


        <!-- =================================================
             FORM
        ================================================= -->

        <form
            action="${pageContext.request.contextPath}/rewrite-resume"
            method="post"
            onsubmit="showLoading()">


            <!-- RESUME -->

            <div class="form-group">

                <label for="resumeId">

                    Select Resume
                    <span class="required">*</span>

                </label>


                <select
                    id="resumeId"
                    name="resumeId"
                    required>

                    <option value="">
                        -- Select your resume --
                    </option>


                    <c:forEach
                        var="resume"
                        items="${resumes}">

                        <option value="${resume.id}">

                            ${resume.fileName}

                        </option>

                    </c:forEach>

                </select>


                <div class="helper-text">

                    Select the resume you want Gemini AI
                    to rewrite.

                </div>

            </div>


            <!-- TWO COLUMN -->

            <div class="two-column">


                <!-- JOB TITLE -->

                <div class="form-group">

                    <label for="jobTitle">

                        Target Job Title

                    </label>

                    <input
                        type="text"
                        id="jobTitle"
                        name="jobTitle"
                        placeholder="Example: Java Developer">

                    <div class="helper-text">

                        Optional — helps AI make the resume
                        more relevant to the target role.

                    </div>

                </div>


                <!-- EMPTY SPACE -->

                <div></div>


            </div>


            <!-- JOB DESCRIPTION -->

            <div class="form-group">

                <label for="jobDescription">

                    Job Description

                </label>


                <textarea
                    id="jobDescription"
                    name="jobDescription"
                    placeholder="Paste the job description here (optional)..."></textarea>


                <div class="helper-text">

                    Optional — if provided, Gemini AI will
                    improve job relevance using only skills
                    and experience already present in your resume.

                </div>

            </div>


            <!-- BUTTON -->

            <div class="button-area">

                <button
                    type="submit"
                    class="rewrite-btn">

                    ✨ Rewrite Resume with AI

                </button>

            </div>


            <!-- LOADING -->

            <div
                id="loading"
                class="loading">

                <span class="spinner"></span>

                Gemini AI is rewriting your resume...
                Please wait.

            </div>


        </form>


        <!-- =================================================
             FEATURES
        ================================================= -->

        <div class="features">


            <div class="feature">

                <div class="feature-icon">
                    📝
                </div>

                <h4>
                    Professional Writing
                </h4>

                <p>
                    Improves grammar, wording and
                    professional presentation.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">
                    🎯
                </div>

                <h4>
                    ATS Friendly
                </h4>

                <p>
                    Uses clear sections and relevant
                    keywords for better ATS readability.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">
                    🔒
                </div>

                <h4>
                    Fact Preserving
                </h4>

                <p>
                    AI does not invent skills,
                    experience or achievements.
                </p>

            </div>


        </div>


    </div>


    <!-- FOOTER -->

    <div class="footer">

        Intelligent AI Resume Analyzer and Career Assistant

    </div>


</div>


<!-- =========================================================
     JAVASCRIPT
========================================================= -->

<script>

    function showLoading() {

        document.getElementById("loading").style.display =
            "block";

    }

</script>


</body>

</html>
