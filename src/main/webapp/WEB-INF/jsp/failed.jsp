<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>failed</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #43e97b, #38f9d7);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background: #fff;
            padding: 40px;
            width: 400px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        .success-icon {
            font-size: 50px;
            color: #28a745;
            margin-bottom: 15px;
        }

        h2 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            font-size: 16px;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #43e97b;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #28a745;
        }
    </style>

</head>

<body>

<div class="card">
    <div class="success-icon">✔</div>

    <h2>${message}</h2>

    <p>Welcome, <strong><%= request.getParameter("name") %></strong> 🎉</p>

    <a href="/" class="btn">Go to Home</a>
</div>

</body>
</html>