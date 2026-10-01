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

<title>Login | AI Resume Analyzer</title>

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

    min-height: 650px;

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

    width: 250px;

    height: 250px;

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
   BRAND
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
   FEATURES
===================================================== */

.feature {

    display: flex;

    align-items: center;

    gap: 15px;

    margin-bottom: 20px;
}

.feature-icon {

    width: 42px;

    height: 42px;

    border-radius: 12px;

    background: rgba(255,255,255,0.15);

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 19px;

    flex-shrink: 0;
}

.feature h4 {

    font-size: 15px;

    margin-bottom: 4px;
}

.feature p {

    font-size: 12px;

    color: #ddd6fe;
}


/* =====================================================
   RIGHT SIDE
===================================================== */

.right-panel {

    padding: 55px 55px;

    display: flex;

    flex-direction: column;

    justify-content: center;
}


/* =====================================================
   FORM HEADER
===================================================== */

.form-header {

    margin-bottom: 30px;
}

.form-header h2 {

    font-size: 30px;

    margin-bottom: 8px;

    color: #0f172a;
}

.form-header p {

    color: #64748b;

    font-size: 14px;
}


/* =====================================================
   FORM
===================================================== */

.form-group {

    margin-bottom: 20px;
}

.form-group label {

    display: block;

    font-size: 13px;

    font-weight: bold;

    margin-bottom: 8px;

    color: #334155;
}

.input-wrapper {

    position: relative;
}

.input-icon {

    position: absolute;

    left: 14px;

    top: 50%;

    transform: translateY(-50%);

    font-size: 16px;

    color: #94a3b8;
}

input {

    width: 100%;

    height: 50px;

    padding: 0 15px 0 45px;

    border: 1px solid #cbd5e1;

    border-radius: 10px;

    outline: none;

    font-size: 14px;

    transition: 0.3s;
}

input:focus {

    border-color: #6366f1;

    box-shadow:
        0 0 0 4px rgba(99,102,241,0.10);
}


/* =====================================================
   BUTTON
===================================================== */

.login-btn {

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

    transition: 0.3s;

    margin-top: 5px;
}

.login-btn:hover {

    transform: translateY(-2px);

    box-shadow:
        0 8px 20px rgba(79,70,229,0.30);
}


/* =====================================================
   REGISTER
===================================================== */

.register-text {

    text-align: center;

    margin-top: 25px;

    color: #64748b;

    font-size: 14px;
}

.register-text a {

    color: #4f46e5;

    font-weight: bold;

    text-decoration: none;
}

.register-text a:hover {

    text-decoration: underline;
}


/* =====================================================
   POPUP
===================================================== */

.popup {

    position: fixed;

    top: 25px;

    right: 25px;

    width: 370px;

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

    font-weight: bold;

    font-size: 21px;

    flex-shrink: 0;
}


.error-icon {

    background: #fee2e2;

    color: #dc2626;
}


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

    font-size: 13px;

    color: #64748b;
}


.close {

    font-size: 22px;

    color: #94a3b8;

    cursor: pointer;
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

            Build a Resume That

            <span>Gets Noticed.</span>

        </h1>


        <!-- DESCRIPTION -->

        <p class="description">

            Analyze your resume with AI, identify skill gaps,
            improve your content and get smarter career insights
            in just a few clicks.

        </p>


        <!-- FEATURE 1 -->

        <div class="feature">

            <div class="feature-icon">
                ✨
            </div>

            <div>

                <h4>
                    AI-Powered Analysis
                </h4>

                <p>
                    Get intelligent insights from your resume.
                </p>

            </div>

        </div>


        <!-- FEATURE 2 -->

        <div class="feature">

            <div class="feature-icon">
                📊
            </div>

            <div>

                <h4>
                    Resume Score
                </h4>

                <p>
                    Understand how strong your resume really is.
                </p>

            </div>

        </div>


        <!-- FEATURE 3 -->

        <div class="feature">

            <div class="feature-icon">
                🎯
            </div>

            <div>

                <h4>
                    Career Insights
                </h4>

                <p>
                    Discover skills that can improve your profile.
                </p>

            </div>

        </div>


        <!-- FEATURE 4 -->

        <div class="feature">

            <div class="feature-icon">
                🚀
            </div>

            <div>

                <h4>
                    Improve Your Resume
                </h4>

                <p>
                    Make your resume more professional and job-ready.
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
                Welcome Back 👋
            </h2>

            <p>
                Login to access your AI-powered career tools.
            </p>

        </div>


        <!-- =================================================
             LOGIN SUCCESS
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
                    Success!
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
             LOGIN ERROR
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
                    Login Failed
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
             LOGIN FORM
        ================================================= -->

        <form action="${pageContext.request.contextPath}/checkuser"
              method="post">


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
                        placeholder="Enter your password"
                        required>

                </div>

            </div>


            <!-- LOGIN BUTTON -->

            <button type="submit"
                    class="login-btn">

                Login to Dashboard →

            </button>


        </form>


        <!-- REGISTER -->

        <div class="register-text">

            Don't have an account?

            <a href="${pageContext.request.contextPath}/register">

                Create Account

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