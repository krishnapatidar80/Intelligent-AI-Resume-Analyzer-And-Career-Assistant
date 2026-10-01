<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>AI Interview Questions</title>


<style>

/* ============================= */
/* GLOBAL */
/* ============================= */

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {

    font-family: Arial, sans-serif;

    background: #f5f7fb;

    color: #1e293b;
}


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


/* ============================= */
/* CONTAINER */
/* ============================= */

.container {

    width: 90%;

    max-width: 1000px;

    margin: 45px auto;
}


/* ============================= */
/* HEADER */
/* ============================= */

.header {

    text-align: center;

    margin-bottom: 35px;
}

.header h1 {

    font-size: 34px;

    color: #0f172a;

    margin-bottom: 10px;
}

.header h1 span {

    color: #0284c7;
}

.header p {

    color: #64748b;

    font-size: 15px;
}


/* ============================= */
/* SUMMARY */
/* ============================= */

.summary {

    background: white;

    padding: 22px;

    border-radius: 16px;

    box-shadow:
        0 8px 25px rgba(15, 23, 42, 0.07);

    margin-bottom: 25px;
}

.summary-grid {

    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 15px;
}

.summary-item {

    background: #f8fafc;

    padding: 15px;

    border-radius: 10px;
}

.summary-item strong {

    display: block;

    color: #64748b;

    font-size: 13px;

    margin-bottom: 5px;
}

.summary-item span {

    font-weight: bold;

    color: #0f172a;
}


/* ============================= */
/* QUESTION CARD */
/* ============================= */

.question-card {

    background: white;

    border-radius: 18px;

    padding: 28px;

    margin-bottom: 22px;

    box-shadow:
        0 8px 25px rgba(15, 23, 42, 0.07);

    border-left:
        5px solid #0284c7;
}

.question-number {

    color: #0284c7;

    font-size: 14px;

    font-weight: bold;

    margin-bottom: 10px;
}

.question-text {

    font-size: 20px;

    font-weight: bold;

    line-height: 1.5;

    color: #0f172a;

    margin-bottom: 15px;
}

.difficulty {

    display: inline-block;

    padding: 6px 12px;

    border-radius: 20px;

    background: #e0f2fe;

    color: #0369a1;

    font-size: 12px;

    font-weight: bold;

    margin-bottom: 18px;
}


/* ============================= */
/* ANSWER */
/* ============================= */

.answer-box {

    display: none;

    background: #f8fafc;

    border-radius: 12px;

    padding: 20px;

    margin-top: 15px;

    line-height: 1.7;

    color: #334155;

    white-space: pre-wrap;

    border: 1px solid #e2e8f0;
}

.answer-title {

    font-weight: bold;

    color: #0f172a;

    margin-bottom: 10px;

    font-size: 15px;
}


/* ============================= */
/* BUTTON */
/* ============================= */

.answer-btn {

    border: none;

    background: #0284c7;

    color: white;

    padding: 11px 18px;

    border-radius: 9px;

    cursor: pointer;

    font-weight: bold;

    font-size: 14px;
}

.answer-btn:hover {

    background: #0369a1;
}


/* ============================= */
/* ACTION BUTTONS */
/* ============================= */

.actions {

    text-align: center;

    margin-top: 35px;

    display: flex;

    gap: 15px;

    justify-content: center;

    flex-wrap: wrap;
}

.action-btn {

    text-decoration: none;

    padding: 13px 22px;

    background: #0284c7;

    color: white;

    border-radius: 10px;

    font-weight: bold;

    transition: 0.2s;
}

.action-btn:hover {

    transform: translateY(-2px);

    opacity: 0.92;
}

.action-btn.secondary {

    background: #334155;
}


/* ============================= */
/* EMPTY */
/* ============================= */

.empty {

    background: white;

    padding: 35px;

    text-align: center;

    border-radius: 15px;

    color: #64748b;

    box-shadow:
        0 8px 25px rgba(15, 23, 42, 0.07);
}

