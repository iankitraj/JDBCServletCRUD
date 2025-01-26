<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: LightGray;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            margin-bottom: 15px;
        }
        .options {
            margin-top: 15px;
            font-size: 0.9em;
        }
        .options a {
            color: #007BFF;
            text-decoration: none;
            margin: 0 5px;
        }
        .options a:hover {
            text-decoration: underline;
        }
        .back-button {
            display: block;
            margin: 15px 0;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            text-align: center;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById("password");
            const passwordCheckbox = document.getElementById("showPassword");
            passwordInput.type = passwordCheckbox.checked ? "text" : "password";
        }
    </script>
</head>
<body>
    <div class="login-container">
        <h2>Sign In</h2>
        <!-- Display error message if present -->
        <% String errorMessage = (String) request.getAttribute("errorMessage");
           if (errorMessage != null) { %>
            <div class="error-message"><%= errorMessage %></div>
        <% } %>
        <form action="Login" method="post">
            <input type="text" name="email" placeholder="Email" required /> <br />
            <input type="password" id="password" name="pwd" placeholder="Password" required /> <br /><br />
            <input type="checkbox" id="showPassword" onclick="togglePasswordVisibility()" />
            <label for="showPassword">Show Password</label> <br /><br />
            <input type="submit" value="Log In" /> <br /><br />
        </form>
        <% if (errorMessage != null) { %>
        <% } %>
        <div class="options">
            <a href="ForgotPassword.jsp">Forgot Password?</a> |
            <a href="Register.jsp">Sign Up</a>
        </div>
    </div>
</body>
</html>
