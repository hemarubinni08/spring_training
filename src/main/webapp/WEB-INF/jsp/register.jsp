<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

    <style>
        /* ✅ Fix alignment issue globally */
        * {
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #667eea, #764ba2);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container-box {
            width: 360px;
            background: #ffffff;
            padding: 25px; /* equal padding for perfect alignment */
            border-radius: 14px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #4a3aff;
            font-size: 24px;
        }

        label {
            font-weight: 600;
            color: #333;
            margin-bottom: 4px;
            display: block;
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 13px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #4a3aff;
            box-shadow: 0 0 5px rgba(74, 58, 255, 0.3);
            outline: none;
        }

        .btn-register {
            width: 100%;
            padding: 11px;
            background: linear-gradient(135deg, #4a3aff, #6a5cff);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn-register:hover {
            background: linear-gradient(135deg, #372bdb, #5749ff);
        }

        .error {
            background: #ffe6e6;
            color: #cc0000;
            padding: 8px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 12px;
            font-size: 13px;
        }
    </style>
</head>

<body>

<div class="container-box">
    <h2>Register</h2>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <form method="post">

        <label>Name</label>
        <input type="text" name="name" class="form-control" required>

        <label>Email</label>
        <input type="email" name="email" class="form-control" required>

        <label>Phone Number</label>
        <input type="text" name="phoneNo" class="form-control" required>

        <label>Username</label>
        <input type="text" name="userName" class="form-control" required>

        <label>Password</label>
        <input type="password" name="password" class="form-control" required>

        <label>Age</label>
        <input type="number" name="age" class="form-control" required>

        <button type="submit" class="btn-register">Create Account</button>

    </form>
</div>

</body>
</html>