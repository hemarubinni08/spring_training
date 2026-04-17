<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg,#0f2027,#203a43,#2c5364);
            color: #fff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-box {
            width: 360px;
            padding: 40px;
            border-radius: 20px;
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(18px);
            text-align: center;
            box-shadow: 0 20px 50px rgba(0,0,0,0.5);
        }

        .login-box h2 {
            margin-bottom: 30px;
            background: linear-gradient(90deg,#00f2ff,#7f5cff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .field {
            margin-bottom: 20px;
            text-align: left;
        }

        .field label {
            display: block;
            margin-bottom: 6px;
            opacity: 0.9;
        }

        .field input {
            width: 100%;
            padding: 12px;
            border-radius: 12px;
            border: none;
            outline: none;
            background: rgba(255,255,255,0.2);
            color: #fff;
            font-size: 14px;
        }

        .field input::placeholder {
            color: rgba(255,255,255,0.6);
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            border-radius: 14px;
            border: none;
            cursor: pointer;
            background: linear-gradient(90deg,#00f2ff,#7f5cff);
            color: #000;
            font-weight: bold;
            transition: transform 0.3s, box-shadow 0.3s;
            margin-top: 10px;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0,242,255,0.4);
        }
    </style>
</head>

<body>

<div class="login-box">
    <h2>Admin Login</h2>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="field">
            <label>Username</label>
            <input type="text" name="username" required />
        </div>

        <div class="field">
            <label>Password</label>
            <input type="password" name="password" required />
        </div>

        <button type="submit" class="login-btn">Login</button>
    </form>
</div>

</body>
</html>