<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Roles</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .container {
            width: 70%;
            margin: auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 2px 6px rgba(0,0,0,0.15);
        }

        .header-actions {
            text-align: right;
            margin-bottom: 15px;
        }

        .add-btn {
            text-decoration: none;
            background-color: #28a745;
            color: white;
            padding: 8px 14px;
            border-radius: 5px;
            font-weight: bold;
        }

        .add-btn:hover {
            background-color: #218838;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 10px 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f1f1f1;
            color: #333;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .action-link {
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 14px;
            margin-right: 6px;
        }

        .update-btn {
            background-color: #007bff;
            color: white;
        }

        .update-btn:hover {
            background-color: #0056b3;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        .no-data {
            text-align: center;
            color: #777;
            font-size: 16px;
        }
        /* ===== FOOTER BUTTONS ===== */
                        .footer-buttons {
                            margin-top: 30px;
                            text-align: center;
                        }

                        .footer-buttons a {
                            display: inline-block;
                            padding: 10px 22px;
                            margin: 0 8px;
                            border-radius: 5px;
                            font-size: 14px;
                            font-weight: 600;
                            color: #ffffff;
                            text-decoration: none;
                        }

                        .home-btn {
                            background-color: #7f8c8d;
                        }

                        .home-btn:hover {
                            background-color: #636e72;
                        }
                        .footer-text {
                                            margin-top: 10px;
                                            font-size: 12px;
                                            color: #7f8c8d;
                                        }
    </style>
</head>

<body>

<h2>All Roles</h2>

<div class="container">

    <div class="header-actions">
        <a href="/role/addRole" class="add-btn">+ Add Role</a>
    </div>

    <c:if test="${empty roles}">
        <p class="no-data">No roles found.</p>
    </c:if>

    <c:if test="${not empty roles}">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Role Name</th>
                <th>Actions</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="role" items="${roles}">
                <tr>
                    <td>${role.id}</td>
                    <td>${role.name}</td>
                    <td>
                        <a href="/role/getRole?id=${role.id}"
                           class="action-link update-btn">
                            Update
                        </a>

                        <a href="/role/deleteRole?id=${role.id}"
                           class="action-link delete-btn"
                           onclick="return confirm('Are you sure you want to delete this role?');">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

</div>
<!-- ✅ FOOTER WITH HOME + REGISTER -->
<div class="footer-buttons">
    <a href="/" class="home-btn">Home</a>


    <div class="footer-text">
        User Management System
    </div>
</div>

</body>
</html>