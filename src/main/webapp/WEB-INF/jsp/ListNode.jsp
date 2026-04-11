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

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
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

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f7ff;
        }

        .btn {
            padding: 5px 12px;
            border-radius: 4px;
            color: white;
            text-decoration: none;
            font-size: 13px;
        }

        .edit {
            background-color: #3498db;
        }

        .delete {
            background-color: #e74c3c;
        }

        .delete:hover {
            background-color: #c0392b;
        }

        .edit:hover {
            background-color: #2c80b4;
        }
    </style>
</head>

<body>

<h2>All Nodes</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Node Name</th>
        <th>Path</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>

    <c:forEach items="${node}" var="node">
        <tr>
            <td>${node.id}</td>
            <td>${node.name}</td>
            <td>${node.path}</td>

            <td>
                <a class="btn edit" href="/node/update?id=${node.id}">Edit</a>
            </td>

            <td>
                <a class="btn delete"
                   href="/node/deleteNode?id=${node.id}"
                   onclick="return confirm('Are you sure?');">
                    Delete
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>