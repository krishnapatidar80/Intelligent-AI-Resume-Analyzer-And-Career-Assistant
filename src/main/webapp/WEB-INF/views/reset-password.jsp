<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.springframework.web.util.HtmlUtils" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password | AI Resume Analyzer</title>

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
            padding: 13px;
            margin-bottom: 18px;
            border: 1px solid #475569;
            border-radius: 9px;
            outline: none;
            background: rgba(15, 23, 42, 0.75);
            color: white;
            font-size: 15px;
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

        .back {
            display: block;
            text-align: center;
            margin-top: 20px;
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

    <h1>Reset Password</h1>

    <p>Choose a new password for your account.</p>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error">
            <%= HtmlUtils.htmlEscape(
                String.valueOf(request.getAttribute("error"))
            ) %>
        </div>
    <% } %>

    <form action="${pageContext.request.contextPath}/reset-password"
          method="post"
          onsubmit="return validatePasswords();">

        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}">

        <label for="password">New Password</label>

        <input type="password"
               id="password"
               name="password"
               placeholder="Minimum 8 characters"
               minlength="8"
               autocomplete="new-password"
               required>

        <label for="confirmPassword">Confirm New Password</label>

        <input type="password"
               id="confirmPassword"
               name="confirmPassword"
               placeholder="Re-enter new password"
               minlength="8"
               autocomplete="new-password"
               required>

        <div id="validationError"
             class="error"
             style="display:none;">
        </div>

        <button type="submit">Reset Password</button>

    </form>

    <a class="back"
       href="${pageContext.request.contextPath}/login">
        Back to Login
    </a>

</main>

<script>
function validatePasswords() {
    const password = document.getElementById("password").value;
    const confirmPassword =
        document.getElementById("confirmPassword").value;
    const errorBox = document.getElementById("validationError");

    errorBox.style.display = "none";
    errorBox.textContent = "";

    if (password.length < 8) {
        errorBox.textContent =
            "Password must contain at least 8 characters.";
        errorBox.style.display = "block";
        return false;
    }

    if (password !== confirmPassword) {
        errorBox.textContent = "Passwords do not match.";
        errorBox.style.display = "block";
        return false;
    }

    return true;
}
</script>

</body>
</html>