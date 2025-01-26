<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(120deg, #ff9a9e, #fad0c4);
        color: white;
        text-align: center;
        padding: 50px;
        margin: 0;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    h3 {
        font-size: 2rem;
        margin-bottom: 20px;
    }

    .logout-form button {
        padding: 12px 25px;
        font-size: 1.2rem;
        color: white;
        background: linear-gradient(to right, #6a82fb, #fc5c7d);
        border: none;
        border-radius: 25px;
        cursor: pointer;
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease;
    }

    .logout-form button:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 20px rgba(0, 0, 0, 0.3);
    }
</style>
</head>
<body>
    <h3>Are you sure you want to log out?</h3>
    	<form action="Logout" method="get">
    		<button type="submit">Logout</button>
		</form>

</body>
</html>
