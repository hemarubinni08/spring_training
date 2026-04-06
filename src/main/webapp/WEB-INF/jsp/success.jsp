<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 420px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            color: #2e7d32;
            margin-bottom: 15px;
        }

        .success-message {
            background-color: #e8f5e9;
            color: #2e7d32;
            padding: 14px;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 25px;
            background-color: #2e7d32;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #1b5e20;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Registration Successful 🎉
    ${message}</h2>

    <div class="success-message">
        ${successMessage != null ? successMessage : "Your account has been created successfully."}
    </div>

    <a href="${pageContext.request.contextPath}/login" class="btn">
        Go to Login
    </a>
</div>

</body>
</html>