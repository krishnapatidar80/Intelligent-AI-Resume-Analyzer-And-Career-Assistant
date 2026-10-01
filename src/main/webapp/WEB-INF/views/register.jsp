<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Create Account | AI Resume Analyzer</title>

<style>

/* =====================================================
   GLOBAL
===================================================== */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {

    font-family: Arial, Helvetica, sans-serif;

    min-height: 100vh;

    background:
        linear-gradient(
            135deg,
            #eef2ff,
            #f8fafc,
            #e0f2fe
        );

    display: flex;

    align-items: center;

    justify-content: center;

    padding: 25px;

    color: #1e293b;
}


/* =====================================================
   MAIN CARD
===================================================== */

.main-card {

    width: 1050px;

    min-height: 680px;

    background: #ffffff;

    border-radius: 24px;

    overflow: hidden;

    display: grid;

    grid-template-columns: 1fr 1fr;

    box-shadow:
        0 20px 60px rgba(15, 23, 42, 0.15);
}


/* =====================================================
   LEFT PANEL
===================================================== */

.left-panel {

    background:
        linear-gradient(
            145deg,
            #4f46e5,
            #6366f1,
            #7c3aed
        );

    color: white;

    padding: 55px 45px;

    position: relative;

    overflow: hidden;
}


/* Decorative Circle */

.left-panel::before {

    content: "";

    position: absolute;

    width: 260px;

    height: 260px;

    border-radius: 50%;

    background: rgba(255,255,255,0.08);

    top: -80px;

    right: -70px;
}


.left-panel::after {

    content: "";

    position: absolute;

    width: 180px;

    height: 180px;

    border-radius: 50%;

    background: rgba(255,255,255,0.07);

    bottom: -60px;

    left: -50px;
}


/* =====================================================
   LOGO
===================================================== */

.logo {

    display: flex;

    align-items: center;

    gap: 12px;

    margin-bottom: 45px;
}

.logo-icon {

    width: 48px;

    height: 48px;

    border-radius: 14px;

    background: rgba(255,255,255,0.18);

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 25px;

    border: 1px solid rgba(255,255,255,0.25);
}

.logo-text {

    font-size: 21px;

    font-weight: bold;
}


/* =====================================================
   LEFT CONTENT
===================================================== */

.left-panel h1 {

    font-size: 38px;

    line-height: 1.2;

    margin-bottom: 18px;
}

.left-panel h1 span {

    color: #c4b5fd;
}

.description {

    color: #e0e7ff;

    line-height: 1.7;

    font-size: 15px;

    margin-bottom: 35px;

    max-width: 430px;
}


/* =====================================================
   STEPS
===================================================== */

.step {

    display: flex;

    gap: 15px;

    margin-bottom: 22px;

    position: relative;

    z-index: 2;
}

.step-number {

    width: 40px;

    height: 40px;

    border-radius: 50%;

    background: rgba(255,255,255,0.15);

    display: flex;

    align-items: center;

    justify-content: center;

    font-weight: bold;

    flex-shrink: 0;

    border: 1px solid rgba(255,255,255,0.12);
}

.step h4 {

    font-size: 15px;

    margin-bottom: 4px;
}

.step p {

    font-size: 12px;

    color: #ddd6fe;

    line-height: 1.5;
}


/* =====================================================
   RIGHT PANEL
===================================================== */

.right-panel {

    padding: 50px 55px;

    display: flex;

    flex-direction: column;

    justify-content: center;
}


/* =====================================================
   FORM HEADER
===================================================== */

.form-header {

    margin-bottom: 28px;
}

.form-header h2 {

    font-size: 30px;

    color: #0f172a;

    margin-bottom: 8px;
}

.form-header p {

    color: #64748b;

    font-size: 14px;

    line-height: 1.5;
}


/* =====================================================
   FORM
===================================================== */

.form-group {

    margin-bottom: 17px;
}

.form-group label {

    display: block;

    font-size: 13px;

    font-weight: bold;

    color: #334155;

    margin-bottom: 8px;
}

.input-wrapper {

    position: relative;
}

.input-icon {

    position: absolute;

    left: 14px;

    top: 50%;

    transform: translateY(-50%);

    color: #94a3b8;

    font-size: 16px;
}

