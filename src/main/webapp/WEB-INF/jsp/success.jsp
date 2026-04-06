<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registration Successful</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #cfd9df, #e2ebf0);
            font-family: "Segoe UI", Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 360px;
            padding: 32px 28px;
            background-color: #ffffff;
            border-radius: 14px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.18);
            text-align: center;
            animation: popIn 0.6s ease;
        }

        @keyframes popIn {
            from {
                transform: scale(0.95) translateY(15px);
                opacity: 0;
            }
            to {
                transform: scale(1) translateY(0);
                opacity: 1;
            }
        }

        .success-icon {
            font-size: 56px;
            color: #28a745;
            margin-bottom: 15px;
            animation: bounce 0.8s ease;
        }

        @keyframes bounce {
            0% { transform: scale(0.8); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        h2 {
            color: #2c2c2c;
            margin-bottom: 10px;
            font-weight: 600;
            letter-spacing: 0.4px;
        }

        p {
            color: #555;
            margin-bottom: 28px;
            font-size: 14px;
            line-height: 1.6;
        }

        a {
            display: inline-block;
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        a:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 18px rgba(0, 123, 255, 0.35);
        }

        a:active {
            transform: translateY(0);
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.25);
        }

        @media (max-width: 420px) {
            .container {
                width: 90%;
                padding: 28px 22px;
            }
        }
    </style>
</head>

<body>
<div class="container">

    <h2>${message}</h2>

    <p>${message}</p>

    <a href="${pageContext.request.contextPath}/login">
        Go to Login
    </a>
</div>
</body>
</html>