<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>AI Resume Analyzer</title>


<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	background: #f8fafc;
	color: #1e293b;
}

/* ================= NAVBAR ================= */
.navbar {
	height: 70px;
	background: #ffffff;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 8%;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.logo {
	font-size: 24px;
	font-weight: bold;
	color: #1e3a8a;
}

.logo span {
	color: #2563eb;
}

.nav-links {
	display: flex;
	gap: 30px;
	align-items: center;
}

.nav-links a {
	text-decoration: none;
	color: #334155;
	font-size: 15px;
}

.nav-links a:hover {
	color: #2563eb;
}

.nav-register {
	background: #2563eb;
	color: white !important;
	padding: 10px 20px;
	border-radius: 6px;
}

/* ================= HERO ================= */
.hero {
	min-height: 560px;
	padding: 80px 8%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: linear-gradient(135deg, #eff6ff, #ffffff);
}

.hero-content {
	width: 55%;
}

.small-title {
	color: #2563eb;
	font-weight: bold;
	font-size: 15px;
	margin-bottom: 15px;
}

.hero h1 {
	font-size: 52px;
	line-height: 1.15;
	color: #172554;
	margin-bottom: 25px;
}

.hero h1 span {
	color: #2563eb;
}

.hero p {
	font-size: 18px;
	color: #64748b;
	line-height: 1.7;
	max-width: 650px;
	margin-bottom: 30px;
}

.hero-buttons {
	display: flex;
	gap: 15px;
}

.btn {
	padding: 14px 25px;
	border-radius: 7px;
	text-decoration: none;
	font-size: 16px;
	font-weight: bold;
}

.btn-primary {
	background: #2563eb;
	color: white;
}

.btn-primary:hover {
	background: #1d4ed8;
}

.btn-secondary {
	border: 1px solid #2563eb;
	color: #2563eb;
	background: white;
}

.logout-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;

    background: linear-gradient(135deg, #ef4444, #dc2626);
    color: white !important;

    padding: 10px 18px;
    border-radius: 8px;

    text-decoration: none;
    font-size: 14px;
    font-weight: 600;

    box-shadow: 0 4px 10px rgba(239, 68, 68, 0.25);

    transition: all 0.3s ease;
}

.logout-btn span {
    font-size: 17px;
}

.logout-btn:hover {
    background: linear-gradient(135deg, #dc2626, #b91c1c);
    transform: translateY(-2px);

    box-shadow: 0 7px 18px rgba(239, 68, 68, 0.35);
}

/* ================= UPLOAD CARD ================= */
.upload-card {
	width: 380px;
	background: white;
	padding: 35px;
	border-radius: 15px;
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.10);
	text-align: center;
}

.upload-icon {
	font-size: 65px;
	margin-bottom: 15px;
}

.upload-card h2 {
	color: #172554;
	margin-bottom: 10px;
}

.upload-card p {
	color: #64748b;
	font-size: 14px;
	margin-bottom: 20px;
}

.upload-btn {
	display: block;
	background: #2563eb;
	color: white;
	padding: 13px;
	border-radius: 6px;
	text-decoration: none;
	font-weight: bold;
}

.file-info {
	margin-top: 15px;
	font-size: 12px;
	color: #64748b;
}

/* ================= HOW IT WORKS ================= */
.section {
	padding: 75px 8%;
	text-align: center;
}

.section-title {
	font-size: 34px;
	color: #172554;
	margin-bottom: 12px;
}

.section-subtitle {
	color: #64748b;
	margin-bottom: 45px;
}

.steps {
	display: flex;
	justify-content: center;
	gap: 25px;
}

.step {
	width: 30%;
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.06);
}

.step-number {
	width: 50px;
	height: 50px;
	margin: auto;
	margin-bottom: 20px;
	background: #dbeafe;
	color: #2563eb;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
}

.step h3 {
	margin-bottom: 12px;
	color: #172554;
}

.step p {
	color: #64748b;
	line-height: 1.6;
}

