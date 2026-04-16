<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Role - ${role.name}</title>
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

        .readonly-field {
            background-color: #f9f9f9;
            color: #999;
            cursor: not-allowed;
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

        .btn-save {
            background-color: #3498db;
            color: white;
        }

        .btn-save:hover {
            background-color: #2980b9;
        }

        .btn-cancel {
            background-color: #f8f9fa;
            color: #7f8c8d;
            border: 1px solid #ccc;
        }

        .btn-cancel:hover {
            background-color: #eeeeee;
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
        <h2>Modify Role</h2>
        <p class="subtitle">Update system access levels</p>
    </div>

    <c:if test="${not empty message}">
        <div class="toast ${success ? 'success' : 'error'}">
            ${message}
        </div>
    </c:if>

    <form action="/role/editRole" method="POST">
        <div class="form-group">
            <label>Role ID (Read-Only)</label>
            <input type="text" name="id" class="input-field readonly-field" value="${role.id}" readonly>
        </div>

        <div class="form-group">
            <label>Role Name</label>
            <input type="text" name="name" class="input-field" value="${role.name}" required>
        </div>

        <div class="btn-container">
            <button type="submit" class="btn btn-save">Commit Changes</button>
            <a href="/role/getAllRole" class="btn btn-cancel">Discard & Return</a>
        </div>
    </form>
</div>

</body>
</html>