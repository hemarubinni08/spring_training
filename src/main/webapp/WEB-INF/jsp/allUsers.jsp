<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>

    <style>
        /* ===== PAGE BACKGROUND ===== */
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(to right, #eef2f7, #d9e4f5);
            padding: 20px;
            min-height: 100vh;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        /* ===== TABLE STYLING ===== */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #34495e;
            color: #ffffff;
            padding: 12px;
            text-align: left;
            font-size: 14px;
        }

        td {
            padding: 10px;
            font-size: 13px;
            color: #2c3e50;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f7ff;
        }

        a {
            text-decoration: none;
            color: #2980b9;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
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

        .register-btn {
            background-color: #27ae60;
        }

        .register-btn:hover {
            background-color: #1e8449;
        }

        .footer-text {
            margin-top: 10px;
            font-size: 12px;
            color: #7f8c8d;
        }
    </style>
</head>

<body>

<h2>All Users</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Age</th>
        <th>Phone No</th>
        <th>Username</th>
        <th>Role</th>
        <th>Roles</th>
        <th>Delete</th>
    </tr>

    <c:forEach items="${user}" var="user">
        <tr>
            <td>
                <a href="/user/detail/by-idJpa/${user.id}">
                    ${user.id}
                </a>
            </td>

            <td>${user.name}</td>

            <td>
                <a href="/user/detail?email=${user.email}">
                    ${user.email}
                </a>
            </td>

            <td>${user.age}</td>
            <td>${user.phoneNo}</td>
            <td>${user.userName}</td>
            <td>${user.role}</td>
            <td>${user.roles}</td>

            <td>
                <a href="/user/deleteByEmailJpa/${user.email}"
                   title="Delete"
                   onclick="return confirm('Are you sure you want to delete this user?');">
                    🗑️
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- ✅ FOOTER WITH HOME + REGISTER -->
<div class="footer-buttons">
    <a href="/" class="home-btn">Home</a>
    <a href="/user/register" class="register-btn">New Register</a>

    <div class="footer-text">
        User Management System
    </div>
</div>

</body>
</html>