/* ================= FEATURES ================= */
.features {
	background: #f1f5f9;
}

.feature-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 25px;
}

.feature {
	background: white;
	padding: 30px;
	border-radius: 10px;
	text-align: left;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.feature-icon {
	font-size: 35px;
	margin-bottom: 15px;
}

.feature h3 {
	color: #172554;
	margin-bottom: 10px;
}

.feature p {
	color: #64748b;
	line-height: 1.6;
}

/* ================= WHY SECTION ================= */
.why {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 50px;
}

.why-content {
	width: 55%;
	text-align: left;
}

.why-content h2 {
	font-size: 34px;
	color: #172554;
	margin-bottom: 20px;
}

.why-content p {
	color: #64748b;
	line-height: 1.7;
	margin-bottom: 20px;
}

.why-list {
	list-style: none;
}

.why-list li {
	margin: 15px 0;
	color: #334155;
}

.check {
	color: #16a34a;
	font-weight: bold;
	margin-right: 10px;
}

.score-card {
	width: 320px;
	padding: 35px;
	background: white;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
	text-align: center;
}

.score {
	font-size: 65px;
	font-weight: bold;
	color: #2563eb;
}

.score-card p {
	color: #64748b;
}

/* ================= CTA ================= */
.cta {
	background: #172554;
	color: white;
	padding: 70px 8%;
	text-align: center;
}

.cta h2 {
	font-size: 38px;
	margin-bottom: 15px;
}

.cta p {
	color: #cbd5e1;
	margin-bottom: 30px;
}

.cta-button {
	display: inline-block;
	background: #2563eb;
	color: white;
	padding: 14px 30px;
	border-radius: 7px;
	text-decoration: none;
	font-weight: bold;
}

/* ================= FOOTER ================= */
footer {
	background: #0f172a;
	color: #cbd5e1;
	text-align: center;
	padding: 22px;
}

/* ================= RESPONSIVE ================= */
@media ( max-width : 800px) {
	.hero {
		flex-direction: column;
		gap: 50px;
		text-align: center;
	}
	.hero-content {
		width: 100%;
	}
	.hero h1 {
		font-size: 38px;
	}
	.hero-buttons {
		justify-content: center;
	}
	.upload-card {
		width: 100%;
	}
	.steps {
		flex-direction: column;
	}
	.step {
		width: 100%;
	}
	.feature-grid {
		grid-template-columns: 1fr;
	}
	.why {
		flex-direction: column;
	}
	.why-content {
		width: 100%;
	}
}

 /* MESSAGE SHOW ERROR OR SUCCESS KE LIE POP KE LIE */

		.popup {

    position: fixed;

    top: 25px;

    right: 25px;

    width: 380px;

    padding: 18px 20px;

    background: white;

    border-radius: 12px;

    display: flex;

    align-items: center;

    gap: 15px;

    box-shadow: 0 10px 35px rgba(0,0,0,0.18);

    z-index: 9999;

    animation: slideIn 0.5s ease;

}

.success-popup {

    border-left: 5px solid #16a34a;

}

.error-popup {

    border-left: 5px solid #dc2626;

}

.popup-icon {

    width: 42px;

    height: 42px;

    border-radius: 50%;

    background: #dcfce7;

    color: #16a34a;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 25px;

    font-weight: bold;

    flex-shrink: 0;

}

.error-icon {

    background: #fee2e2;

    color: #dc2626;

}

.popup-content h3 {

    color: #166534;

    margin-bottom: 5px;

}

.error-popup .popup-content h3 {

    color: #b91c1c;

}

.popup-content p {

    color: #64748b;

    font-size: 14px;

}

.close {

    margin-left: auto;

    font-size: 22px;

    color: #64748b;

    cursor: pointer;

}

.close:hover {

    color: #dc2626;

}

@keyframes slideIn {

    from {

        transform: translateX(120%);

        opacity: 0;

    }

    to {

        transform: translateX(0);

        opacity: 1;

    }

}

@keyframes slideOut {

    from {

        transform: translateX(0);

        opacity: 1;

    }

    to {

        transform: translateX(120%);

        opacity: 0;

    }

}
		

</style>

</head>


<body>


	<!-- ================= NAVBAR ================= -->

	<nav class="navbar">

		<div class="logo">
			AI <span>Resume Analyzer</span>
		</div>
		
	<%
   		String loggedUser = (String)session.getAttribute("USEREMAIL");	 
	%>

	<% if (loggedUser != null) { %>

    <div class="user-welcome">
        👋 Welcome, <strong><%= loggedUser %></strong>
    </div>
    
      <a href="${pageContext.request.contextPath}/logout"
       class="logout-btn">
        <span>↪</span> Logout
    </a>
      

	<% } %>


		<div class="nav-links">

			<a href="${pageContext.request.contextPath}/home"> Home </a> <a
				href="#features"> Features </a> <a href="#how-it-works"> How It
				Works </a> <a href="${pageContext.request.contextPath}/login"> Login
			</a> <a class="nav-register"
				href="${pageContext.request.contextPath}/register"> Register </a>

		</div>

	</nav>



	<!-- ================= HERO ================= -->

	<section class="hero">


		<div class="hero-content">

			<div class="small-title">🚀 AI POWERED RESUME ANALYSIS</div>


			<h1>

				Analyze Your Resume <br> With The Power Of <span>AI</span>

			</h1>


			<p>Upload your resume and get intelligent insights about your
				skills, experience, keywords and overall resume quality. Improve
				your resume and increase your chances of getting your dream job.</p>


			<div class="hero-buttons">

				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/register"> Get Started
					→ </a> <a class="btn btn-secondary" href="#how-it-works"> Learn
					More </a>

			</div>

		</div>



		<!-- Upload Preview Card -->

		<div class="upload-card">

			<div class="upload-icon">📄</div>


			<h2>Upload Your Resume</h2>


			<p>Upload your resume and let our AI analyze your profile.</p>


			<a class="upload-btn"
				href="${pageContext.request.contextPath}/upload_resume"> Upload
				Resume </a>


			<div class="file-info">

				Supported formats: PDF, DOC, DOCX <br> Maximum size: 10 MB

			</div>

		</div>


	</section>



	<!-- ================= HOW IT WORKS ================= -->

	<section class="section" id="how-it-works">

		<h2 class="section-title">How It Works</h2>


		<p class="section-subtitle">Analyze and improve your resume in
			three simple steps.</p>


		<div class="steps">


			<div class="step">

				<div class="step-number">01</div>

				<h3>Upload Resume</h3>

				<p>Upload your resume in PDF, DOC or DOCX format from your
					dashboard.</p>

			</div>



			<div class="step">

				<div class="step-number">02</div>

				<h3>AI Analysis</h3>

				<p>Our system analyzes your resume content, skills, experience
					and important keywords.</p>

			</div>



			<div class="step">

				<div class="step-number">03</div>

				<h3>Improve Resume</h3>

				<p>Get personalized suggestions and improve your resume for
					better opportunities.</p>

			</div>


		</div>

	</section>



	<!-- ================= FEATURES ================= -->

	<section class="section features" id="features">


		<h2 class="section-title">Powerful Features</h2>


		<p class="section-subtitle">Everything you need to improve your
			resume.</p>


		<div class="feature-grid">


			<div class="feature">

				<div class="feature-icon">📊</div>

				<h3>Resume Score</h3>

				<p>Get an overall score that shows how strong your resume is.</p>

			</div>



			<div class="feature">

				<div class="feature-icon">💡</div>

				<h3>AI Suggestions</h3>

				<p>Get intelligent suggestions to improve your resume content.</p>

			</div>



			<div class="feature">

				<div class="feature-icon">🧠</div>

				<h3>Skill Analysis</h3>

				<p>Identify your existing skills and discover missing skills.</p>

			</div>



			<div class="feature">

				<div class="feature-icon">🔎</div>

				<h3>Keyword Analysis</h3>

				<p>Find important keywords that can improve your resume.</p>

			</div>



			<div class="feature">

				<div class="feature-icon">🎯</div>

				<h3>Job Matching</h3>

				<p>Compare your skills with requirements of your desired job
					role.</p>

			</div>



			<div class="feature">

				<div class="feature-icon">📈</div>

				<h3>Career Improvement</h3>

				<p>Get useful recommendations to build a stronger professional
					profile.</p>

			</div>


		</div>

	</section>



	<!-- ================= WHY USE ================= -->

	<section class="section">


		<div class="why">


			<div class="why-content">

				<h2>Why Use AI Resume Analyzer?</h2>


				<p>Creating a strong resume can be difficult. AI Resume Analyzer
					helps you understand what is missing from your resume and provides
					actionable recommendations.</p>


				<ul class="why-list">

					<li><span class="check">✓</span> Identify missing skills</li>

					<li><span class="check">✓</span> Improve resume content</li>

					<li><span class="check">✓</span> Find important keywords</li>

					<li><span class="check">✓</span> Get AI-powered
						recommendations</li>

					<li><span class="check">✓</span> Prepare for your dream job</li>

				</ul>

			</div>



			<div class="score-card">

				<div class="score">85</div>

				<h3>Resume Score</h3>

				<p>Example of AI Resume Analysis</p>

			</div>


		</div>

	</section>



	<!-- ================= CTA ================= -->

	<section class="cta">


		<h2>Ready To Improve Your Resume?</h2>


		<p>Create your account and start analyzing your resume with AI.</p>


		<a class="cta-button"
			href="${pageContext.request.contextPath}/register"> Analyze My
			Resume → </a>


	</section>



	<!-- ================= FOOTER ================= -->

	<footer>

		<p>© 2026 AI Resume Analyzer. All Rights Reserved.</p>

	</footer>


<!-- Pop Automaticly 4 sec me hatane ke lie -->

<script>

function closePopup() {

    const popup = document.getElementById("popup");

    if (popup) {

        popup.style.animation =
            "slideOut 0.4s ease";

        setTimeout(function() {

            popup.remove();

        }, 400);

    }

}


setTimeout(function() {

    closePopup();

}, 4000);

</script>

</body>

</html> --%>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>AI Resume Analyzer</title>

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    scroll-behavior: smooth;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    background: #f5f9ff;
    color: #1f2937;
}

