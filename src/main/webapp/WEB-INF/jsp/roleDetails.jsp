<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Role Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #eeeeee;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        h2 {
            margin: 0;
            color: #2c3e50;
        }

        .button-group {
            display: flex;
            gap: 10px;
        }

        .btn {
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            display: inline-block;
            text-align: center;
            border: none;
            cursor: pointer;
        }

        .btn-home { background-color: #7f8c8d; color: white; }
        .btn-add { background-color: #2ecc71; color: white; }
        .btn-edit { background-color: #3498db; color: white; padding: 5px 10px; font-size: 12px; }
        .btn-delete { background-color: #e74c3c; color: white; padding: 5px 10px; font-size: 12px; }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            text-align: left;
            padding: 15px;
            border-bottom: 1px solid #eeeeee;
        }

        th {
            background-color: #f8f9fa;
            color: #2c3e50;
            text-transform: uppercase;
            font-size: 12px;
        }

        .role-id {
            color: #7f8c8d;
            font-family: monospace;
            font-weight: bold;
        }

        .role-name {
            font-weight: bold;
            color: #2c3e50;
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

<c:if test="${not empty message}">
    <div class="toast ${success ? 'success' : 'error'}">
        ${message}
    </div>
</c:if>

<div class="container">
    <div class="header">
        <h2>Role Directory</h2>
        <div class="button-group">
            <a href="/" class="btn btn-home">Home</a>
            <a href="/role/addRole" class="btn btn-add">+ New Role</a>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Role Identity</th>
                <th style="text-align: center;">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="role" items="${roles}">
                <tr>
                    <td class="role-id">#${role.id}</td>
                    <td class="role-name">${role.name}</td>
                    <td style="text-align: center;">
                        <a href="/role/profilePageRole?id=${role.id}" class="btn btn-edit">Modify</a>
                        <a href="/role/deletePageRole?id=${role.id}"
                           class="btn btn-delete"
                           onclick="return confirm('Delete role: ${role.name}?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty roles}">
        <div style="text-align: center; padding: 50px; color: #95a5a6;">
            <p style="font-size: 18px;">No system roles found.</p>
        </div>
    </c:if>
</div>

</body>
</html>