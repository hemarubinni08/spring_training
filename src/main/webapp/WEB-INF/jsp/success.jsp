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
            background: linear-gradient(135deg, #a8edea, #fed6e3);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .success-container {
            background: #ffffff;
            width: 420px;
            text-align: center;
            padding: 40px 35px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .success-icon {
            font-size: 60px;
            color: #4CAF50;
            margin-bottom: 15px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            font-size: 15px;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            background: #4CAF50;
            color: white;
            padding: 12px 22px;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background: #43a047;
        }
    </style>
</head>

<body>

<div class="success-container">
    <div class="success-icon">✅</div>
    <h2>Registration Successful!</h2>
    <h2>${message}</h2>
    <p>Your details have been submitted successfully.<br>
       You can now continue with other actions.</p>

    <a href="${pageContext.request.contextPath}/user/register" class="btn">Register Another User</a>
</div>

</body>
</html>