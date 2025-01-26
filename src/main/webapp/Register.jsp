<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: AntiqueWhite;
        }
        .container {
            max-width: 600px;
            width: 100%;
            margin: 30px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="tel"], select {
            width: 100%;
            padding: 10px;
            margin: 10px 0 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .links {
            text-align: center;
            margin-top: 15px;
        }
        .links a {
            color: #4CAF50;
            text-decoration: none;
            margin: 0 10px;
        }
        .links a:hover {
            text-decoration: underline;
        }
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
        }
        @media (max-width: 480px) {
            .container {
                padding: 10px;
            }
            h2 {
                font-size: 20px;
            }	
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Sign Up</h2>
        <form action="RegisterServlet" method="post">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your full name" required>

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="pwd" placeholder="Enter your password" required>

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>

            <label for="address">Address</label>
            <select id="address" name="address" required>         
                <option value="Rajkot">Rajkot</option>
                <option value="Ahmedabad">Ahmedabad</option>
                <option value="Pune">Pune</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Delhi">Delhi</option>
                <option value="Hyderabad">Patna</option>
                <option value="Hyderabad">Hyderabad</option>
            </select>

            <label>
                <input type="checkbox" name="terms" required>
                I agree to all statements in Terms of Service
            </label>
            <br/><br/>
            <input type="submit" value="Register">
        </form>

        <div class="links">
            Already have an account? <a href="Login.jsp">Log In</a>
        </div>
    </div>

</body>
</html>