.empty h3 {

    color: #0f172a;

    margin-bottom: 10px;
}

.empty p {

    line-height: 1.6;
}


/* ============================= */
/* RESPONSIVE */
/* ============================= */

@media(max-width: 700px) {

    .summary-grid {

        grid-template-columns: 1fr;
    }

    .question-text {

        font-size: 18px;
    }

    .nav-links {

        display: none;
    }

    .container {

        width: 94%;

        margin: 30px auto;
    }

    .question-card {

        padding: 20px;
    }
}

</style>

</head>


<body>


<!-- ============================= -->
<!-- NAVBAR -->
<!-- ============================= -->

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



<!-- ============================= -->
<!-- MAIN CONTAINER -->
<!-- ============================= -->

<div class="container">


    <!-- HEADER -->

    <div class="header">

        <h1>

            🎤 AI Interview
            <span>Questions</span>

        </h1>

        <p>

            Personalized interview questions
            generated by Gemini AI from your resume.

        </p>

    </div>



    <!-- ============================= -->
    <!-- SUMMARY -->
    <!-- ============================= -->

    <div class="summary">

        <div class="summary-grid">


            <div class="summary-item">

                <strong>
                    Question Type
                </strong>

                <span>
                    <c:out value="${questionType}" />
                </span>

            </div>



            <div class="summary-item">

                <strong>
                    Difficulty
                </strong>

                <span>
                    <c:out value="${difficulty}" />
                </span>

            </div>



            <div class="summary-item">

                <strong>
                    Total Questions
                </strong>

                <span>
                    <c:out value="${numberOfQuestions}" />
                </span>

            </div>


        </div>

    </div>



    <!-- ============================= -->
    <!-- QUESTIONS WILL APPEAR HERE -->
    <!-- ============================= -->

    <div id="questionsContainer"></div>



    <!-- ============================= -->
    <!-- ACTIONS -->
    <!-- ============================= -->

    <div class="actions">


        <a class="action-btn"
           href="${pageContext.request.contextPath}/interview-questions">

            🔄 Generate Again

        </a>



        <a class="action-btn secondary"
           href="${pageContext.request.contextPath}/job-matching">

            💼 Job Matching

        </a>



        <a class="action-btn secondary"
           href="${pageContext.request.contextPath}/home">

            🏠 Back to Home

        </a>


    </div>


</div>



<!-- ============================= -->
<!-- RAW AI RESULT -->
<!-- ============================= -->

<div id="rawResult"
     style="display:none;">

    <c:out value="${questionResult}" />

</div>



<script>


/* ================================= */
/* GET GEMINI RESULT */
/* ================================= */

const rawResultElement =
    document.getElementById("rawResult");


const rawText =
    rawResultElement.textContent;


/* ================================= */
/* QUESTIONS CONTAINER */
/* ================================= */

const container =
    document.getElementById(
        "questionsContainer"
    );


/* ================================= */
/* SPLIT QUESTIONS */
/* ================================= */

const blocks =
    rawText.split(
        /QUESTION\s+\d+\s*:/i
    );


let questionCount = 0;


/* ================================= */
/* PROCESS QUESTIONS */
/* ================================= */

