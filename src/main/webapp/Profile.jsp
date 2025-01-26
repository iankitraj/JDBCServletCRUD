<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Details</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(120deg, #84fab0, #8fd3f4);
        color: white;
        text-align: center;
        padding: 50px;
        margin: 0;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        animation: fadeIn 2s ease-in;
        overflow: hidden;
    }

    h3 {
        font-size: 3rem;
        background: -webkit-linear-gradient(#ff9a9e, #fad0c4);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: bounceIn 1.5s ease-out;
        margin-bottom: 30px;
    }

    .user-details {
        font-size: 1.2rem;
        background: rgba(255, 255, 255, 0.2);
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        animation: slideUp 1.5s ease-out;
    }

    .user-details p {
        margin: 15px 0;
    }

    .logout-btn {
        margin-top: 20px;
        padding: 12px 25px;
        font-size: 1.2rem;
        color: white;
        background: linear-gradient(to right, #fc5c7d, #6a82fb);
        border: none;
        border-radius: 25px;
        cursor: pointer;
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease;
        animation: fadeIn 1.5s ease-in;
    }

    .logout-btn:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 20px rgba(0, 0, 0, 0.3);
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    @keyframes bounceIn {
        from {
            transform: scale(0.8);
            opacity: 0;
        }
        to {
            transform: scale(1);
            opacity: 1;
        }
    }

    @keyframes slideUp {
        from {
            transform: translateY(30px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }
</style>
</head>
<body>
    <h3>Welcome: ${session_name}</h3>
    <div class="user-details">
        <p><strong>User ID:</strong> ${user_id}</p>
        <p><strong>Name:</strong> ${user_name}</p>
        <p><strong>Email:</strong> ${user_email}</p>
        <p><strong>Password:</strong> ${user_password}</p>
        <p><strong>Phone:</strong> ${user_phone}</p>
        <p><strong>Address:</strong> ${user_address}</p>
    </div>
    <button class="logout-btn" onclick="location.href='Logout'">Logout</button>
</body>
</html>
