<%-- <%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Resume Analysis Result | AI Resume Analyzer</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #f4f7f8;
            color: #263238;
        }

        /* ================= NAVBAR ================= */

        .navbar {
            background: #0f766e;
            color: white;
            padding: 15px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.15);
        }

        .logo {
            font-size: 22px;
            font-weight: bold;
            white-space: nowrap;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 22px;
            flex-wrap: wrap;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: 0.3s;
        }

        .nav-links a:hover {
            opacity: 0.8;
        }

        .user-name {
            background: rgba(255,255,255,0.15);
            padding: 8px 14px;
            border-radius: 20px;
            font-size: 14px;
        }

        .logout {
            background: #dc2626;
            padding: 8px 14px;
            border-radius: 6px;
        }

        .logout:hover {
            background: #b91c1c;
            opacity: 1 !important;
        }

        /* ================= CONTAINER ================= */

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
        }

        .page-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .page-header h1 {
            color: #0f766e;
            font-size: 32px;
            margin-bottom: 10px;
        }

        .page-header p {
            color: #64748b;
            font-size: 15px;
        }

        /* ================= SUCCESS ================= */

        .success-box {
            background: #ecfdf5;
            border: 1px solid #a7f3d0;
            border-radius: 12px;
            padding: 18px 22px;
            margin-bottom: 30px;
            text-align: center;
        }

        .success-box h2 {
            color: #047857;
            margin-bottom: 6px;
        }

        .success-box p {
            color: #475569;
        }

        /* ================= ATS SCORE ================= */

        .score-card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            text-align: center;
        }

        .score-card h2 {
            color: #0f766e;
            margin-bottom: 25px;
        }

        .score-circle {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            margin: 0 auto 20px;

            background:
                conic-gradient(
                    #0f766e var(--score-degree),
                    #e5e7eb var(--score-degree)
                );

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .score-circle::before {
            content: "";
            position: absolute;
            width: 135px;
            height: 135px;
            background: white;
            border-radius: 50%;
        }

        .score-number,
        .score-label {
            position: relative;
            z-index: 2;
        }

        .score-number {
            font-size: 34px;
            font-weight: bold;
            color: #0f766e;
        }

        .score-label {
            color: #64748b;
            font-size: 13px;
            margin-top: 4px;
        }

        .score-status {
            display: inline-block;
            padding: 8px 18px;
            border-radius: 20px;
            background: #ecfdf5;
            color: #047857;
            font-weight: bold;
            margin-top: 5px;
        }

        /* ================= SCORE INFO ================= */

        .score-info {
            margin: 20px auto 0;
            max-width: 750px;
            background: #f0fdfa;
            border: 1px solid #ccfbf1;
            border-radius: 10px;
            padding: 15px 20px;
            color: #475569;
            line-height: 1.6;
            font-size: 14px;
        }

        /* ================= JOB MATCH CTA ================= */

        .job-match-cta {
            background: linear-gradient(135deg, #f0fdfa, #ecfeff);
            border: 1px solid #99f6e4;
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 30px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
        }

        .job-match-icon {
            font-size: 38px;
            margin-bottom: 10px;
        }

        .job-match-cta h3 {
            color: #0f766e;
            font-size: 23px;
            margin-bottom: 10px;
        }

        .job-match-cta p {
            color: #475569;
            font-size: 15px;
            line-height: 1.7;
            max-width: 760px;
            margin: 0 auto 22px;
        }

        .job-match-btn {
            display: inline-block;
            background: #0f766e;
            color: white;
            padding: 13px 28px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            font-size: 15px;
            transition: 0.3s;
        }

        .job-match-btn:hover {
            background: #115e59;
            transform: translateY(-2px);
            box-shadow: 0 5px 12px rgba(15,118,110,0.25);
        }

        /* ================= AI ANALYSIS ================= */

        .analysis-container {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        .analysis-container > h2 {
            color: #0f766e;
            margin-bottom: 25px;
            font-size: 24px;
        }

        /* ================= ANALYSIS CARDS ================= */

        .analysis-card {
            border-left: 5px solid #0f766e;
            background: #f8fafc;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 18px;
            transition: 0.3s;
        }

        .analysis-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.07);
        }

        .analysis-card h3 {
            color: #0f766e;
            margin-bottom: 12px;
            font-size: 18px;
        }

        .analysis-content {
            color: #475569;
            line-height: 1.7;
            white-space: pre-wrap;
            font-size: 15px;
        }

        /* ================= SPECIAL CARD COLORS ================= */

        .skills-card {
            border-left-color: #2563eb;
        }

        .skills-card h3 {
            color: #2563eb;
        }

        .missing-card {
            border-left-color: #dc2626;
        }

        .missing-card h3 {
            color: #dc2626;
        }

        .strength-card {
            border-left-color: #16a34a;
        }

        .strength-card h3 {
            color: #16a34a;
        }

        .weakness-card {
            border-left-color: #ea580c;
        }

        .weakness-card h3 {
            color: #ea580c;
        }

        .improvement-card {
            border-left-color: #7c3aed;
        }

        .improvement-card h3 {
            color: #7c3aed;
        }

        /* ================= RESUME TEXT ================= */

        .resume-section {
            background: white;
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .resume-section h2 {
            color: #0f766e;
            margin-bottom: 20px;
        }

        .resume-text {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 20px;
            line-height: 1.7;
            white-space: pre-wrap;
            color: #475569;
            max-height: 400px;
            overflow-y: auto;
        }

        /* ================= BUTTONS ================= */

        .buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
            margin: 35px 0;
        }

        .btn {
            display: inline-block;
            padding: 12px 22px;
            border-radius: 7px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
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

        /* ================= FOOTER ================= */

        footer {
            background: #0f766e;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 50px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .navbar {
                padding: 15px 20px;
                flex-direction: column;
                gap: 15px;
            }

            .nav-links {
                justify-content: center;
                gap: 12px;
            }
        }

        @media (max-width: 600px) {

            .container {
                width: 94%;
            }

            .page-header h1 {
                font-size: 26px;
            }

            .score-circle {
                width: 150px;
                height: 150px;
            }

            .score-circle::before {
                width: 112px;
                height: 112px;
            }

            .score-number {
                font-size: 28px;
            }

            .analysis-container,
            .resume-section,
            .score-card,
            .job-match-cta {
                padding: 20px;
            }

            .job-match-cta h3 {
                font-size: 20px;
            }
        }

    </style>

</head>

<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <div class="logo">
        🤖 AI Resume Analyzer
    </div>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/home">
            🏠 Home
        </a>

        <a href="${pageContext.request.contextPath}/resume-history">
            📊 Resume History
        </a>

        <a href="${pageContext.request.contextPath}/upload_resume">
            📄 Analyze Resume
        </a>
        
   		<a	href="${pageContext.request.contextPath}/resume-rewriter">
    		✨ AI Resume Rewriter
		</a>

        <a href="${pageContext.request.contextPath}/job-matching">
            💼 Job Matching
        </a>

        <a href="${pageContext.request.contextPath}/home#features">
            ✨ Features
        </a>

        <a href="${pageContext.request.contextPath}/home#how-it-works">
            ⚙️ How It Works
        </a>

        <span class="user-name">
            👋 Hi, ${user.name}
        </span>

        <a class="logout"
           href="${pageContext.request.contextPath}/logout">
            🚪 Logout
        </a>

    </div>

</nav>


<!-- ================= MAIN ================= -->

<div class="container">


    <!-- ================= PAGE HEADER ================= -->

    <div class="page-header">

        <h1>Resume Analysis Result</h1>

        <p>
            Your resume has been analyzed successfully using Gemini AI.
        </p>

    </div>


    <!-- ================= SUCCESS MESSAGE ================= -->

    <div class="success-box">

        <h2>✅ Analysis Completed Successfully!</h2>

        <p>
            Resume:
            <strong>${resume.fileName}</strong>
        </p>

    </div>


    <!-- ================= ATS SCORE ================= -->

    <div class="score-card">

        <h2>🎯 ATS Compatibility Score</h2>

        <div class="score-circle"
             id="scoreCircle"
             style="--score-degree: ${empty resumeScore ? 0 : resumeScore * 3.6}deg;">

            <div class="score-number">

                ${empty resumeScore ? 0 : resumeScore}/100

            </div>

            <div class="score-label">

                out of 100

            </div>

        </div>


        <div class="score-status">

            <%

                Object scoreObj =
                        request.getAttribute("resumeScore");

                int scoreValue = 0;

                if (scoreObj != null) {

                    try {

                        scoreValue =
                                Integer.parseInt(
                                    scoreObj.toString()
                                );

                    } catch (Exception e) {

                        scoreValue = 0;

                    }

                }

                String status;

                if (scoreValue >= 85) {

                    status = "Excellent Resume";

                } else if (scoreValue >= 70) {

                    status = "Good Resume";

                } else if (scoreValue >= 50) {

                    status = "Average Resume";

                } else {

                    status = "Needs Improvement";

                }

            %>

            <%= status %>

        </div>


        <div class="score-info">

            🤖 <strong>AI Evaluation:</strong>

            This score is generated by Gemini AI based on resume
            structure, technical skills, keywords, experience,
            projects, education, certifications, ATS compatibility
            and overall resume quality.

        </div>

    </div>


    <!-- ================= AI JOB MATCH CTA ================= -->

    <div class="job-match-cta">

        <div class="job-match-icon">
            💼
        </div>

        <h3>
            AI Job Match Analysis
        </h3>

        <p>
            Want to know how well your resume matches a specific job?
            Compare your resume with a job description using Gemini AI
            and identify matching skills, missing skills, experience
            gaps and areas for improvement.
        </p>

        <a href="${pageContext.request.contextPath}/job-matching"
           class="job-match-btn">

            🚀 Start AI Job Match Analysis

        </a>

    </div>


    <!-- ================= AI ANALYSIS ================= -->

    <div class="analysis-container">

        <h2>
            🤖 AI Resume Analysis
        </h2>

        <div id="analysisCards"></div>


        <!--
            Raw Gemini response is kept hidden.
            JavaScript reads this text and creates
            separate analysis cards.
        -->

        <div id="rawAiResult" style="display:none;">

            ${aiResult}

        </div>

    </div>


    <!-- ================= EXTRACTED RESUME TEXT ================= -->

    <div class="resume-section">

        <h2>
            📄 Extracted Resume Text
        </h2>

        <div class="resume-text">

            ${resumeText}

        </div>

    </div>


    <!-- ================= BUTTONS ================= -->

    <div class="buttons">

        <a class="btn btn-primary"
           href="${pageContext.request.contextPath}/upload_resume">

            📄 Analyze Another Resume

        </a>


        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/job-matching">

            💼 Match With Job

        </a>


        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/interview-questions">

            🎤 AI Interview Questions

        </a>


        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/resume-history">

            📊 Resume History

        </a>


        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/home">

            🏠 Back to Home

        </a>

    </div>

</div>


<!-- ================= FOOTER ================= -->

<footer>

    <p>

        © 2026 AI Resume Analyzer |
        Built with Java, Spring Boot & Gemini AI

    </p>

</footer>


<!-- ================= JAVASCRIPT ================= -->

<script>


    /* =====================================================
       GET RAW GEMINI RESPONSE
       ===================================================== */

    const rawText =
        document
            .getElementById("rawAiResult")
            .textContent
            .trim();


    /* =====================================================
       ATS SCORE
       Database se aa raha hai
       ===================================================== */

    let score =
        ${empty resumeScore ? 0 : resumeScore};


    if (score < 0) {

        score = 0;

    }


    if (score > 100) {

        score = 100;

    }


    /* =====================================================
       ALL GEMINI AI SECTIONS
       ===================================================== */

    const sections = [

        "PROFILE SUMMARY:",

        "TECHNICAL SKILLS:",

        "SKILL ANALYSIS:",

        "EXPERIENCE ANALYSIS:",

        "PROJECT ANALYSIS:",

        "EDUCATION ANALYSIS:",

        "KEYWORD ANALYSIS:",

        "MISSING SKILLS:",

        "STRENGTHS:",

        "WEAKNESSES:",

        "ATS IMPROVEMENTS:",

        "RESUME IMPROVEMENTS:",

        "FINAL RECOMMENDATION:"

    ];


    /* =====================================================
       ESCAPE HTML
       Prevent unwanted HTML rendering
       ===================================================== */

    function escapeHtml(text) {

        const div =
            document.createElement("div");

        div.textContent = text;

        return div.innerHTML;

    }


    /* =====================================================
       GET CARD CLASS
       ===================================================== */

    function getCardClass(section) {


        if (section === "TECHNICAL SKILLS:") {

            return "analysis-card skills-card";

        }


        if (section === "MISSING SKILLS:") {

            return "analysis-card missing-card";

        }


        if (section === "STRENGTHS:") {

            return "analysis-card strength-card";

        }


        if (section === "WEAKNESSES:") {

            return "analysis-card weakness-card";

        }


        if (
            section === "ATS IMPROVEMENTS:" ||
            section === "RESUME IMPROVEMENTS:"
        ) {

            return "analysis-card improvement-card";

        }


        return "analysis-card";

    }


    /* =====================================================
       CONVERT SECTION NAME TO DISPLAY TITLE
       ===================================================== */

    function getTitle(section) {


        const titles = {


            "PROFILE SUMMARY:":

                "👤 Profile Summary",


            "TECHNICAL SKILLS:":

                "💻 Technical Skills",


            "SKILL ANALYSIS:":

                "🧠 Skill Analysis",


            "EXPERIENCE ANALYSIS:":

                "💼 Experience Analysis",


            "PROJECT ANALYSIS:":

                "🚀 Project Analysis",


            "EDUCATION ANALYSIS:":

                "🎓 Education Analysis",


            "KEYWORD ANALYSIS:":

                "🔑 Keyword Analysis",


            "MISSING SKILLS:":

                "⚠️ Missing Skills",


            "STRENGTHS:":

                "✅ Strengths",


            "WEAKNESSES:":

                "❌ Weaknesses",


            "ATS IMPROVEMENTS:":

                "🛠️ ATS Improvements",


            "RESUME IMPROVEMENTS:":

                "📝 Resume Improvements",


            "FINAL RECOMMENDATION:":

                "🎯 Final Recommendation"

        };


        return titles[section] || section;

    }


    /* =====================================================
       CREATE ANALYSIS CARDS
       ===================================================== */

    function createAnalysisCards(text) {


        const container =
            document.getElementById(
                "analysisCards"
            );


        let foundAny = false;


        const upperText =
            text.toUpperCase();


        for (
            let i = 0;
            i < sections.length;
            i++
        ) {


            const currentSection =
                sections[i];


            const startIndex =
                upperText.indexOf(
                    currentSection.toUpperCase()
                );


            if (startIndex === -1) {

                continue;

            }


            let endIndex =
                text.length;


            /* ---------------------------------------------
               Find next section
               --------------------------------------------- */

            for (
                let j = i + 1;
                j < sections.length;
                j++
            ) {


                const nextIndex =
                    upperText.indexOf(
                        sections[j].toUpperCase(),
                        startIndex +
                        currentSection.length
                    );


                if (nextIndex !== -1) {

                    endIndex =
                        nextIndex;

                    break;

                }

            }


            /* ---------------------------------------------
               Extract section content
               --------------------------------------------- */

            let content =
                text.substring(
                    startIndex +
                    currentSection.length,
                    endIndex
                ).trim();


            if (content.length === 0) {

                continue;

            }


            foundAny = true;


            /* ---------------------------------------------
               Create Card
               --------------------------------------------- */

            const card =
                document.createElement(
                    "div"
                );


            card.className =
                getCardClass(
                    currentSection
                );


            /* ---------------------------------------------
               Create Heading
               --------------------------------------------- */

            const heading =
                document.createElement(
                    "h3"
                );


            heading.textContent =
                getTitle(
                    currentSection
                );


            /* ---------------------------------------------
               Create Content
               --------------------------------------------- */

            const contentDiv =
                document.createElement(
                    "div"
                );


            contentDiv.className =
                "analysis-content";


            contentDiv.innerHTML =
                escapeHtml(
                    content
                );


            /* ---------------------------------------------
               Add Elements
               --------------------------------------------- */

            card.appendChild(
                heading
            );


            card.appendChild(
                contentDiv
            );


            container.appendChild(
                card
            );

        }


        /* =================================================
           FALLBACK
           Agar Gemini expected format follow na kare
           ================================================= */

        if (!foundAny) {


            const card =
                document.createElement(
                    "div"
                );


            card.className =
                "analysis-card";


            const heading =
                document.createElement(
                    "h3"
                );


            heading.textContent =
                "🤖 AI Analysis";


            const contentDiv =
                document.createElement(
                    "div"
                );


            contentDiv.className =
                "analysis-content";


            contentDiv.innerHTML =
                escapeHtml(
                    text
                );


            card.appendChild(
                heading
            );


            card.appendChild(
                contentDiv
            );


            container.appendChild(
                card
            );

        }

    }


    /* =====================================================
       START ANALYSIS DISPLAY
       ===================================================== */

    createAnalysisCards(rawText);


</script>


</body>

</html>
 --%>
 
 
 
 
 
 
 <%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Resume Analysis Result | AI Resume Analyzer</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #f4f7f8;
            color: #263238;
        }

      /* ================= PROFESSIONAL NAVBAR ================= */

