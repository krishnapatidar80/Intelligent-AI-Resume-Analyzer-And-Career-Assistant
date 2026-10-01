<%-- <%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Upload Resume</title>

    <style>

        body {
            margin: 0;
            font-family: Arial;
            background: #f4f6f8;
        }

        .container {
            width: 500px;
            margin: 70px auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
        }

        input[type="file"] {
            width: 100%;
            margin: 20px 0;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #0d6efd;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .error {
            color: red;
            text-align: center;
        }

    </style>

</head>

<body>

<div class="container">

    <h2>Upload Your Resume</h2>

    <p>
        Upload your resume in PDF format.
    </p>


    <% if(request.getAttribute("error") != null) { %>

        <p class="error">
            <%= request.getAttribute("error") %>
        </p>

    <% } %>


    <form action="${pageContext.request.contextPath}/upload"
          method="post"
          enctype="multipart/form-data">

        <input
            type="file"
            name="file"
            accept=".pdf"
            required>

        <button type="submit">
            Upload & Analyze
        </button>

    </form>


    <br>

    <a href="${pageContext.request.contextPath}/home">
        Back to Dashboard
    </a>

</div>

</body>

</html> --%>





<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>Upload Resume - AI Resume Analyzer</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            min-height: 100vh;
        }

        /* NAVBAR */

	/* =====================================================
   PROFESSIONAL NAVBAR
===================================================== */

.navbar {
    background: #0f766e;
    color: white;
    padding: 0 5%;
    box-shadow: 0 3px 15px rgba(0, 0, 0, 0.15);
    position: sticky;
    top: 0;
    z-index: 1000;
}


/* ================= TOP ROW ================= */

.navbar-top {
    min-height: 58px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
}


/* ================= LOGO ================= */

.logo {
    color: white;
    font-size: 21px;
    font-weight: 700;
    white-space: nowrap;
}


/* ================= USER AREA ================= */

.top-user {
    display: flex;
    align-items: center;
    gap: 10px;
}


.user-name {
    background: rgba(255, 255, 255, 0.14);
    padding: 7px 13px;
    border-radius: 20px;
    font-size: 13px;
    white-space: nowrap;
}


/* ================= LOGOUT ================= */

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


/* ================= NAV LINKS ================= */

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
    color: white;
    text-decoration: none;
    font-size: 13px;
    font-weight: 600;
    padding: 7px 10px;
    border-radius: 7px;
    white-space: nowrap;
    transition: all 0.2s ease;
}


.nav-links a:hover {
    background: rgba(255, 255, 255, 0.16);
}


/* Active page */

.nav-links a.active {
    background: rgba(255, 255, 255, 0.22);
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
        padding: 10px 0;
        gap: 10px;
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
}

      
        /* MAIN */

        .main {
            width: 90%;
            max-width: 850px;
            margin: 55px auto;
        }

        .title {
            text-align: center;
            margin-bottom: 30px;
        }

        .title h1 {
            font-size: 34px;
            color: #111827;
            margin-bottom: 10px;
        }

        .title p {
            color: #6b7280;
            font-size: 16px;
        }

        /* UPLOAD CARD */

        .upload-card {
            background: white;
            padding: 40px;
            border-radius: 18px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.08);
        }

        .user {
            background: #f0fdf4;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            color: #065f46;
        }

        .upload-area {
            border: 2px dashed #0f766e;
            border-radius: 15px;
            padding: 50px 25px;
            text-align: center;
            background: #f8fffd;
            cursor: pointer;
        }

        .upload-icon {
            font-size: 55px;
            margin-bottom: 15px;
        }

        .upload-area h2 {
            margin-bottom: 10px;
        }

        .upload-area p {
            color: #6b7280;
            margin-bottom: 20px;
        }

        input[type="file"] {
            display: none;
        }

        .choose-btn {
            display: inline-block;
            background: #0f766e;
            color: white;
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: bold;
        }

        .file-name {
            margin-top: 18px;
            color: #047857;
            font-weight: bold;
        }

        .analyze-btn {
            width: 100%;
            border: none;
            margin-top: 25px;
            padding: 15px;
            background: #0f766e;
            color: white;
            border-radius: 9px;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
        }

        .analyze-btn:hover {
            background: #115e59;
        }

        .analyze-btn:disabled {
            background: #9ca3af;
            cursor: not-allowed;
        }

        /* ERROR */

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 15px;
            border-radius: 9px;
            margin-bottom: 20px;
        }

        /* INFO */

        .info {
            margin-top: 25px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }

        .info-box {
            background: #f8fafc;
            padding: 18px;
            text-align: center;
            border-radius: 10px;
        }

        .info-box strong {
            display: block;
            margin-bottom: 5px;
        }

        .info-box span {
            font-size: 13px;
            color: #6b7280;
        }

        @media(max-width: 700px) {

            .upload-card {
                padding: 25px;
            }

            .info {
                grid-template-columns: 1fr;
            }

            .title h1 {
                font-size: 28px;
            }

        }

    </style>

