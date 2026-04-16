<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Role</title>
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

        .subtitle {
            font-size: 14px;
            color: #7f8c8d;
            margin-top: 5px;
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

        .btn-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .btn {
            padding: 12px;
            border-radius: 4px;
            font-size: 15px;
            font-weight: bold;
            text-decoration: none;
            text-align: center;
            border: none;
            cursor: pointer;
        }

        .btn-add {
            background-color: #2ecc71;
            color: white;
        }

        .btn-add:hover {
            background-color: #27ae60;
        }

        .btn-cancel {
            background-color: #f8f9fa;
            color: #7f8c8d;
            border: 1px solid #ccc;
        }

        .btn-cancel:hover {
            background-color: #eeeeee;
        }

        /* Simplified Error Message */
        .error-msg {
            background-color: #fde8e8;
            color: #e74c3c;
            padding: 10px;
            border-radius: 4px;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2>Add System Role</h2>
        <p class="subtitle">Create a new access level</p>
    </div>

    <c:if test="${not empty toastMessage}">
        <div class="error-msg">
            ⚠ ${toastMessage}
        </div>
    </c:if>

    <form action="/role/addRole" method="POST">
        <div class="form-group">
            <label>Role Name</label>
            <input type="text" name="name" class="input-field" placeholder="e.g. Administrator" required autofocus>
        </div>

        <div class="btn-container">
            <button type="submit" class="btn btn-add">Register New Role</button>
            <a href="/role/getAllRole" class="btn btn-cancel">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>