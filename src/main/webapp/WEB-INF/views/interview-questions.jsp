<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0">

<title>AI Interview Question Generator</title>

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
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background: #f5f7fb;
	color: #1e293b;
}



/* CONTAINER */

.container {
	width: 90%;
	max-width: 1100px;
	margin: 50px auto;
}

/* HEADER */

.header {
	text-align: center;
	margin-bottom: 35px;
}

.header h1 {
	font-size: 36px;
	color: #0f172a;
	margin-bottom: 12px;
}

.header h1 span {
	color: #0284c7;
}

.header p {
	color: #64748b;
	font-size: 16px;
}

/* CARD */

.card {
	background: white;
	border-radius: 18px;
	padding: 30px;
	box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
	margin-bottom: 25px;
}

.card h2 {
	margin-bottom: 8px;
	color: #0f172a;
}

.card-description {
	color: #64748b;
	margin-bottom: 25px;
}

/* FORM */

.form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

.form-group {
	margin-bottom: 20px;
}

.form-group.full {
	grid-column: 1 / -1;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 8px;
	color: #334155;
}

select,
input,
textarea {
	width: 100%;
	padding: 13px 15px;
	border: 1px solid #cbd5e1;
	border-radius: 10px;
	font-size: 15px;
	outline: none;
}

select:focus,
input:focus,
textarea:focus {
	border-color: #0284c7;
}

textarea {
	min-height: 150px;
	resize: vertical;
}

/* BUTTON */

.btn {
	display: inline-block;
	border: none;
	background: #0284c7;
	color: white;
	padding: 14px 25px;
	border-radius: 10px;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	text-decoration: none;
}

.btn:hover {
	background: #0369a1;
}

.btn-secondary {
	background: #334155;
}

.btn-secondary:hover {
	background: #1e293b;
}

/* INFO */

.info-box {
	background: #eff6ff;
	border-left: 5px solid #0284c7;
	padding: 18px;
	border-radius: 10px;
	margin-top: 20px;
	color: #334155;
	line-height: 1.6;
}

/* RESPONSIVE */

@media(max-width: 700px) {

	.form-grid {
		grid-template-columns: 1fr;
	}

	.form-group.full {
		grid-column: auto;
	}

	.header h1 {
		font-size: 28px;
	}

	.nav-links {
		display: none;
	}
}

</style>

</head>

<body>

<!-- NAVBAR -->

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


<!-- MAIN -->

<div class="container">

	<div class="header">

		<h1>
			🎤 AI Interview
			<span>Question Generator</span>
		</h1>

		<p>
			Generate personalized interview questions and
			AI-powered answers using your resume.
		</p>

	</div>


	<!-- GENERATOR CARD -->

	<div class="card">

		<h2>Generate Interview Questions</h2>

		<p class="card-description">
			Gemini AI will analyze your resume and generate
			realistic interview questions based on your profile.
		</p>


		<form method="post"
			action="${pageContext.request.contextPath}/generate-interview-questions">

			<input type="hidden"
				name="resumeId"
				value="${resume.id}">


			<div class="form-grid">


				<!-- QUESTION TYPE -->

				<div class="form-group">

					<label>
						Question Type
					</label>

					<select name="questionType">

						<option value="ALL">
							All Questions
						</option>

						<option value="RESUME">
							Resume Based
						</option>

						<option value="TECHNICAL">
							Technical
						</option>

						<option value="PROJECT">
							Project Based
						</option>

						<option value="HR">
							HR & Behavioral
						</option>

						<option value="JOB-SPECIFIC">
							Job Specific
						</option>

					</select>

				</div>


				<!-- DIFFICULTY -->

				<div class="form-group">

					<label>
						Difficulty
					</label>

					<select name="difficulty">

						<option value="Mixed">
							Mixed
						</option>

						<option value="Easy">
							Easy
						</option>

						<option value="Medium">
							Medium
						</option>

						<option value="Hard">
							Hard
						</option>

					</select>

				</div>


				<!-- NUMBER -->

				<div class="form-group">

					<label>
						Number of Questions
					</label>

					<select name="numberOfQuestions">

						<option value="5">
							5 Questions
						</option>

						<option value="10" selected>
							10 Questions
						</option>

						<option value="15">
							15 Questions
						</option>

						<option value="20">
							20 Questions
						</option>

					</select>

				</div>


				<!-- JOB TITLE -->

				<div class="form-group">

					<label>
						Job Title
						<span style="color:#94a3b8;">
							(Optional)
						</span>
					</label>

					<input type="text"
						name="jobTitle"
						placeholder="Example: Java Developer">

				</div>


				<!-- JOB DESCRIPTION -->

				<div class="form-group full">

					<label>
						Job Description
						<span style="color:#94a3b8;">
							(Optional)
						</span>
					</label>

					<textarea
						name="jobDescription"
						placeholder="Paste the job description here if you want job-specific interview questions..."></textarea>

				</div>

			</div>


			<button type="submit" class="btn">
				🚀 Generate AI Interview Questions
			</button>

		</form>


		<div class="info-box">

			<strong>💡 How it works:</strong>

			<br>

			Gemini AI analyzes your resume and generates
			questions that an interviewer may realistically ask.

			You can first try answering the questions yourself
			and then compare your answer with the
			AI-generated answer.

		</div>

	</div>


	<!-- BACK BUTTON -->

	<a href="${pageContext.request.contextPath}/home"
		class="btn btn-secondary">

		← Back to Home

	</a>

</div>

</body>

</html>