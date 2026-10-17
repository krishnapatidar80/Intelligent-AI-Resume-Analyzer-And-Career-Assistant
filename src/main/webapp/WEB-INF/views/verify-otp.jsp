<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.springframework.web.util.HtmlUtils" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify OTP | AI Resume Analyzer</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            font-family: Arial, sans-serif;
            color: #f8fafc;
            background: linear-gradient(135deg, #0f172a, #172554, #164e63);
        }

        .card {
            width: 100%;
            max-width: 430px;
            padding: 35px;
            border: 1px solid rgba(255, 255, 255, 0.16);
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.08);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(14px);
        }

        h1 {
            margin: 0 0 10px;
            font-size: 28px;
        }

        p {
            color: #cbd5e1;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 14px;
            margin-bottom: 18px;
            border: 1px solid #475569;
            border-radius: 9px;
            outline: none;
            background: rgba(15, 23, 42, 0.75);
            color: white;
            font-size: 22px;
            text-align: center;
            letter-spacing: 8px;
        }

        input:focus {
            border-color: #38bdf8;
        }

        button {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 9px;
            background: #38bdf8;
            color: #082f49;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #7dd3fc;
        }

        .error {
            color: #fca5a5;
            margin-bottom: 15px;
            line-height: 1.5;
        }

        .success {
            color: #86efac;
            margin-bottom: 15px;
            line-height: 1.5;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 22px;
            color: #bae6fd;
            text-decoration: none;
        }

        .back:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<main class="card">

    <h1>Verify OTP</h1>

    <p>
        Enter the 6-digit verification code sent to your registered email.
        The code expires in 5 minutes.
    </p>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error">
            <%= HtmlUtils.htmlEscape(String.valueOf(request.getAttribute("error"))) %>
        </div>
    <% } %>

    <% if (request.getAttribute("message") != null) { %>
        <div class="success">
            <%= HtmlUtils.htmlEscape(String.valueOf(request.getAttribute("message"))) %>
        </div>
    <% } %>

    <form action="${pageContext.request.contextPath}/verify-otp"
          method="post">

        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}">

        <label for="otp">6-Digit OTP</label>

        <input type="text"
               id="otp"
               name="otp"
               placeholder="000000"
               inputmode="numeric"
               pattern="[0-9]{6}"
               minlength="6"
               maxlength="6"
               autocomplete="one-time-code"
               required>

        <button type="submit">Verify OTP</button>

    </form>

    <a class="back"
       href="${pageContext.request.contextPath}/forgot-password">
        ← Request a New OTP
    </a>

    <a class="back"
       href="${pageContext.request.contextPath}/login">
        Back to Login
    </a>

</main>

</body>
</html>