<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>

    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .success-card {
            background: #ffffff;
            padding: 40px;
            width: 420px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.25);
        }

        .success-icon {
            font-size: 60px;
            color: #43cea2;
            margin-bottom: 15px;
        }

        .success-card h2 {
            color: #333;
            margin-bottom: 10px;
        }

        .success-card p {
            color: #666;
            font-size: 15px;
            margin-bottom: 25px;
        }

        .success-card .email {
            font-weight: bold;
            color: #185a9d;
        }

        .home-btn {
            display: inline-block;
            padding: 12px 25px;
            background: #185a9d;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .home-btn:hover {
            background: #134e86;
        }
    </style>
</head>

<body>

<div class="success-card">
    <div class="success-icon">✅</div>

    <h2>Registration Successful!</h2>

    <p>
        Welcome! Your account has been created successfully.<br>
        Registered Email:
        <span class="email">${email}</span>
    </p>

    <a href="/user/login" class="home-btn">Go to Login</a>
</div>

</body>
</html>