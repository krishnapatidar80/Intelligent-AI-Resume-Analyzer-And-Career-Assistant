<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Job Match Result | AI Resume Analyzer</title>


<style>

/* =========================================================
   GLOBAL
========================================================= */

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f8fafc;
    color: #0f172a;
    line-height: 1.5;
}


/* =========================================================
   NAVBAR
========================================================= */

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
    gap: 20px;
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
}

.logout {
    background: #dc2626;
    color: white !important;
    text-decoration: none;
    padding: 7px 13px;
    border-radius: 7px;
    font-size: 13px;
    font-weight: 600;
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
}

.nav-links a:hover,
.nav-links a.active {
    background: rgba(255,255,255,0.18);
}


/* =========================================================
   MAIN CONTAINER
========================================================= */

.container {
    width: 92%;
    max-width: 1120px;
    margin: 30px auto 45px;
}


/* =========================================================
   HEADER
========================================================= */

.page-header {
    text-align: center;
    margin-bottom: 22px;
}

.page-header h1 {
    font-size: 28px;
    color: #0f172a;
    margin-bottom: 4px;
}

.page-header p {
    color: #64748b;
    font-size: 13px;
}

.job-info {
    display: flex;
    justify-content: center;
    gap: 10px;
    flex-wrap: wrap;
    margin-top: 14px;
}

.job-badge {
    background: white;
    border: 1px solid #e2e8f0;
    padding: 7px 13px;
    border-radius: 20px;
    color: #475569;
    font-size: 12px;
    box-shadow: 0 2px 7px rgba(15,23,42,0.03);
}

.job-badge strong {
    color: #0f766e;
}


/* =========================================================
   SCORE SECTION
========================================================= */