for (
    let i = 1;
    i < blocks.length;
    i++
) {


    const block =
        blocks[i].trim();


    if (!block) {

        continue;
    }



    /* ============================== */
    /* FIND ANSWER */
    /* ============================== */

    const answerMatch =
        block.match(
            /ANSWER\s*:/i
        );


    if (!answerMatch) {

        continue;
    }



    const answerIndex =
        answerMatch.index;



    /* ============================== */
    /* QUESTION + DIFFICULTY */
    /* ============================== */

    const beforeAnswer =
        block.substring(
            0,
            answerIndex
        ).trim();



    /* ============================== */
    /* ANSWER TEXT */
    /* ============================== */

    const answer =
        block.substring(
            answerIndex +
            answerMatch[0].length
        ).trim();



    /* ============================== */
    /* DIFFICULTY */
    /* ============================== */

    const difficultyMatch =
        beforeAnswer.match(
            /DIFFICULTY\s*:\s*(.*)/i
        );


    let difficulty =
        "Mixed";


    if (difficultyMatch) {

        difficulty =
            difficultyMatch[1].trim();
    }



    /* ============================== */
    /* QUESTION TEXT */
    /* ============================== */

    let question =
        beforeAnswer
            .replace(
                /DIFFICULTY\s*:\s*.*/i,
                ""
            )
            .trim();



    questionCount++;



    /* ================================= */
    /* CREATE QUESTION CARD */
    /* ================================= */

    const card =
        document.createElement(
            "div"
        );


    card.className =
        "question-card";



    /* ================================= */
    /* QUESTION NUMBER */
    /* ================================= */

    const questionNumber =
        document.createElement(
            "div"
        );


    questionNumber.className =
        "question-number";


    questionNumber.textContent =
        "QUESTION " +
        questionCount;



    /* ================================= */
    /* QUESTION TEXT */
    /* ================================= */

    const questionText =
        document.createElement(
            "div"
        );


    questionText.className =
        "question-text";


    questionText.textContent =
        question;



    /* ================================= */
    /* DIFFICULTY */
    /* ================================= */

    const difficultyDiv =
        document.createElement(
            "div"
        );


    difficultyDiv.className =
        "difficulty";


    difficultyDiv.textContent =
        difficulty;



    /* ================================= */
    /* LINE BREAK */
    /* ================================= */

    const breakLine =
        document.createElement(
            "br"
        );



    /* ================================= */
    /* ANSWER BUTTON */
    /* ================================= */

    const answerButton =
        document.createElement(
            "button"
        );


    answerButton.className =
        "answer-btn";


    answerButton.textContent =
        "👁 Show AI Answer";


    answerButton.onclick =
        function () {

            toggleAnswer(this);

        };



    /* ================================= */
    /* ANSWER BOX */
    /* ================================= */

    const answerBox =
        document.createElement(
            "div"
        );


    answerBox.className =
        "answer-box";



    /* ================================= */
    /* ANSWER TITLE */
    /* ================================= */

    const answerTitle =
        document.createElement(
            "div"
        );


    answerTitle.className =
        "answer-title";


    answerTitle.textContent =
        "🤖 AI Generated Answer";



    /* ================================= */
    /* ANSWER TEXT */
    /* ================================= */

    const answerText =
        document.createElement(
            "div"
        );


    answerText.textContent =
        answer;



    /* ================================= */
    /* BUILD ANSWER BOX */
    /* ================================= */

    answerBox.appendChild(
        answerTitle
    );


    answerBox.appendChild(
        answerText
    );



    /* ================================= */
    /* BUILD CARD */
    /* ================================= */

    card.appendChild(
        questionNumber
    );


    card.appendChild(
        questionText
    );


    card.appendChild(
        difficultyDiv
    );


    card.appendChild(
        breakLine
    );


    card.appendChild(
        answerButton
    );


    card.appendChild(
        answerBox
    );



    /* ================================= */
    /* ADD CARD TO PAGE */
    /* ================================= */

    container.appendChild(
        card
    );

}



/* ================================= */
/* NO QUESTIONS FOUND */
/* ================================= */

if (questionCount === 0) {


    container.innerHTML = `

        <div class="empty">

            <h3>
                Unable to format questions
            </h3>

            <p>

                Gemini response could not be
                displayed correctly.

                Please generate the questions again.

            </p>

        </div>

    `;

}



/* ================================= */
/* SHOW / HIDE ANSWER */
/* ================================= */

function toggleAnswer(button) {


    const answerBox =
        button.nextElementSibling;



    if (
        answerBox.style.display ===
        "block"
    ) {


        answerBox.style.display =
            "none";


        button.innerText =
            "👁 Show AI Answer";


    } else {


        answerBox.style.display =
            "block";


        button.innerText =
            "🙈 Hide AI Answer";

    }

}

</script>


</body>

</html>

