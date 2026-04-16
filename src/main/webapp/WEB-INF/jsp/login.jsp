<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            max-width: 400px;
            width: 100%;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header {
            border-bottom: 2px solid #eeeeee;
            padding-bottom: 15px;
            margin-bottom: 25px;
            text-align: center;
        }

        h2 {
            margin: 0;
            color: #2c3e50;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            font-size: 13px;
            color: #555;
            text-transform: uppercase;
        }

        .input-field {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 15px;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-login:hover {
            background-color: #2980b9;
        }

        .error-box {
            background-color: #e74c3c;
            color: white;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2>Login</h2>
    </div>

    <c:if test="${param.error != null}">
        <div class="error-box">
            Invalid E mail or Password
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
            <label>E-mail</label>
            <input type="text" name="username" class="input-field" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" class="input-field" required>
        </div>

        <button type="submit" class="btn-login">Sign In</button>
    </form>
</div>

</body>
</html>