</head>

<body>


<!-- =====================================================
     COMMON PROFESSIONAL NAVBAR
===================================================== -->

<nav class="navbar">

    <div class="navbar-top">

        <!-- Logo -->
        <div class="logo">
            🤖 AI Resume Analyzer
        </div>

        <!-- User -->
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


    <!-- Navigation -->
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


<div class="main">


    <!-- TITLE -->

    <div class="title">

        <h1>📄 Upload Your Resume</h1>

        <p>
            Upload your PDF resume and let AI analyze it.
        </p>

    </div>


    <!-- UPLOAD CARD -->

    <div class="upload-card">


        <!-- USER -->

        <div class="user">

            👤 Logged in as:

            <strong>
                ${user.name}
            </strong>

        </div>


        <!-- ERROR -->

        <% if (request.getAttribute("error") != null) { %>

            <div class="error">

                ❌ ${error}

            </div>

        <% } %>


        <!-- FORM -->

        <form action="${pageContext.request.contextPath}/upload"
              method="post"
              enctype="multipart/form-data"
              id="uploadForm">


            <label for="file"
                   class="upload-area">

                <div class="upload-icon">
                    📄
                </div>

                <h2>
                    Select Your Resume
                </h2>

                <p>
                    Only PDF files are supported
                </p>

                <span class="choose-btn">
                    Choose PDF File
                </span>

                <div class="file-name"
                     id="fileName">
                </div>

            </label>


            <input type="file"
                   id="file"
                   name="file"
                   accept=".pdf"
                   required>


            <button type="submit"
                    class="analyze-btn"
                    id="analyzeBtn"
                    disabled>

                🤖 Analyze Resume with AI

            </button>


        </form>


        <!-- INFO -->

        <div class="info">

            <div class="info-box">

                <strong>📊 ATS Score</strong>

                <span>
                    Get your ATS compatibility score
                </span>

            </div>


            <div class="info-box">

                <strong>💻 Skills</strong>

                <span>
                    Identify your technical skills
                </span>

            </div>


            <div class="info-box">

                <strong>🚀 Improvements</strong>

                <span>
                    Get AI-powered suggestions
                </span>

            </div>

        </div>


    </div>

</div>


<script>

    const fileInput =
        document.getElementById("file");

    const fileName =
        document.getElementById("fileName");

    const analyzeBtn =
        document.getElementById("analyzeBtn");


    fileInput.addEventListener(
        "change",
        function() {

            if (this.files.length > 0) {

                const file =
                    this.files[0];

                fileName.textContent =
                    "Selected: " + file.name;

                analyzeBtn.disabled = false;

            } else {

                fileName.textContent = "";

                analyzeBtn.disabled = true;

            }

        }
    );


    document.getElementById("uploadForm")
        .addEventListener(
            "submit",
            function() {

                analyzeBtn.disabled = true;

                analyzeBtn.textContent =
                    "⏳ AI is analyzing your resume...";

            }
        );

</script>


</body>

</html>