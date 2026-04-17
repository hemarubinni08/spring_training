<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            width: 400px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            margin-top: 0;
            text-align: center;
            color: #333333;
            border-bottom: 1px solid #eeeeee;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 14px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #cccccc;
            border-radius: 3px;
            box-sizing: border-box; /* Ensures padding doesn't push width over 100% */
        }

        .row {
            display: flex;
            gap: 10px;
        }

        .row .form-group {
            flex: 1;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 3px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .footer {
            text-align: center;
            margin-top: 15px;
            font-size: 13px;
            color: #666666;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Create Account</h2>

    <form action="/user/register" method="post">

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" placeholder="Full Name" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" placeholder="email@example.com" required>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <input type="text" name="phoneNo" placeholder="Phone Number">
        </div>

        <div class="form-group">
            <label>Primary Role</label>
            <select name="role" required>
                <option value="">-- Select Role --</option>
                <c:forEach var="role" items="${roles}">
                    <option value="${role.name}">${role.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Additional Roles (Hold Ctrl to select multiple)</label>
            <select name="roles" multiple required style="height: 80px;">
                <c:forEach var="role" items="${roles}">
                    <option value="${role.name}">${role.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Login Username</label>
            <input type="text" name="userName" placeholder="Username for login" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Create password" required>
        </div>

        <div class="row">
            <div class="form-group">
                <label>Age</label>
                <input type="number" name="age" min="1">
            </div>

            <div class="form-group">
                <label>DOB</label>
                <input type="date" name="date">
            </div>
        </div>
        <button type="submit">Register</button>

    </form>
    <button class="btn-home" onclick="window.location.href='/user/display'">
          Back to User List
    </button>
</div>

</body>
</html>