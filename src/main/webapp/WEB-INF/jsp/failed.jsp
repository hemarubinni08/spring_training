<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Failed</title>

    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff4e50, #f9d423);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .error-card {
            background: #ffffff;
            padding: 40px;
            width: 430px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.25);
        }

        .error-icon {
            font-size: 60px;
            color: #e74c3c;
            margin-bottom: 15px;
        }

        .error-card h2 {
            color: #333;
            margin-bottom: 10px;
        }

        .error-card p {
            color: #666;
            font-size: 15px;
            margin-bottom: 25px;
        }

        .email {
            font-weight: bold;
            color: #e74c3c;
        }

        .retry-btn {
            display: inline-block;
            padding: 12px 25px;
            background: #e74c3c;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .retry-btn:hover {
            background: #c0392b;
        }
    </style>
</head>

<body>

<div class="error-card">
    <div class="error-icon">❌</div>

    <h2>Registration Failed</h2>

    <p>
        Sorry! We couldn’t complete your registration.<br>
        Email already exists:
        <span class="email">${email}</span>
    </p>

    <a href="/user/register" class="retry-btn">Try Again</a>
</div>

</body>
</html>