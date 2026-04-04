<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>

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

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus {
            border-color: #007bff;
            outline: none;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        .message {
            color: red;
            margin-bottom: 10px;
        }

        a {
            display: block;
            margin-top: 15px;
            font-size: 14px;
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
<div class="container">
    <h2>User Login</h2>

    <!-- Error or success message -->
    <div class="message">
        ${message}
    </div>

    <form action="${pageContext.request.contextPath}/user/login" method="post">

        <label>Email:</label>
        <input type="email" name="email" required/>

        <label>Password:</label>
        <input type="password" name="password" required/>

        <button type="submit">Login</button>

    </form>

    <a href="${pageContext.request.contextPath}/user/register">
        New user? Register here
    </a>
</div>
</body>
</html>