input {

    width: 100%;

    height: 48px;

    padding: 0 15px 0 45px;

    border: 1px solid #cbd5e1;

    border-radius: 10px;

    outline: none;

    font-size: 14px;

    transition: 0.3s;

    color: #1e293b;

    background: #ffffff;
}

input::placeholder {

    color: #94a3b8;
}

input:focus {

    border-color: #6366f1;

    box-shadow:
        0 0 0 4px rgba(99,102,241,0.10);
}


/* =====================================================
   REGISTER BUTTON
===================================================== */

.register-btn {

    width: 100%;

    height: 50px;

    border: none;

    border-radius: 10px;

    background:
        linear-gradient(
            135deg,
            #4f46e5,
            #7c3aed
        );

    color: white;

    font-size: 15px;

    font-weight: bold;

    cursor: pointer;

    margin-top: 8px;

    transition: 0.3s;
}

.register-btn:hover {

    transform: translateY(-2px);

    box-shadow:
        0 8px 20px rgba(79,70,229,0.30);
}

.register-btn:active {

    transform: translateY(0);
}


/* =====================================================
   LOGIN LINK
===================================================== */

.login-text {

    text-align: center;

    margin-top: 22px;

    color: #64748b;

    font-size: 14px;
}

.login-text a {

    color: #4f46e5;

    font-weight: bold;

    text-decoration: none;
}

.login-text a:hover {

    text-decoration: underline;
}


/* =====================================================
   POPUP
===================================================== */

.popup {

    position: fixed;

    top: 25px;

    right: 25px;

    width: 380px;

    padding: 18px 20px;

    background: white;

    border-radius: 14px;

    display: flex;

    align-items: center;

    gap: 14px;

    box-shadow:
        0 15px 40px rgba(15,23,42,0.20);

    z-index: 9999;

    animation: slideIn 0.4s ease;
}


/* Success */

.success-popup {

    border-left: 5px solid #16a34a;
}


/* Error */

.error-popup {

    border-left: 5px solid #dc2626;
}


/* Popup Icon */

.popup-icon {

    width: 42px;

    height: 42px;

    border-radius: 50%;

    background: #dcfce7;

    color: #16a34a;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 21px;

    font-weight: bold;

    flex-shrink: 0;
}


.error-icon {

    background: #fee2e2;

    color: #dc2626;
}


/* Popup Content */

.popup-content {

    flex: 1;
}

.popup-content h3 {

    font-size: 15px;

    margin-bottom: 4px;
}

.success-popup .popup-content h3 {

    color: #166534;
}

.error-popup .popup-content h3 {

    color: #b91c1c;
}

.popup-content p {

    color: #64748b;

    font-size: 13px;

    line-height: 1.4;
}


/* Close */

.close {

    font-size: 22px;

    color: #94a3b8;

    cursor: pointer;

    line-height: 1;
}

.close:hover {

    color: #dc2626;
}


/* =====================================================
   ANIMATIONS
===================================================== */

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


/* =====================================================
   RESPONSIVE
===================================================== */

@media(max-width: 850px) {

    .main-card {

        grid-template-columns: 1fr;

        width: 500px;
    }

    .left-panel {

        display: none;
    }

    .right-panel {

        padding: 45px 35px;
    }
}


@media(max-width: 500px) {

    body {

        padding: 10px;
    }

    .main-card {

        width: 100%;
    }

    .right-panel {

        padding: 35px 25px;
    }

    .popup {

        width: calc(100% - 30px);

        right: 15px;

        top: 15px;
    }
}

</style>

</head>


<body>


<!-- =====================================================
     MAIN CARD
===================================================== -->

