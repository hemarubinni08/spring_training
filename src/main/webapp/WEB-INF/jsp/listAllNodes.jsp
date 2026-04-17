<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>List All Nodes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .top-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin: 15px 40px;
        }
        .top-actions a {
            padding: 8px 14px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            text-decoration: none;
        }
        .add-btn {
            background-color: #28a745;
        }
        .back-btn {
            background-color: #6c757d;
        }
        .add-btn:hover {
            background-color: #218838;
        }
        .back-btn:hover {
            background-color: #5a6268;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: left;
        }
        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            text-decoration: none;
            font-weight: bold;
        }
        .edit {
            color: #007bff;
        }
        .delete {
            color: red;
        }
        .edit:hover,
        .delete:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>List of Nodes</h2>
<div class="top-actions">
    <a href="${pageContext.request.contextPath}/node/addNode" class="add-btn">
        + Add Node
    </a>
       <a href="/" class="back-btn">← Back</a>
</div>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Node Name</th>
            <th>Node Path</th>
            <th>Node Role</th>
            <th>Node Roles</th>
            <th>Edit</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="node" items="${nodes}">
            <tr>
                <td>${node.id}</td>
                <td>${node.name}</td>
                <td>${node.path}</td>
                <td>${node.role}</td>
                <td>${node.roles}</td>
                <td>
                    <a class="edit"
                       href="${pageContext.request.contextPath}/node/edit/${node.id}">
                        Edit
                    </a>
                </td>
                <td>
                    <a class="delete"
                       href="${pageContext.request.contextPath}/node/delete/${node.id}"
                       onclick="return confirm('Are you sure you want to delete this node?')">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>