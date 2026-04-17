<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Role</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #eef2f3, #dfe9f3);
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

        .content {
            padding: 30px;
        }

        .container {
            width: 320px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 15px;
        }

        .message-success {
            text-align: center;
            font-weight: bold;
            color: green;
            margin-bottom: 10px;
            font-size: 13px;
        }

        .message-error {
            text-align: center;
            font-weight: bold;
            color: red;
            margin-bottom: 10px;
            font-size: 13px;
        }

        label {
            font-weight: 600;
            font-size: 13px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 13px;
        }

        .btn-group {
            text-align: center;
            margin-top: 15px;
        }

        .btn {
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
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
    </style>
</head>

<body>

<div class="header">
    Add Role
    <button class="back-btn" onclick="window.location.href='/role/roles'">← Back</button>
</div>

<div class="content">

    <div class="container">
        <h2>Create Role</h2>

        <c:if test="${not empty message}">
            <c:choose>
                <c:when test="${message eq 'Role already exists'}">
                    <div class="message-error">${message}</div>
                </c:when>
                <c:otherwise>
                    <div class="message-success">${message}</div>
                </c:otherwise>
            </c:choose>
        </c:if>

        <form action="/role/addRole" method="post">
            <label>Role Name</label>
            <input type="text" name="name" placeholder="Enter role name" required>

            <div class="btn-group">
                <input type="submit" value="Add Role" class="btn submit-btn">
                <input type="reset" value="Clear" class="btn reset-btn">
            </div>
        </form>
    </div>

</div>

</body>
</html>