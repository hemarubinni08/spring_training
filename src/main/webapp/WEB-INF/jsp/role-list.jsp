<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Roles</title>

    <style>
        /* ===== PAGE BASE ===== */
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #eef2f7;
            padding: 30px 0;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        /* ===== TABLE ===== */
        table {
            width: 75%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            border: 1px solid #ddd;
        }

        th {
            background-color: #2c3e50;
            color: white;
            padding: 12px;
            font-size: 14px;
        }

        td {
            padding: 12px;
            text-align: center;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e6edf5;
        }

        /* ===== LINKS ===== */
        a {
            color: #2c3e50;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            color: #34495e;
            text-decoration: underline;
        }

        .delete-link {
            color: #dc3545;
        }

        .delete-link:hover {
            color: #a71d2a;
        }

        .edit-link {
            color: #2c3e50;
        }

        /* ===== FOOTER BUTTONS ===== */
        .footer-buttons {
            width: 75%;
            margin: 30px auto 0 auto;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .footer-buttons a {
            padding: 12px 24px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            text-decoration: none;
        }

        .home-btn {
            background-color: #2c3e50;
        }

        .home-btn:hover {
            background-color: #34495e;
        }

        .add-role-btn {
            background-color: #34495e;
        }

        .add-role-btn:hover {
            background-color: #1f2a33;
        }
    </style>
</head>

<body>

<h2>Role List</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Role Name</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>

    <c:forEach var="role" items="${roles}">
        <tr>
            <td>${role.id}</td>
            <td>${role.name}</td>

            <td>
                <a class="delete-link"
                   href="/role/delete/${role.id}"
                   onclick="return confirm('Are you sure to delete this role?');">
                    Delete
                </a>
            </td>

            <td>
                <a class="edit-link" href="/role/edit/${role.id}">
                    Edit
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- FOOTER -->
<div class="footer-buttons">

    <!-- HOME -->
    <a href="${pageContext.request.contextPath}/" class="home-btn">
        Home
    </a>

    <!-- ADD ROLE (replaces add-node) -->
    <a href="${pageContext.request.contextPath}/role/addRole" class="add-role-btn">
        Add Role
    </a>

</div>

</body>
</html>