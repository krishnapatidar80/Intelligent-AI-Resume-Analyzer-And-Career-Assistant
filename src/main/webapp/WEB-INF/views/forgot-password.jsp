<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ page import="org.springframework.web.util.HtmlUtils" %>

<%
    Object messageObj = request.getAttribute("message");
    Object errorObj = request.getAttribute("error");

    String message = messageObj == null
            ? null : HtmlUtils.htmlEscape(String.valueOf(messageObj));

    String error = errorObj == null
            ? null : HtmlUtils.htmlEscape(String.valueOf(errorObj));
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Forgot Password | AI Resume Analyzer</title>

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
            border: 1px solid rgba(255,255,255,.16);
            border-radius: 20px;
            background: rgba(255,255,255,.08);
            box-shadow: 0 20px 50px rgba(0,0,0,.25);
            backdrop-filter: blur(14px);
        }

        .icon {
            width: 54px;
            height: 54px;
            display: grid;
            place-items: center;
            margin-bottom: 22px;
            border-radius: 15px;
            background: rgba(56,189,248,.15);
            border: 1px solid rgba(56,189,248,.3);
            font-size: 25px;
        }

        h1 {
            margin: 0 0 10px;
            font-size: 28px;
        }

        .subtitle {
            color: #cbd5e1;
            line-height: 1.7;
            margin-bottom: 25px;
            font-size: 14px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            font-size: 13px;
        }

        input[type="email"] {
            width: 100%;
            padding: 13px;
            margin-bottom: 18px;
            border: 1px solid #475569;
            border-radius: 9px;
            outline: none;
            background: rgba(15,23,42,.75);
            color: white;
            font-size: 15px;
        }

        input[type="email"]:focus {
            border-color: #38bdf8;
            box-shadow: 0 0 0 3px rgba(56,189,248,.12);
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
            transition: background .2s, transform .2s;
        }

        button:hover {
            background: #7dd3fc;
            transform: translateY(-1px);
        }

        .message,
        .error {
            padding: 12px;
            margin-bottom: 16px;
            border-radius: 9px;
            font-size: 13px;
            line-height: 1.6;
            overflow-wrap: anywhere;
        }

        .message {
            color: #86efac;
            background: rgba(34,197,94,.09);
            border: 1px solid rgba(34,197,94,.25);
        }

        .error {
            color: #fca5a5;
            background: rgba(239,68,68,.09);
            border: 1px solid rgba(239,68,68,.25);
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 22px;
            color: #bae6fd;
            text-decoration: none;
            font-size: 13px;
        }

        .back:hover {
            color: white;
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .card {
                padding: 25px 20px;
            }

            h1 {
                font-size: 25px;
            }
        }
    </style>
</head>

<body>

    <main class="card">

        <div class="icon" aria-hidden="true">&#128273;</div>

        <h1>Forgot Password?</h1>

        <p class="subtitle">
            Enter your registered email address. If the account exists,
            we'll send you a password reset OTP.
        </p>

        <% if (message != null && !message.isEmpty()) { %>
            <div class="message" role="status">
                <%= message %>
            </div>
        <% } %>

        <% if (error != null && !error.isEmpty()) { %>
            <div class="error" role="alert">
                <%= error %>
            </div>
        <% } %>

        <form
            action="${pageContext.request.contextPath}/send-reset-otp"
            method="post">

            <%-- Spring Security CSRF token --%>
            <input
                type="hidden"
                name="${_csrf.parameterName}"
                value="${_csrf.token}">

            <label for="email">Registered Email</label>

            <input
                type="email"
                id="email"
                name="email"
                placeholder="Enter your email address"
                required
                maxlength="254"
                autocomplete="email">

            <button type="submit">Send OTP</button>

        </form>

        <a
            class="back"
            href="${pageContext.request.contextPath}/login">
            &#8592; Back to Login
        </a>

    </main>

</body>
</html>