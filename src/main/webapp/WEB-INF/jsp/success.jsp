<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 420px;
            background-color: white;
            padding: 35px 30px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 20px 30px rgba(0,0,0,0.25);
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(25px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .icon {
            font-size: 65px;
            margin-bottom: 15px;
        }

        h2 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            font-size: 15px;
            margin-bottom: 25px;
        }

        .btn {
            display: inline-block;
            margin: 8px 5px;
            padding: 10px 18px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #218838;
        }

        .btn.secondary {
            background-color: #007bff;
        }

        .btn.secondary:hover {
            background-color: #0056b3;
        }

        .footer {
            margin-top: 20px;
            font-size: 13px;
            color: #888;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="icon">✅</div>

    <h2>Registration Successful</h2>

    <p>
        Your account has been created successfully.<br>
        You can now log in or register another user.
    </p>

    <a href="${pageContext.request.contextPath}/user/login" class="btn">
        Login
    </a>

    <a href="${pageContext.request.contextPath}/user/register"
       class="btn secondary">
        Register Another User
    </a>

    <div class="footer">
        © 2026 UST POS Application
    </div>
</div>

</body>
</html>