<div class="main-card">


    <!-- =================================================
         LEFT PANEL
    ================================================= -->

    <div class="left-panel">


        <!-- BRAND -->

        <div class="logo">

            <div class="logo-icon">
                🤖
            </div>

            <div class="logo-text">
                AI Resume Analyzer
            </div>

        </div>


        <!-- HEADING -->

        <h1>

            Start Your

            <span>Career Journey.</span>

        </h1>


        <!-- DESCRIPTION -->

        <p class="description">

            Create your account and unlock AI-powered tools
            to analyze, improve and optimize your resume
            for better career opportunities.

        </p>


        <!-- STEP 1 -->

        <div class="step">

            <div class="step-number">
                1
            </div>

            <div>

                <h4>
                    Upload Your Resume
                </h4>

                <p>
                    Upload your resume in PDF format.
                </p>

            </div>

        </div>


        <!-- STEP 2 -->

        <div class="step">

            <div class="step-number">
                2
            </div>

            <div>

                <h4>
                    AI-Powered Analysis
                </h4>

                <p>
                    Get an AI-based resume score and insights.
                </p>

            </div>

        </div>


        <!-- STEP 3 -->

        <div class="step">

            <div class="step-number">
                3
            </div>

            <div>

                <h4>
                    Discover Skill Gaps
                </h4>

                <p>
                    Identify missing skills and improvement areas.
                </p>

            </div>

        </div>


        <!-- STEP 4 -->

        <div class="step">

            <div class="step-number">
                4
            </div>

            <div>

                <h4>
                    Improve Your Resume
                </h4>

                <p>
                    Rewrite and optimize your resume with AI.
                </p>

            </div>

        </div>


    </div>


    <!-- =================================================
         RIGHT PANEL
    ================================================= -->

    <div class="right-panel">


        <!-- FORM HEADER -->

        <div class="form-header">

            <h2>
                Create Your Account 🚀
            </h2>

            <p>
                Join AI Resume Analyzer and unlock your
                AI-powered career tools.
            </p>

        </div>


        <!-- =================================================
             SUCCESS MESSAGE
        ================================================= -->

        <%

        String success = request.getParameter("success");

        if(success != null) {

        %>

        <div class="popup success-popup" id="popup">

            <div class="popup-icon">
                ✓
            </div>

            <div class="popup-content">

                <h3>
                    Registration Successful!
                </h3>

                <p>
                    <%= success %>
                </p>

            </div>

            <span class="close"
                  onclick="closePopup()">
                ×
            </span>

        </div>

        <%

        }

        %>


        <!-- =================================================
             ERROR MESSAGE
        ================================================= -->

        <%

        String error = request.getParameter("error");

        if(error != null) {

        %>

        <div class="popup error-popup" id="popup">

            <div class="popup-icon error-icon">
                !
            </div>

            <div class="popup-content">

                <h3>
                    Registration Failed!
                </h3>

                <p>
                    <%= error %>
                </p>

            </div>

            <span class="close"
                  onclick="closePopup()">
                ×
            </span>

        </div>

        <%

        }

        %>


        <!-- =================================================
             REGISTER FORM
        ================================================= -->

        <form action="${pageContext.request.contextPath}/adduser"
              method="post">


            <!-- FULL NAME -->

            <div class="form-group">

                <label>
                    Full Name
                </label>

                <div class="input-wrapper">

                    <span class="input-icon">
                        👤
                    </span>

                    <input
                        type="text"
                        name="name"
                        placeholder="Enter your full name"
                        required>

                </div>

            </div>


            <!-- EMAIL -->

            <div class="form-group">

                <label>
                    Email Address
                </label>

                <div class="input-wrapper">

                    <span class="input-icon">
                        ✉
                    </span>

                    <input
                        type="email"
                        name="email"
                        placeholder="Enter your email"
                        required>

                </div>

            </div>


            <!-- PASSWORD -->

            <div class="form-group">

                <label>
                    Password
                </label>

                <div class="input-wrapper">

                    <span class="input-icon">
                        🔒
                    </span>

                    <input
                        type="password"
                        name="password"
                        placeholder="Create a password"
                        required>

                </div>

            </div>


            <!-- REGISTER BUTTON -->

            <button type="submit"
                    class="register-btn">

                Create Account →

            </button>


        </form>


        <!-- LOGIN LINK -->

        <div class="login-text">

            Already have an account?

            <a href="${pageContext.request.contextPath}/login">

                Login Here

            </a>

        </div>


    </div>


</div>



<!-- =====================================================
     POPUP SCRIPT
===================================================== -->

<script>

function closePopup() {

    const popup = document.getElementById("popup");

    if(popup) {

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

</html>