/* ================= NAVBAR ================= */

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

/* ================= USER ================= */

.user-name {
    color: #1261d6;
    font-weight: bold;
}

.login-btn {
    background: #1261d6;
    color: white !important;
    padding: 10px 20px;
    border-radius: 7px;
}

.register-btn {
    background: #0f9d58;
    color: white !important;
    padding: 10px 20px;
    border-radius: 7px;
}

.logout-btn {
    background: #dc3545;
    color: white !important;
    padding: 10px 20px;
    border-radius: 7px;
}

/* ================= HERO ================= */

.hero {
    min-height: 600px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 70px 8%;
    background: linear-gradient(135deg, #eef6ff, #ffffff);
}

.hero-content {
    width: 55%;
}

.hero h1 {
    font-size: 52px;
    color: #123b73;
    line-height: 1.2;
    margin-bottom: 20px;
}

.hero h1 span {
    color: #1261d6;
}

.hero p {
    font-size: 19px;
    color: #5b6472;
    line-height: 1.7;
    margin-bottom: 30px;
}

.welcome {
    color: #0f9d58;
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 15px;
}

.hero-buttons {
    display: flex;
    gap: 15px;
}

.primary-btn {
    text-decoration: none;
    background: #1261d6;
    color: white;
    padding: 15px 28px;
    border-radius: 8px;
    font-weight: bold;
    display: inline-block;
}

.secondary-btn {
    text-decoration: none;
    background: white;
    color: #1261d6;
    padding: 15px 28px;
    border-radius: 8px;
    font-weight: bold;
    border: 2px solid #1261d6;
    display: inline-block;
}

.primary-btn:hover {
    background: #0d4eaf;
}

.secondary-btn:hover {
    background: #1261d6;
    color: white;
}

/* ================= HERO CARD ================= */

.hero-card {
    width: 38%;
    background: white;
    padding: 35px;
    border-radius: 20px;
    box-shadow: 0 15px 40px rgba(18,97,214,0.15);
}

.hero-card h2 {
    color: #1261d6;
    margin-bottom: 20px;
}

.score-box {
    background: #eef6ff;
    padding: 20px;
    border-radius: 12px;
    margin-bottom: 15px;
}

.score {
    font-size: 40px;
    font-weight: bold;
    color: #0f9d58;
}

.hero-card ul {
    list-style: none;
    line-height: 2.2;
}

/* ================= SECTIONS ================= */

.section {
    padding: 80px 8%;
    text-align: center;
}

.section h2 {
    font-size: 35px;
    color: #123b73;
    margin-bottom: 15px;
}

.section-subtitle {
    color: #6b7280;
    margin-bottom: 45px;
    font-size: 17px;
}

/* ================= FEATURES ================= */

.features {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

.feature-card {
    background: white;
    padding: 35px 25px;
    border-radius: 15px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.08);
    transition: 0.3s;
}

.feature-card:hover {
    transform: translateY(-7px);
}

.feature-icon {
    font-size: 45px;
    margin-bottom: 15px;
}

.feature-card h3 {
    color: #123b73;
    margin-bottom: 12px;
}

.feature-card p {
    color: #6b7280;
    line-height: 1.6;
}

/* ================= HOW IT WORKS ================= */

.steps {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}

.step {
    background: white;
    padding: 30px 20px;
    border-radius: 15px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.07);
}