.navbar {
    background: #0f766e;
    color: white;
    padding: 12px 40px 0;
    position: sticky;
    top: 0;
    z-index: 1000;
    box-shadow: 0 2px 10px rgba(0,0,0,0.15);
}


/* ================= TOP NAVBAR ================= */

.navbar-top {
    width: 100%;
    min-height: 52px;

    display: flex;
    align-items: center;
    justify-content: space-between;
}


/* ================= LOGO ================= */

.logo {
    font-size: 22px;
    font-weight: bold;
    white-space: nowrap;
}


/* ================= USER AREA ================= */

.top-user {
    display: flex;
    align-items: center;
    gap: 10px;
}


/* ================= USER NAME ================= */

.user-name {
    background: rgba(255,255,255,0.15);
    padding: 8px 14px;
    border-radius: 20px;
    font-size: 14px;
    white-space: nowrap;
}


/* ================= LOGOUT ================= */

.logout {
    background: #dc2626;
    color: white !important;
    padding: 8px 14px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 14px !important;
    font-weight: 600;
    white-space: nowrap;
}

.logout:hover {
    background: #b91c1c;
    opacity: 1 !important;
}


/* ================= NAVIGATION LINKS ================= */

.nav-links {
    width: 100%;

    display: flex;
    align-items: center;
    justify-content: center;

    gap: 6px;

    margin-top: 8px;
    padding-bottom: 10px;

    flex-wrap: nowrap;
    white-space: nowrap;
}