.score-card {
    background: linear-gradient(135deg, #0f766e, #115e59);
    border-radius: 18px;
    padding: 24px 30px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 18px;
    box-shadow: 0 10px 25px rgba(15,118,110,0.18);
    color: white;
}

.score-left {
    display: flex;
    align-items: center;
    gap: 15px;
}

.score-icon {
    width: 48px;
    height: 48px;
    border-radius: 13px;
    background: rgba(255,255,255,0.14);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 23px;
}

.score-title {
    font-size: 18px;
    font-weight: 700;
}

.score-subtitle {
    font-size: 12px;
    color: rgba(255,255,255,0.72);
}

.score-value {
    font-size: 43px;
    font-weight: 800;
    line-height: 1;
}

.score-value span {
    font-size: 14px;
    font-weight: 500;
    opacity: 0.75;
}


/* =========================================================
   QUICK SUMMARY
========================================================= */

.quick-summary {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 12px;
    margin-bottom: 18px;
}

.summary-box {
    background: white;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    padding: 13px;
    text-align: center;
    box-shadow: 0 3px 10px rgba(15,23,42,0.035);
}

.summary-icon {
    font-size: 20px;
    margin-bottom: 3px;
}

.summary-title {
    font-size: 11px;
    color: #64748b;
}

.summary-value {
    font-size: 14px;
    font-weight: 700;
    color: #0f766e;
}


/* =========================================================
   CARDS
========================================================= */

.cards {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 14px;
}

.card {
    background: white;
    border: 1px solid #e2e8f0;
    border-radius: 14px;
    padding: 17px;
    box-shadow: 0 4px 13px rgba(15,23,42,0.04);
}

.card.full {
    grid-column: 1 / -1;
}

.card-head {
    display: flex;
    align-items: center;
    gap: 9px;
    margin-bottom: 10px;
}

.card-icon {
    width: 32px;
    height: 32px;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f0fdfa;
    font-size: 16px;
}

.card h2 {
    font-size: 15px;
    color: #0f172a;
}

.card-content {
    color: #475569;
    font-size: 12.8px;
    white-space: pre-line;
    line-height: 1.55;
    max-height: 145px;
    overflow-y: auto;
}


/* =========================================================
   HIGHLIGHT CARD
========================================================= */

.highlight-card {
    background: linear-gradient(135deg, #f0fdfa, #ecfeff);
    border: 1px solid #99f6e4;
}

.highlight-card .card-icon {
    background: #ccfbf1;
}


/* =========================================================
   LEARNING ROADMAP
========================================================= */

.learning-card {
    grid-column: 1 / -1;
    background: linear-gradient(135deg, #ecfeff, #f0fdfa);
    border: 1px solid #99f6e4;
    border-radius: 16px;
    padding: 20px;
}

.learning-header {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 5px;
}

.learning-icon {
    width: 39px;
    height: 39px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #ccfbf1;
    font-size: 20px;
}

.learning-header h2 {
    font-size: 18px;
}

.learning-description {
    color: #64748b;
    font-size: 12px;
    margin-bottom: 14px;
}


/* ROADMAP GRID */

.roadmap {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
}

.roadmap-box {
    background: white;
    border: 1px solid #dbeafe;
    border-radius: 11px;
    padding: 14px;
}

.roadmap-box.full {
    grid-column: 1 / -1;
}

.roadmap-label {
    display: flex;
    align-items: center;
    gap: 7px;
    color: #0f766e;
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 7px;
}

.roadmap-content {
    color: #475569;
    font-size: 12.5px;
    line-height: 1.55;
    white-space: pre-line;
    max-height: 125px;
    overflow-y: auto;
}


/* =========================================================
   ACTIONS
========================================================= */

.actions {
    display: flex;
    justify-content: center;
    gap: 9px;
    flex-wrap: wrap;
    margin-top: 22px;
}

.btn {
    text-decoration: none;
    padding: 9px 15px;
    border-radius: 8px;
    font-size: 12.5px;
    font-weight: 600;
    transition: 0.2s;
}

.btn-primary {
    background: #0f766e;
    color: white;
}

.btn-primary:hover {
    background: #115e59;
}

.btn-secondary {
    background: #e2e8f0;
    color: #334155;
}

.btn-secondary:hover {
    background: #cbd5e1;
}


/* =========================================================
   FOOTER
========================================================= */

.site-footer {
    background: #0f172a;
    color: white;
    text-align: center;
    padding: 28px 20px 22px;
    margin-top: 40px;
}

.footer-logo {
    font-size: 19px;
    font-weight: 700;
    margin-bottom: 8px;
}

.footer-project-title {
    color: #cbd5e1;
    font-size: 13px;
    margin-bottom: 14px;
}

.footer-developer {
    font-size: 13px;
    margin-bottom: 5px;
}

.footer-email a {
    color: #5eead4;
    text-decoration: none;
    font-size: 12px;
}

.footer-line {
    height: 1px;
    background: #334155;
    margin: 18px 0 13px;
}

.footer-copyright {
    color: #94a3b8;
    font-size: 11px;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 900px) {

    .quick-summary {
        grid-template-columns: repeat(2, 1fr);
    }

    .cards {
        grid-template-columns: 1fr;
    }

    .card.full,
    .learning-card {
        grid-column: auto;
    }
}


@media (max-width: 700px) {

    .score-card {
        flex-direction: column;
        text-align: center;
        gap: 18px;
    }

    .score-left {
        flex-direction: column;
    }

    .roadmap {
        grid-template-columns: 1fr;
    }

    .roadmap-box.full {
        grid-column: auto;
    }
}


@media (max-width: 650px) {

    .navbar {
        padding: 0 20px;
    }

    .navbar-top {
        flex-direction: column;
        padding: 10px 0;
        gap: 10px;
    }

    .logo {
        font-size: 19px;
    }

    .top-user {
        justify-content: center;
    }

    .nav-links {
        justify-content: flex-start;
    }

    .container {
        width: 94%;
        margin-top: 23px;
    }

    .page-header h1 {
        font-size: 23px;
    }

    .quick-summary {
        grid-template-columns: 1fr 1fr;
    }

    .score-value {
        font-size: 38px;
    }
}

</style>

</head>


<body>


<!-- =========================================================
     NAVBAR
========================================================= -->

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



<!-- =========================================================
     MAIN
========================================================= -->

<div class="container">


    <!-- HEADER -->

    <div class="page-header">

        <h1>
            🎯 Job Match Result
        </h1>

        <p>
            AI-powered comparison between your resume and the target job.
        </p>

        <div class="job-info">

            <div class="job-badge">
                💼 <strong>${jobTitle}</strong>
            </div>

            <div class="job-badge">
                📄 ${resume.fileName}
            </div>

        </div>

    </div>



    <!-- SCORE -->

    <div class="score-card">

        <div class="score-left">

            <div class="score-icon">
                🎯
            </div>

            <div>

                <div class="score-title">
                    Job Match Score
                </div>

                <div class="score-subtitle">
                    Resume compatibility with this job
                </div>

            </div>

        </div>


        <div class="score-value">

            ${matchScore}

            <span>/100</span>

        </div>

    </div>



    <!-- QUICK SUMMARY -->

    <div class="quick-summary">

        <div class="summary-box">

            <div class="summary-icon">
                ✅
            </div>

            <div class="summary-title">
                Skills
            </div>

            <div class="summary-value">
                Matched
            </div>

        </div>


        <div class="summary-box">

            <div class="summary-icon">
                ⚠️
            </div>

            <div class="summary-title">
                Skills
            </div>

            <div class="summary-value">
                Missing
            </div>

        </div>


        <div class="summary-box">

            <div class="summary-icon">
                📊
            </div>

            <div class="summary-title">
                Skill Analysis
            </div>

            <div class="summary-value">
                Available
            </div>

        </div>


        <div class="summary-box">

            <div class="summary-icon">
                🎓
            </div>

            <div class="summary-title">
                Learning
            </div>

            <div class="summary-value">
                Roadmap
            </div>

        </div>

    </div>



    <!-- =====================================================
         RESULT CARDS
    ====================================================== -->

    <div class="cards">


        <!-- MATCHING SKILLS -->

        <div class="card">

            <div class="card-head">

                <div class="card-icon">
                    ✅
                </div>

                <h2>
                    Matching Skills
                </h2>

            </div>

            <div class="card-content">
                ${matchingSkills}
            </div>

        </div>



        <!-- MISSING SKILLS -->

        <div class="card">

            <div class="card-head">

                <div class="card-icon">
                    ⚠️
                </div>

                <h2>
                    Missing Skills
                </h2>

            </div>

            <div class="card-content">
                ${missingSkills}
            </div>

        </div>



        <!-- EXPERIENCE GAP -->

        <div class="card">

            <div class="card-head">

                <div class="card-icon">
                    💼
                </div>

                <h2>
                    Experience Gap
                </h2>

            </div>

            <div class="card-content">
                ${experienceGap}
            </div>

        </div>



        <!-- PROJECTS -->

        <div class="card">

            <div class="card-head">

                <div class="card-icon">
                    🚀
                </div>

                <h2>
                    Relevant Projects
                </h2>

            </div>

            <div class="card-content">
                ${matchingProjects}
            </div>

        </div>



        <!-- SKILL GAP -->

        <div class="card full highlight-card">

            <div class="card-head">

                <div class="card-icon">
                    📊
                </div>

                <h2>
                    Skill Gap Analysis
                </h2>

            </div>

            <div class="card-content">
                ${skillGap}
            </div>

        </div>



        <!-- =================================================
             LEARNING ROADMAP
        ================================================== -->

        <div class="learning-card">

            <div class="learning-header">

                <div class="learning-icon">
                    🎓
                </div>

                <h2>
                    AI Learning Roadmap
                </h2>

            </div>


            <p class="learning-description">
                Focus on the most relevant skill gaps for your target job.
            </p>


            <div class="roadmap">


                <!-- WHAT TO LEARN -->

                <div class="roadmap-box">

                    <div class="roadmap-label">
                        📚 What to Learn
                    </div>

                    <div class="roadmap-content">
                        ${learningGap}
                    </div>

                </div>



                <!-- PRIORITY -->

                <div class="roadmap-box">

                    <div class="roadmap-label">
                        🔥 Learning Priority
                    </div>

                    <div class="roadmap-content">
                        ${learningPriority}
                    </div>

                </div>



                <!-- WHY IT MATTERS -->

                <div class="roadmap-box full">

                    <div class="roadmap-label">
                        🎯 Career Focus
                    </div>

                    <div class="roadmap-content">
                        Use the learning areas above to strengthen the skills
                        most relevant to the selected job.
                    </div>

                </div>


            </div>

        </div>



        <!-- RECOMMENDATIONS -->

        <div class="card">

            <div class="card-head">

                <div class="card-icon">
                    💡
                </div>

                <h2>
                    AI Recommendations
                </h2>

            </div>

            <div class="card-content">
                ${recommendations}
            </div>

        </div>



        <!-- FINAL ASSESSMENT -->

        <div class="card">

            <div class="card-head">

                <div class="card-icon">
                    📋
                </div>

                <h2>
                    Final Assessment
                </h2>

            </div>

            <div class="card-content">
                ${finalAssessment}
            </div>

        </div>


    </div>



    <!-- =====================================================
         ACTIONS
    ====================================================== -->

    <div class="actions">

        <a class="btn btn-primary"
           href="${pageContext.request.contextPath}/job-matching">
            🔄 Analyze Another Job
        </a>


        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/resume-rewriter">
            ✨ Rewrite Resume
        </a>


        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/interview-questions">
            🎯 Practice Interview
        </a>


        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/home">
            🏠 Dashboard
        </a>

    </div>


</div>



<!-- =========================================================
     FOOTER
========================================================= -->

<footer class="site-footer">

    <div class="footer-logo">
        🤖 AI Resume Analyzer
    </div>

    <div class="footer-project-title">
        Intelligent AI Resume Analyzer and Career Assistant
    </div>

    <div class="footer-developer">
        Developed by Krishnakant Patidar
    </div>

    <div class="footer-email">

        <a href="mailto:patidarkrishna188@gmail.com">
            patidarkrishna188@gmail.com
        </a>

    </div>

    <div class="footer-line"></div>

    <div class="footer-copyright">
        © 2026 AI Resume Analyzer | All Rights Reserved
    </div>

</footer>


</body>

</html>