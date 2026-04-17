<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registration Successful</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f2f4f8;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 350px;
            margin: 120px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        .success-icon {
            font-size: 48px;
            color: #28a745;
            margin-bottom: 15px;
        }

        h2 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            margin-bottom: 25px;
            font-size: 14px;
        }

        a {
            display: inline-block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="success-icon">✅</div>

    <h2>${message}</h2>

    <p>${message}</p>

    <a href="${pageContext.request.contextPath}/user/display">
        View Users
    </a>
</div>
</body>
</html>