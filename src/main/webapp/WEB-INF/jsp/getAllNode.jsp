<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>All Nodes</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .top-bar {
            max-width: 900px;
            margin: 0 auto 10px;
            text-align: right;
        }

        .add-node-btn {
            padding: 8px 14px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
        }

        .add-node-btn:hover {
            background: #43a047;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 0 5px rgba(0,0,0,0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            font-size: 14px;
            text-align: left;
        }

        th {
            background: #e6e6e6;
            text-align: center;
        }

        td {
            text-align: center;
        }

        .path {
            font-family: monospace;
        }

        .empty {
            text-align: center;
            color: #777;
        }

        a {
            text-decoration: none;
            font-weight: 500;
        }

        .edit-btn {
            color: #007bff;
        }

        .edit-btn:hover {
            color: #007bff;
            text-decoration: underline;
        }

        .delete-btn {
            color: #ff4d4d;

        }

        .delete-btn:hover {
            color:red;
            text-decoration: underline;
        }

        .home-link {
            display: block;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<div class="top-bar">
    <a href="/node/addNode" class="add-node-btn">
        + Add Node
    </a>
</div>

<div class="container">
    <h2>All Nodes</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Node</th>
                <th>Path</th>
                <th>Roles</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>

            <c:if test="${empty node}">
                <tr>
                    <td colspan="5" class="empty">No nodes found</td>
                </tr>
            </c:if>

            <c:forEach items="${node}" var="node">
                <tr>
                    <td>${node.id}</td>
                    <td>${node.name}</td>
                    <td class="path">${node.path}</td>

                    <td>
                        <c:if test="${not empty node.roles}">
                            <c:forEach var="role" items="${node.roles}" varStatus="status">
                                ${role}
                                <c:if test="${!status.last}">, </c:if>
                            </c:forEach>
                        </c:if>
                    </td>

                    <td>
                        <a class="edit-btn" href="/node/editNode?id=${node.id}">
                            Edit
                        </a>
                        |
                        <a class="delete-btn"
                           href="/node/deleteNode?id=${node.id}"
                           onclick="return confirm('Are you sure you want to delete this node?');">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>

        </tbody>
    </table>

    <div class="home-link">
        <a href="/">Home Page</a>
    </div>
</div>

</body>
</html>