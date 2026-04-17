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
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .error-container {
            background: #ffffff;
            width: 430px;
            text-align: center;
            padding: 40px 35px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .error-icon {
            font-size: 60px;
            color: #e74c3c;
            margin-bottom: 15px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            font-size: 15px;
            margin-bottom: 25px;
            line-height: 1.5;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            background: #e74c3c;
            color: white;
            padding: 12px 22px;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background: #c0392b;
        }
    </style>
</head>

<body>

<div class="error-container">
    <div class="error-icon">❌</div>

    <h2>Failed</h2>
    <h2>${message}</h2>

    <p>
        Unfortunately, an error occurred.
    </p>

    <a href="${pageContext.request.contextPath}/user/registerJdbc" class="btn">Try Again</a>
</div>

</body>
</html>