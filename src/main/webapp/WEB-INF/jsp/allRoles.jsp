<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Roles</title>

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
            max-width: 800px;
            margin: 0 auto 10px;
            text-align: right;
        }

        .add-role-btn {
            padding: 8px 14px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
        }

        .add-role-btn:hover {
            background: #43a047;
        }

        .table-container {
            max-width: 800px;
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
            text-align: center;
            font-size: 14px;
        }

        th {
            background: #e6e6e6;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        .delete-btn {
            color: red;
        }

        .home-link {
            display: block;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<h2>All Registered Roles</h2>

<div class="top-bar">
    <a class="add-role-btn" href="/Role/addRole">Add Role</a>
</div>

<div class="table-container">

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="role" items="${roles}">
                <tr>
                    <td>${role.id}</td>
                    <td>${role.name}</td>
                    <td>
                        <a href="/Role/editRole?id=${role.id}">Edit</a> |
                        <a class="delete-btn"
                           href="/Role/deleteRole?id=${role.id}"
                           onclick="return confirm('Are you sure you want to delete this role?')">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a class="home-link" href="/">Home Page</a>

</div>

</body>
</html>
``