/* ================= NAV LINK ================= */

.nav-links a {
    color: white;
    text-decoration: none;

    font-size: 13px;
    font-weight: 600;

    padding: 8px 11px;
    border-radius: 7px;

    white-space: nowrap;

    transition: all 0.25s ease;
}

.nav-links a:hover {
    background: rgba(255,255,255,0.15);
}

        /* ================= CONTAINER ================= */

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
        }

        .page-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .page-header h1 {
            color: #0f766e;
            font-size: 32px;
            margin-bottom: 10px;
        }

        .page-header p {
            color: #64748b;
            font-size: 15px;
        }

        /* ================= SUCCESS ================= */

        .success-box {
            background: #ecfdf5;
            border: 1px solid #a7f3d0;
            border-radius: 12px;
            padding: 18px 22px;
            margin-bottom: 30px;
            text-align: center;
        }

        .success-box h2 {
            color: #047857;
            margin-bottom: 6px;
        }

        .success-box p {
            color: #475569;
        }

        /* ================= ATS SCORE ================= */

        .score-card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            text-align: center;
        }

        .score-card h2 {
            color: #0f766e;
            margin-bottom: 25px;
        }

        .score-circle {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            margin: 0 auto 20px;

            background:
                conic-gradient(
                    #0f766e var(--score-degree),
                    #e5e7eb var(--score-degree)
                );

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .score-circle::before {
            content: "";
            position: absolute;
            width: 135px;
            height: 135px;
            background: white;
            border-radius: 50%;
        }

        .score-number,
        .score-label {
            position: relative;
            z-index: 2;
        }

        .score-number {
            font-size: 34px;
            font-weight: bold;
            color: #0f766e;
        }

        .score-label {
            color: #64748b;
            font-size: 13px;
            margin-top: 4px;
        }

        .score-status {
            display: inline-block;
            padding: 8px 18px;
            border-radius: 20px;
            background: #ecfdf5;
            color: #047857;
            font-weight: bold;
            margin-top: 5px;
        }

        /* ================= SCORE INFO ================= */

        .score-info {
            margin: 20px auto 0;
            max-width: 750px;
            background: #f0fdfa;
            border: 1px solid #ccfbf1;
            border-radius: 10px;
            padding: 15px 20px;
            color: #475569;
            line-height: 1.6;
            font-size: 14px;
        }

        /* ================= JOB MATCH CTA ================= */

        .job-match-cta {
            background: linear-gradient(135deg, #f0fdfa, #ecfeff);
            border: 1px solid #99f6e4;
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 30px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
        }

        .job-match-icon {
            font-size: 38px;
            margin-bottom: 10px;
        }

        .job-match-cta h3 {
            color: #0f766e;
            font-size: 23px;
            margin-bottom: 10px;
        }

        .job-match-cta p {
            color: #475569;
            font-size: 15px;
            line-height: 1.7;
            max-width: 760px;
            margin: 0 auto 22px;
        }

        .job-match-btn {
            display: inline-block;
            background: #0f766e;
            color: white;
            padding: 13px 28px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            font-size: 15px;
            transition: 0.3s;
        }

        .job-match-btn:hover {
            background: #115e59;
            transform: translateY(-2px);
            box-shadow: 0 5px 12px rgba(15,118,110,0.25);
        }

        /* ================= AI ANALYSIS ================= */

        .analysis-container {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        .analysis-container > h2 {
            color: #0f766e;
            margin-bottom: 25px;
            font-size: 24px;
        }

        /* ================= ANALYSIS CARDS ================= */

        .analysis-card {
            border-left: 5px solid #0f766e;
            background: #f8fafc;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 18px;
            transition: 0.3s;
        }

        .analysis-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.07);
        }

        .analysis-card h3 {
            color: #0f766e;
            margin-bottom: 12px;
            font-size: 18px;
        }

        .analysis-content {
            color: #475569;
            line-height: 1.7;
            white-space: pre-wrap;
            font-size: 15px;
        }

        /* ================= SPECIAL CARD COLORS ================= */

        .skills-card {
            border-left-color: #2563eb;
        }

        .skills-card h3 {
            color: #2563eb;
        }

        .missing-card {
            border-left-color: #dc2626;
        }

        .missing-card h3 {
            color: #dc2626;
        }

        .strength-card {
            border-left-color: #16a34a;
        }

        .strength-card h3 {
            color: #16a34a;
        }

        .weakness-card {
            border-left-color: #ea580c;
        }

        .weakness-card h3 {
            color: #ea580c;
        }

        .improvement-card {
            border-left-color: #7c3aed;
        }

        .improvement-card h3 {
            color: #7c3aed;
        }

        /* ================= RESUME TEXT ================= */

        .resume-section {
            background: white;
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .resume-section h2 {
            color: #0f766e;
            margin-bottom: 20px;
        }

        .resume-text {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 20px;
            line-height: 1.7;
            white-space: pre-wrap;
            color: #475569;
            max-height: 400px;
            overflow-y: auto;
        }

        /* ================= BUTTONS ================= */

        .buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
            margin: 35px 0;
        }

        .btn {
            display: inline-block;
            padding: 12px 22px;
            border-radius: 7px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
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

        /* ================= FOOTER ================= */

        footer {
            background: #0f766e;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 50px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .navbar {
                padding: 15px 20px;
                flex-direction: column;
                gap: 15px;
            }

            .nav-links {
                justify-content: center;
                gap: 12px;
            }
        }

        @media (max-width: 600px) {

            .container {
                width: 94%;
            }

            .page-header h1 {
                font-size: 26px;
            }

            .score-circle {
                width: 150px;
                height: 150px;
            }

            .score-circle::before {
                width: 112px;
                height: 112px;
            }

            .score-number {
                font-size: 28px;
            }

            .analysis-container,
            .resume-section,
            .score-card,
            .job-match-cta {
                padding: 20px;
            }

            .job-match-cta h3 {
                font-size: 20px;
            }
        }

    </style>

</head>

<body>



<!-- ================= NAVBAR ================= -->

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

        <a href="${pageContext.request.contextPath}/job-matching">
            💼 Job Matching
        </a>
        
        <a href="${pageContext.request.contextPath}/interview-questions">
            ⚙️ AI Interview Questions
        </a>

        <a href="${pageContext.request.contextPath}/home#features">
            ✨ Features
        </a>

        <a href="${pageContext.request.contextPath}/home#how-it-works">
            ⚙️ How It Works
        </a>

    </div>

</nav>


<!-- ================= MAIN ================= -->

<div class="container">


    <!-- ================= PAGE HEADER ================= -->

    <div class="page-header">

        <h1>Resume Analysis Result</h1>

        <p>
            Your resume has been analyzed successfully using Gemini AI.
        </p>

    </div>


    <!-- ================= SUCCESS MESSAGE ================= -->

    <div class="success-box">

        <h2>✅ Analysis Completed Successfully!</h2>

        <p>
            Resume:
            <strong>${resume.fileName}</strong>
        </p>

    </div>


    <!-- ================= ATS SCORE ================= -->

    <div class="score-card">

        <h2>🎯 ATS Compatibility Score</h2>

        <div class="score-circle"
             id="scoreCircle"
             style="--score-degree: ${empty resumeScore ? 0 : resumeScore * 3.6}deg;">

            <div class="score-number">

                ${empty resumeScore ? 0 : resumeScore}/100

            </div>

            <div class="score-label">

                out of 100

            </div>

        </div>


        <div class="score-status">

            <%

                Object scoreObj =
                        request.getAttribute("resumeScore");

                int scoreValue = 0;

                if (scoreObj != null) {

                    try {

                        scoreValue =
                                Integer.parseInt(
                                    scoreObj.toString()
                                );

                    } catch (Exception e) {

                        scoreValue = 0;

                    }

                }

                String status;

                if (scoreValue >= 85) {

                    status = "Excellent Resume";

                } else if (scoreValue >= 70) {

                    status = "Good Resume";

                } else if (scoreValue >= 50) {

                    status = "Average Resume";

                } else {

                    status = "Needs Improvement";

                }

            %>

            <%= status %>

        </div>


        <div class="score-info">

            🤖 <strong>AI Evaluation:</strong>

            This score is generated by Gemini AI based on resume
            structure, technical skills, keywords, experience,
            projects, education, certifications, ATS compatibility
            and overall resume quality.

        </div>

    </div>


    <!-- ================= AI JOB MATCH CTA ================= -->

    <div class="job-match-cta">

        <div class="job-match-icon">
            💼
        </div>

        <h3>
            AI Job Match Analysis
        </h3>

        <p>
            Want to know how well your resume matches a specific job?
            Compare your resume with a job description using Gemini AI
            and identify matching skills, missing skills, experience
            gaps and areas for improvement.
        </p>

        <a href="${pageContext.request.contextPath}/job-matching"
           class="job-match-btn">

            🚀 Start AI Job Match Analysis

        </a>

    </div>


    <!-- ================= AI ANALYSIS ================= -->

    <div class="analysis-container">

        <h2>
            🤖 AI Resume Analysis
        </h2>

        <div id="analysisCards"></div>


        <!--
            Raw Gemini response is kept hidden.
            JavaScript reads this text and creates
            separate analysis cards.
        -->

        <div id="rawAiResult" style="display:none;">

            ${aiResult}

        </div>

    </div>


    <!-- ================= EXTRACTED RESUME TEXT ================= -->

    <div class="resume-section">

        <h2>
            📄 Extracted Resume Text
        </h2>

        <div class="resume-text">

            ${resumeText}

        </div>

    </div>


    <!-- ================= BUTTONS ================= -->

    <div class="buttons">

        <a class="btn btn-primary"
           href="${pageContext.request.contextPath}/upload_resume">

            📄 Analyze Another Resume

        </a>


        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/job-matching">

            💼 Match With Job

        </a>


        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/interview-questions">

            🎤 AI Interview Questions

        </a>


        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/resume-history">

            📊 Resume History

        </a>


        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/home">

            🏠 Back to Home

        </a>

    </div>

</div>


<!-- ================= FOOTER ================= -->

<footer>

    <p>

        © 2026 AI Resume Analyzer |
        Built with Java, Spring Boot & Gemini AI

    </p>

</footer>


<!-- ================= JAVASCRIPT ================= -->

<script>


    /* =====================================================
       GET RAW GEMINI RESPONSE
       ===================================================== */

    const rawText =
        document
            .getElementById("rawAiResult")
            .textContent
            .trim();


    /* =====================================================
       ATS SCORE
       Database se aa raha hai
       ===================================================== */

    let score =
        ${empty resumeScore ? 0 : resumeScore};


    if (score < 0) {

        score = 0;

    }


    if (score > 100) {

        score = 100;

    }


    /* =====================================================
       ALL GEMINI AI SECTIONS
       ===================================================== */

    const sections = [

        "PROFILE SUMMARY:",

        "TECHNICAL SKILLS:",

        "SKILL ANALYSIS:",

        "EXPERIENCE ANALYSIS:",

        "PROJECT ANALYSIS:",

        "EDUCATION ANALYSIS:",

        "KEYWORD ANALYSIS:",

        "MISSING SKILLS:",

        "STRENGTHS:",

        "WEAKNESSES:",

        "ATS IMPROVEMENTS:",

        "RESUME IMPROVEMENTS:",

        "FINAL RECOMMENDATION:"

    ];


    /* =====================================================
       ESCAPE HTML
       Prevent unwanted HTML rendering
       ===================================================== */

    function escapeHtml(text) {

        const div =
            document.createElement("div");

        div.textContent = text;

        return div.innerHTML;

    }


    /* =====================================================
       GET CARD CLASS
       ===================================================== */

    function getCardClass(section) {


        if (section === "TECHNICAL SKILLS:") {

            return "analysis-card skills-card";

        }


        if (section === "MISSING SKILLS:") {

            return "analysis-card missing-card";

        }


        if (section === "STRENGTHS:") {

            return "analysis-card strength-card";

        }


        if (section === "WEAKNESSES:") {

            return "analysis-card weakness-card";

        }


        if (
            section === "ATS IMPROVEMENTS:" ||
            section === "RESUME IMPROVEMENTS:"
        ) {

            return "analysis-card improvement-card";

        }


        return "analysis-card";

    }


    /* =====================================================
       CONVERT SECTION NAME TO DISPLAY TITLE
       ===================================================== */

    function getTitle(section) {


        const titles = {


            "PROFILE SUMMARY:":

                "👤 Profile Summary",


            "TECHNICAL SKILLS:":

                "💻 Technical Skills",


            "SKILL ANALYSIS:":

                "🧠 Skill Analysis",


            "EXPERIENCE ANALYSIS:":

                "💼 Experience Analysis",


            "PROJECT ANALYSIS:":

                "🚀 Project Analysis",


            "EDUCATION ANALYSIS:":

                "🎓 Education Analysis",


            "KEYWORD ANALYSIS:":

                "🔑 Keyword Analysis",


            "MISSING SKILLS:":

                "⚠️ Missing Skills",


            "STRENGTHS:":

                "✅ Strengths",


            "WEAKNESSES:":

                "❌ Weaknesses",


            "ATS IMPROVEMENTS:":

                "🛠️ ATS Improvements",


            "RESUME IMPROVEMENTS:":

                "📝 Resume Improvements",


            "FINAL RECOMMENDATION:":

                "🎯 Final Recommendation"

        };


        return titles[section] || section;

    }


    /* =====================================================
       CREATE ANALYSIS CARDS
       ===================================================== */

    function createAnalysisCards(text) {


        const container =
            document.getElementById(
                "analysisCards"
            );


        let foundAny = false;


        const upperText =
            text.toUpperCase();


        for (
            let i = 0;
            i < sections.length;
            i++
        ) {


            const currentSection =
                sections[i];


            const startIndex =
                upperText.indexOf(
                    currentSection.toUpperCase()
                );


            if (startIndex === -1) {

                continue;

            }


            let endIndex =
                text.length;


            /* ---------------------------------------------
               Find next section
               --------------------------------------------- */

            for (
                let j = i + 1;
                j < sections.length;
                j++
            ) {


                const nextIndex =
                    upperText.indexOf(
                        sections[j].toUpperCase(),
                        startIndex +
                        currentSection.length
                    );


                if (nextIndex !== -1) {

                    endIndex =
                        nextIndex;

                    break;

                }

            }


            /* ---------------------------------------------
               Extract section content
               --------------------------------------------- */

            let content =
                text.substring(
                    startIndex +
                    currentSection.length,
                    endIndex
                ).trim();


            if (content.length === 0) {

                continue;

            }


            foundAny = true;


            /* ---------------------------------------------
               Create Card
               --------------------------------------------- */

            const card =
                document.createElement(
                    "div"
                );


            card.className =
                getCardClass(
                    currentSection
                );


            /* ---------------------------------------------
               Create Heading
               --------------------------------------------- */

            const heading =
                document.createElement(
                    "h3"
                );


            heading.textContent =
                getTitle(
                    currentSection
                );


            /* ---------------------------------------------
               Create Content
               --------------------------------------------- */

            const contentDiv =
                document.createElement(
                    "div"
                );


            contentDiv.className =
                "analysis-content";


            contentDiv.innerHTML =
                escapeHtml(
                    content
                );


            /* ---------------------------------------------
               Add Elements
               --------------------------------------------- */

            card.appendChild(
                heading
            );


            card.appendChild(
                contentDiv
            );


            container.appendChild(
                card
            );

        }


        /* =================================================
           FALLBACK
           Agar Gemini expected format follow na kare
           ================================================= */

        if (!foundAny) {


            const card =
                document.createElement(
                    "div"
                );


            card.className =
                "analysis-card";


            const heading =
                document.createElement(
                    "h3"
                );


            heading.textContent =
                "🤖 AI Analysis";


            const contentDiv =
                document.createElement(
                    "div"
                );


            contentDiv.className =
                "analysis-content";


            contentDiv.innerHTML =
                escapeHtml(
                    text
                );


            card.appendChild(
                heading
            );


            card.appendChild(
                contentDiv
            );


            container.appendChild(
                card
            );

        }

    }


    /* =====================================================
       START ANALYSIS DISPLAY
       ===================================================== */

    createAnalysisCards(rawText);


</script>


</body>

</html>
 