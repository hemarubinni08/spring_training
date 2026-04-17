<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>List All Roles</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
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
            background: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:hover {
            background: #f1f1f1;
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
        .delete:hover,
        .edit:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>List of Roles</h2>
<div class="top-actions">
    <a class="add-btn" href="${pageContext.request.contextPath}/role/addRole">
        + Add Role
    </a>
      <a class="back-btn" href="/">← Back</a>
</div>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Role Name</th>
            <th>Edit</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="role" items="${roles}">
            <tr>
                <td>${role.id}</td>
                <td>${role.name}</td>
                <td>
                    <a class="edit"
                       href="${pageContext.request.contextPath}/role/edit/${role.id}">
                        Edit
                    </a>
                </td>
                <td>
                    <a class="delete"
                       href="${pageContext.request.contextPath}/role/delete/${role.id}"
                       onclick="return confirm('Are you sure you want to delete this role?')">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>