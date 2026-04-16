<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Node Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 1100px;
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
            vertical-align: middle;
        }

        th {
            background-color: #f8f9fa;
            color: #2c3e50;
            text-transform: uppercase;
            font-size: 12px;
        }

        .node-id {
            color: #7f8c8d;
            font-family: monospace;
            font-weight: bold;
        }

        .node-name {
            font-weight: bold;
            color: #2c3e50;
        }

        .path-text {
            font-family: 'Courier New', monospace;
            background: #f1f1f1;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 13px;
        }

        .role-tag {
            display: inline-block;
            background-color: #ebf5fb;
            color: #2980b9;
            padding: 2px 8px;
            border-radius: 12px;
            font-size: 11px;
            margin-right: 4px;
            margin-bottom: 4px;
            border: 1px solid #d4e6f1;
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
        <h2>System Node Directory</h2>
        <div class="button-group">
            <a href="/" class="btn btn-home">Home</a>
            <a href="/node/addNode" class="btn btn-add">+ New Node</a>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th style="width: 80px;">UID</th>
                <th>Node Name</th>
                <th>System Path</th>
                <th>Access Roles</th>
                <th style="text-align: center;">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="n" items="${node}">
                <tr>
                    <td class="node-id">#${n.id}</td>
                    <td class="node-name">${n.name}</td>
                    <td><span class="path-text">${n.path}</span></td>
                    <td>
                        <c:forEach var="role" items="${n.roles}">
                            <span class="role-tag">${role}</span>
                        </c:forEach>
                        <c:if test="${empty n.roles}">
                            <span style="color: #ccc; font-style: italic; font-size: 12px;">Public Access</span>
                        </c:if>
                    </td>
                    <td style="text-align: center;">
                        <div class="button-group" style="justify-content: center;">
                            <a href="/node/profileNode?id=${n.id}" class="btn btn-edit">Modify</a>
                            <a href="/node/deleteNode?id=${n.id}"
                               class="btn btn-delete"
                               onclick="return confirm('Permanently remove node: ${n.name}?');">Remove</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty node}">
        <div style="text-align: center; padding: 50px; color: #95a5a6;">
            <p style="font-size: 18px;">No system nodes registered.</p>
            <p style="font-size: 14px;">Add a node to begin managing resource paths.</p>
        </div>
    </c:if>
</div>

</body>
</html>