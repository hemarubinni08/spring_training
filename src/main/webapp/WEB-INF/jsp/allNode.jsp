<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Nodes</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #eef2f7;
            padding: 20px;
        }

        /* Header (title + add icon) */
        .header {
            width: 70%;
            margin: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        h2 {
            color: #2c3e50;
            margin: 0;
        }

        .add-icon {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #27ae60;
            color: #ffffff;
            font-size: 22px;
            font-weight: bold;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }

        .add-icon:hover {
            background-color: #1e8449;
        }

        table {
            width: 70%;
            margin: auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        th {
            background-color: #34495e;
            color: #ffffff;
            padding: 12px;
            text-align: left;
        }

        th.icon-header {
            text-align: center;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        td.icon-cell {
            text-align: center;
            vertical-align: middle;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f7ff;
        }

        .icon-link {
            text-decoration: none;
            font-size: 18px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

        .icon-link:hover {
            opacity: 0.7;
        }

        .edit-icon {
            color: #3498db;
        }

        .delete-icon {
            color: #e74c3c;
        }

        /* ✅ FOOTER HOME BUTTON */
        .footer-buttons {
            margin-top: 25px;
            text-align: center;
        }

        .home-btn {
            display: inline-block;
            padding: 10px 22px;
            background-color: #7f8c8d;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 600;
        }

        .home-btn:hover {
            background-color: #636e72;
        }
    </style>
</head>

<body>

<!-- HEADER WITH ADD ICON -->
<div class="header">
    <h2>All Nodes</h2>
    <a href="/node/addNode" class="add-icon" title="Add Node">+</a>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>Node Name</th>
        <th>Path</th>
        <th>Role</th>
        <th>Roles</th>
        <th class="icon-header">Update</th>
        <th class="icon-header">Delete</th>
    </tr>

    <c:forEach items="${node}" var="node">
        <tr>
            <td>${node.id}</td>
            <td>${node.name}</td>
            <td>${node.path}</td>
            <td>${node.role}</td>
            <td>${node.roles}</td>

            <td class="icon-cell">
                <a href="/node/update?id=${node.id}"
                   class="icon-link edit-icon"
                   title="Edit">
                    ✏️
                </a>
            </td>

            <td class="icon-cell">
                <a href="/node/deleteNode?id=${node.id}"
                   class="icon-link delete-icon"
                   title="Delete"
                   onclick="return confirm('Are you sure?');">
                    🗑️
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- ✅ HOME BUTTON -->
<div class="footer-buttons">
    <a href="http://localhost:8080/" class="home-btn">
        Home
    </a>
</div>

</body>
</html>