.step-number {
    width: 50px;
    height: 50px;
    margin: auto;
    margin-bottom: 15px;
    border-radius: 50%;
    background: #1261d6;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    font-weight: bold;
}

.step h3 {
    margin-bottom: 10px;
}

/* ================= WHY USE ================= */

.why-use {
    background: #eef6ff;
}

.why-list {
    max-width: 850px;
    margin: auto;
    text-align: left;
}

.why-item {
    background: white;
    margin-bottom: 15px;
    padding: 20px;
    border-radius: 10px;
    font-size: 17px;
}

/* ================= CTA ================= */

.cta {
    background: linear-gradient(135deg, #1261d6, #0d4eaf);
    color: white;
    text-align: center;
    padding: 75px 20px;
}

.cta h2 {
    color: white;
    font-size: 38px;
    margin-bottom: 15px;
}

.cta p {
    font-size: 18px;
    margin-bottom: 25px;
}

.cta-btn {
    display: inline-block;
    background: white;
    color: #1261d6;
    padding: 15px 30px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: bold;
}



/* =========================
   Professional Footer
   ========================= */

.site-footer {
    background: #0f172a;
    color: white;
    text-align: center;
    padding: 32px 20px 24px;
    margin-top: 50px;
}

.footer-content {
    max-width: 900px;
    margin: 0 auto;
}

.footer-logo {
    font-size: 20px;
    font-weight: 700;
    margin-bottom: 10px;
}

.footer-project-title {
    color: #cbd5e1;
    font-size: 14px;
    margin-bottom: 18px;
}

.footer-developer {
    color: #f8fafc;
    font-size: 14px;
    font-weight: 500;
    margin-bottom: 7px;
}

.footer-email a {
    color: #5eead4;
    text-decoration: none;
    font-size: 13px;
}

.footer-email a:hover {
    text-decoration: underline;
}

.footer-line {
    width: 100%;
    height: 1px;
    background: #334155;
    margin: 22px auto 16px;
}

.footer-copyright {
    color: #94a3b8;
    font-size: 12px;
}

/* Responsive Footer */

@media (max-width: 600px) {

    .site-footer {
        padding: 28px 15px 20px;
    }

    .footer-logo {
        font-size: 18px;
    }

    .footer-project-title {
        font-size: 13px;
        line-height: 1.5;
    }

    .footer-developer {
        font-size: 13px;
    }

    .footer-email a {
        font-size: 12px;
    }

}

/* ================= RESPONSIVE ================= */

@media(max-width: 900px) {

    .nav-links {
        gap: 10px;
        flex-wrap: wrap;
        justify-content: flex-end;
    }

    .hero {
        flex-direction: column;
        gap: 40px;
    }

    .hero-content,
    .hero-card {
        width: 100%;
    }

    .features {
        grid-template-columns: 1fr;
    }

    .steps {
        grid-template-columns: 1fr 1fr;
    }
}

@media(max-width: 600px) {

    .navbar {
        flex-direction: column;
        gap: 15px;
    }

    .nav-links {
        justify-content: center;
    }

    .hero h1 {
        font-size: 38px;
    }

    .steps {
        grid-template-columns: 1fr;
    }

}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

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

        <!-- HOME ACTIVE -->
        <a class="active"
           href="${pageContext.request.contextPath}/home">
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

<!-- ================= HERO ================= -->

<section class="hero">

    <div class="hero-content">

        <% if (session.getAttribute("USEREMAIL") != null) { %>

            <div class="welcome">
                👋 Welcome back, ${user.name}!
            </div>

        <% } %>

        <h1>
            Make Your Resume
            <span>AI-Powered</span>
        </h1>

        <p>
            Analyze your resume with Artificial Intelligence,
            improve your ATS score, identify missing skills,
            and get professional resume improvement suggestions.
        </p>

        <div class="hero-buttons">

            <a class="primary-btn"
               href="${pageContext.request.contextPath}/upload_resume">
                📄 Analyze My Resume
            </a>

            <a class="secondary-btn"
               href="#how-it-works">
                ⚡ How It Works
            </a>

        </div>

    </div>


    <div class="hero-card">

        <h2>🤖 AI Resume Analysis</h2>

        <div class="score-box">

            <small>Example ATS Score</small>

            <div class="score">
                85/100
            </div>

        </div>

        <ul>

            <li>✅ ATS Compatibility</li>
            <li>✅ Technical Skills</li>
            <li>✅ Missing Skills</li>
            <li>✅ Resume Strengths</li>
            <li>✅ Resume Weaknesses</li>
            <li>✅ AI Recommendations</li>

        </ul>

    </div>

</section>


<!-- ================= FEATURES ================= -->

<!-- ================= FEATURES ================= -->

<section class="section" id="features">

    <h2>Powerful Features</h2>

    <p class="section-subtitle">
        Everything you need to analyze, improve and prepare your career
    </p>

    <div class="features">


        <!-- AI RESUME ANALYSIS -->

        <div class="feature-card">

            <div class="feature-icon">🤖</div>

            <h3>AI Resume Analysis</h3>

            <p>
                Get an intelligent analysis of your resume
                using Gemini AI technology.
            </p>

        </div>


        <!-- ATS SCORE -->

        <div class="feature-card">

            <div class="feature-icon">📊</div>

            <h3>ATS Score</h3>

            <p>
                Understand the ATS-oriented strength
                of your resume.
            </p>

        </div>


        <!-- SKILL GAP -->

        <div class="feature-card">

            <div class="feature-icon">🧠</div>

            <h3>Skill Gap Analysis</h3>

            <p>
                Identify your existing skills and discover
                important missing skills.
            </p>

        </div>


        <!-- JOB MATCHING -->

        <div class="feature-card">

            <div class="feature-icon">🎯</div>

            <h3>Job Matching</h3>

            <p>
                Compare your resume with a target job description
                and identify important skill gaps.
            </p>

        </div>


        <!-- LEARNING ROADMAP -->

        <div class="feature-card">

            <div class="feature-icon">📚</div>

            <h3>Learning Roadmap</h3>

            <p>
                Get prioritized learning areas based on
                the requirements of your target job.
            </p>

        </div>


        <!-- INTERVIEW PREPARATION -->

        <div class="feature-card">

            <div class="feature-icon">🎤</div>

            <h3>Interview Preparation</h3>

            <p>
                Generate job-related interview questions
                and AI-powered answers for preparation.
            </p>

        </div>


        <!-- AI RESUME REWRITER -->

        <div class="feature-card">

            <div class="feature-icon">✨</div>

            <h3>AI Resume Rewriter</h3>

            <p>
                Generate an improved and job-focused
                version of your existing resume.
            </p>

        </div>


        <!-- AI RECOMMENDATIONS -->

        <div class="feature-card">

            <div class="feature-icon">💡</div>

            <h3>AI Recommendations</h3>

            <p>
                Receive practical suggestions to improve
                your resume and professional profile.
            </p>

        </div>


        <!-- RESUME HISTORY -->

        <div class="feature-card">

            <div class="feature-icon">📋</div>

            <h3>Resume History</h3>

            <p>
                Review your previously analyzed resumes
                and saved analysis results.
            </p>

        </div>


    </div>

</section>


<!-- ================= HOW IT WORKS ================= -->

<!-- ================= HOW IT WORKS ================= -->

<section class="section" id="how-it-works">

    <h2>How It Works</h2>

    <p class="section-subtitle">
        A simple career-assistance workflow from resume analysis to preparation
    </p>

    <div class="steps">


        <!-- STEP 1 -->

        <div class="step">

            <div class="step-number">1</div>

            <h3>Login</h3>

            <p>
                Create an account or login securely
                to access your dashboard.
            </p>

        </div>


        <!-- STEP 2 -->

        <div class="step">

            <div class="step-number">2</div>

            <h3>Upload Resume</h3>

            <p>
                Upload your resume in PDF format
                for AI-powered analysis.
            </p>

        </div>


        <!-- STEP 3 -->

        <div class="step">

            <div class="step-number">3</div>

            <h3>AI Analysis</h3>

            <p>
                Gemini AI analyzes your resume,
                skills, experience and content.
            </p>

        </div>


        <!-- STEP 4 -->

        <div class="step">

            <div class="step-number">4</div>

            <h3>Get Career Insights</h3>

            <p>
                View your ATS score, strengths,
                missing skills and improvement suggestions.
            </p>

        </div>


        <!-- STEP 5 -->

        <div class="step">

            <div class="step-number">5</div>

            <h3>Prepare & Improve</h3>

            <p>
                Use job matching, learning guidance,
                interview preparation and resume rewriting.
            </p>

        </div>


    </div>

</section>

<!-- ================= WHY USE ================= -->

<section class="section why-use" id="why-use">

    <h2>Why Use AI Resume Analyzer?</h2>

    <p class="section-subtitle">
        Build a stronger resume and improve your job opportunities
    </p>

    <div class="why-list">

        <div class="why-item">
            ✅ Improve your ATS compatibility
        </div>

        <div class="why-item">
            ✅ Identify missing technical skills
        </div>

        <div class="why-item">
            ✅ Understand your resume strengths
        </div>

        <div class="why-item">
            ✅ Find weaknesses in your resume
        </div>

        <div class="why-item">
            ✅ Get AI-powered professional suggestions
        </div>

        <div class="why-item">
            ✅ Make your resume more job-ready
        </div>

    </div>

</section>


<!-- ================= CTA ================= -->

<section class="cta">

    <h2>Ready to Improve Your Resume?</h2>

    <p>
        Upload your resume and let AI analyze it for you.
    </p>

    <a class="cta-btn"
       href="${pageContext.request.contextPath}/upload_resume">

        🚀 Analyze My Resume

    </a>

</section>


<!-- =========================
     Professional Footer
     ========================= -->

<footer class="site-footer">

    <div class="footer-content">

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

    </div>

</footer>

</body>

</html>