<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Job Match Analysis</title>

    <style>
    
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

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fb;
        }

        .container {
            width: 80%;
            max-width: 900px;
            margin: 50px auto;
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #1e293b;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #334155;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 15px;
            margin-bottom: 22px;
            outline: none;
        }

        input[type="text"]:focus,
        textarea:focus {
            border-color: #38bdf8;
        }

        textarea {
            height: 250px;
            resize: vertical;
        }

        .btn {
            width: 100%;
            padding: 13px;
            background: #0f172a;
            color: white;
            border: none;
            border-radius: 7px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background: #1e293b;
        }

        .info {
            margin-top: 25px;
            padding: 15px;
            background: #f1f5f9;
            border-left: 4px solid #38bdf8;
            color: #475569;
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



<div class="container">

    <h1>AI Job Match Analysis</h1>

    <p class="subtitle">
        Compare your resume with a job description using Gemini AI
    </p>

    <form action="${pageContext.request.contextPath}/analyze-job-match"
          method="post">
          					
          						<!-- Latest resume nikalne ke lie user ka agar jyada ho to -->
         <input type="hidden"
           name="resumeId"
           value="${resume.id}">

        <label for="jobTitle">
            Job Title
        </label>

        <input type="text"
               id="jobTitle"
               name="jobTitle"
               placeholder="Example: Java Backend Developer"
               required>


        <label for="description">
            Job Description
        </label>

        <textarea id="description"
                  name="description"
                  placeholder="Paste the complete job description here..."
                  required></textarea>


        <button type="submit" class="btn">
            Analyze Job Match
        </button>

    </form>


    <div class="info">

        <strong>How it works:</strong>

        <p>
            Your uploaded resume will be compared with the job description
            using Gemini AI. The system will identify matching skills,
            missing skills and overall job compatibility.
        </p>

    </div>

</div>

</body>
</html>