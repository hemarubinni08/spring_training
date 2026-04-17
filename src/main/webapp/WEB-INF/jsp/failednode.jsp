<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Failed</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #ee0979, #ff6a00);
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
            color: #d32f2f;
            margin-bottom: 15px;
        }

        .error-message {
            background-color: #fdecea;
            color: #d32f2f;
            padding: 14px;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 25px;
            background-color: #1976d2;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #125aa1;
        }
    </style>
</head>

<body>
<div class="container">
    <h2>Node Registration Failed</h2>
    <div class="error-message">
        ${errorMessage != null ? errorMessage : "Node Name already exists. Please try again."}
    </div>
    <a href="${pageContext.request.contextPath}/nodes/addnodes" class="btn">
        Try Again
    </a>
    <a href="/nodes/displaynodes" class="btn">
            Go to Node List
    </a>
</div>
</body>
</html>