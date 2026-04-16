<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Nodes</title>

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

        /* Header */
        th {
            background-color: #2c3e50;
            color: white;
            padding: 12px;
            font-size: 14px;
        }

        /* Body */
        td {
            padding: 12px;
            text-align: center;
            color: #333;
        }

        /* Rows */
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

        .add-btn {
            background-color: #34495e;
        }

        .footer-buttons a:hover {
            opacity: 0.9;
        }
    </style>
</head>

<body>

<h2>Node List</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Path</th>
        <th>Role</th>
        <th>Roles</th>
        <th>Action</th>
    </tr>

    <c:forEach var="node" items="${nodes}">
        <tr>
            <td>${node.id}</td>

            <td>${node.name}</td>

            <td>${node.path}</td>

            <td>${node.role}</td>

            <td>${node.roles}</td>

            <td>
                <a class="delete-link" href="/node/delete?id=${node.id}">
                    Delete
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- FOOTER BUTTONS -->
<div class="footer-buttons">
    <a href="/" class="home-btn">Home</a>
    <a href="/node/add" class="add-btn">Add Node</a>
</div>

</body>
</html>