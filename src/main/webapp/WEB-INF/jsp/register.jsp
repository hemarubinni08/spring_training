<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header {
            border-bottom: 2px solid #eeeeee;
            padding-bottom: 15px;
            margin-bottom: 20px;
            text-align: center;
        }

        h2 {
            margin: 0;
            color: #2c3e50;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 14px;
            color: #555;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .role-selector {
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 10px;
            max-height: 120px;
            overflow-y: auto;
            background: #fafafa;
        }

        .role-option {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
        }

        .role-option input {
            width: auto;
            margin-right: 10px;
        }

        .btn-submit {
            width: 100%;
            background-color: #2ecc71;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background-color: #27ae60;
        }

        .footer-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #3498db;
            font-size: 14px;
        }

        .toast {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            color: white;
            font-weight: bold;
            text-align: center;
        }
        .success { background-color: #2ecc71; border: 1px solid #27ae60; }
        .error { background-color: #e74c3c; border: 1px solid #c0392b; }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2>Create New User</h2>
    </div>

    <c:if test="${not empty message}">
        <div class="toast ${success ? 'success' : 'error'}">
            ${message}
        </div>
    </c:if>

    <form action="/user/register" method="POST">
        <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="name" required>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <input type="email" name="email" required>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <input type="tel" name="phoneNo" required>
        </div>

        <div class="form-group" style="display: flex; gap: 15px;">
            <div style="flex: 1;">
                <label>Birth Date</label>
                <input type="date" name="dateOfBirth" required>
            </div>
            <div style="flex: 1;">
                <label>Age</label>
                <input type="number" name="age" min="1" required>
            </div>
        </div>

        <div class="form-group">
            <label>Primary Role</label>
            <select name="role" required>
                <option value="" disabled selected>Select primary role</option>
                <c:forEach var="role" items="${roles}">
                    <option value="${role.name}">${role.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Additional Access Roles</label>
            <div class="role-selector">
                <c:forEach var="r" items="${roles}">
                    <label class="role-option">
                        <input type="checkbox" name="roles" value="${r.name}"> ${r.name}
                    </label>
                </c:forEach>
            </div>
        </div>

        <div class="form-group">
            <label>Username</label>
            <input type="text" name="userName" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <button type="submit" class="btn-submit">Register User</button>
    </form>

    <a href="/user/getAllUsers" class="footer-link">Back</a>
</div>

</body>
</html>