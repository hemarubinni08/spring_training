<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #f4f7f6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .password-card {
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 25px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
        }

        .save-btn {
            width: 100%;
            padding: 12px;
            background-color: #4a90e2;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
        }

        .message {
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 0.9rem;
        }

        .success {
            background-color: #e7f9ee;
            color: #28a745;
            border: 1px solid #c3e6cb;
        }

        .error {
            background-color: #fff1f0;
            color: #d85c5c;
            border: 1px solid #ffa39e;
        }
    </style>
</head>

<body>

<div class="password-card">
    <h2>Update Password</h2>
    <p>Enter your details below to update your account password.</p>

    <!-- ✅ MESSAGE DISPLAY -->
    <c:if test="${message != null}">
        <div class="message error">
            ${message}
        </div>
    </c:if>

    <!-- ✅ FORM -->
    <form action="/user/changePassword/${user.id}" method="POST">

        <div class="input-group">
            <label for="password">Old Password</label>
            <input type="password" id="password" name="password" required>
        </div>

        <div class="input-group">
            <label for="newPassword">New Password</label>
            <input type="password" id="newPassword" name="newPassword" required>
        </div>

        <button type="submit" class="save-btn">
            Save Password
        </button>
    </form>
</div>

</body>
</html>