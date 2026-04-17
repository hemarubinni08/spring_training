<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: #ffffff;
            width: 380px;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 12px 25px rgba(0,0,0,0.3);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #185a9d;
        }
        .form-group {
            margin-bottom: 12px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 13px;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 13px;
        }
        .form-group input:focus,
        .form-group select:focus {
            border-color: #43cea2;
            outline: none;
        }
        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 18px;
        }
        .btn-group input {
            width: 48%;
            padding: 9px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            color: #fff;
            cursor: pointer;
        }
        .submit-btn {
            background-color: #43cea2;
        }
        .clear-btn {
            background-color: #ff5f6d;
        }
        .btn-group input:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>User Registration</h2>
    <form action="${pageContext.request.contextPath}/user/register" method="post">
        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" required>
        </div>
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="userName" required>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>
        <div class="form-group">
            <label>Phone Number</label>
            <input type="tel" name="phoneNo" required>
        </div>
        <div class="form-group">
            <label>Age</label>
            <input type="number" name="age" min="1" max="120" required>
        </div>
        <div class="form-group">
            <label>Role Name</label>
            <select name="role" required>
                <option value="">-- Select Role --</option>
                <c:forEach var="role" items="${roles}">
                    <option value="${role.name}">
                        ${role.name}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Roles</label>
            <select name="roles" multiple size="4" required>
                <c:forEach var="role" items="${roles}">
                    <option value="${role.name}">
                        ${role.name}
                    </option>
                </c:forEach>
            </select>
            <small>Hold Ctrl (Windows) / Cmd (Mac) to select multiple</small>
        </div>
        <div class="btn-group">
            <input type="submit" value="Register" class="submit-btn">
            <input type="reset" value="Clear" class="clear-btn">
        </div>
        <div class="back">
                <a href="${pageContext.request.contextPath}/user/getAllUsers">← Back to List</a>
            </div>
    </form>
</div>
</body>
</html>