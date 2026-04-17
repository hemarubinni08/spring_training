<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            background: linear-gradient(to right, #eef2f3, #dfe9f3);
        }

        .main {
            width: 100%;
        }

        .header {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            padding: 18px 25px;
            color: white;
            font-size: 22px;
            font-weight: bold;
            box-shadow: 0px 3px 8px rgba(0,0,0,0.2);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .back-btn {
            background: white;
            color: #4facfe;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 13px;
        }

        .back-btn:hover {
            background: #e6f0ff;
        }

        .content {
            padding: 30px;
        }

        .container {
            width: 340px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 15px;
            color: #333;
            font-size: 20px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-top: 10px;
            font-size: 13px;
        }

        input, select {
            width: 100%;
            padding: 7px;
            margin-top: 4px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 13px;
        }

        input:focus, select:focus {
            border-color: #4facfe;
            outline: none;
        }

        .btn-group {
            margin-top: 15px;
            text-align: center;
        }

        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 4px;
            font-weight: bold;
            font-size: 13px;
        }

        .submit-btn {
            background: linear-gradient(to right, #28a745, #5cd65c);
            color: white;
        }

        .reset-btn {
            background: linear-gradient(to right, #dc3545, #ff6b6b);
            color: white;
        }

        .message-box {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 8px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 13px;
        }
    </style>

</head>
<body>

<div class="main">

    <div class="header">
        Registration
        <button class="back-btn" onclick="window.location.href='/user/users'">← Back</button>
    </div>

    <div class="content">
        <div class="container">

            <h2>Create Account</h2>

            <c:if test="${not empty message}">
                <div class="message-box">${message}</div>
            </c:if>

            <form action="/user/register" method="post" modelAttribute="userDto">

                <label>Name:</label>
                <input type="text" name="name">

                <label>Username:</label>
                <input type="text" name="userName">

                <label>Email:</label>
                <input type="email" name="email">

                <label>Phone No:</label>
                <input type="text" name="phoneNo">

                <label>Password:</label>
                <input type="password" name="password">

                <label>Age:</label>
                <input type="number" name="age">

                <label>Role:</label>
                <select name="role" required>
                    <option value="">-- Select Role --</option>
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.name}">${role.name}</option>
                    </c:forEach>
                </select>

                <label>Roles:</label>
                <select name="roles" multiple required style="height:90px;">
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.name}">
                            ${role.name}
                        </option>
                    </c:forEach>
                </select>

                <div class="btn-group">
                    <input type="submit" value="Register" class="btn submit-btn">
                    <input type="reset" value="Clear" class="btn reset-btn">
                </div>

            </form>

        </div>
    </div>

</div>

</body>
</html>