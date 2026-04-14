<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User List</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f8;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .container {
            width: 85%;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.15);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f1f1f1;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        .delete-link {
            color: #dc3545;
            font-weight: bold;
        }

        .delete-link:hover {
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

<h2>List of Users</h2>

<div class="container">

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>IdJDBC</th>
            <th>Delete</th>
            <th>Phone No</th>
            <th>Role</th>
            <th>Roles</th>
            <th>IdJPA</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>

                <td>
                    <a href="/user/getprofile?email=${user.email}">
                        ${user.email}
                    </a>
                </td>

                <td>
                    <a href="/user/getprofileByIdJdbc/${user.id}">
                        ${user.id}
                    </a>
                </td>

                <td>
                    <a class="delete-link"
                       href="/user/deleteProfile/${user.email}"
                       onclick="return confirm('Are you sure you want to delete this user?');">
                        Delete
                    </a>
                </td>

                <td>${user.phoneNo}</td>
                <td>${user.role}</td>
                <td>${user.roles}</td>
                <td><a href="/user/getprofileById/{id}/${user.id}">
                                            ${user.id}
                                        </a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
<!-- ✅ FOOTER WITH HOME + REGISTER -->
<div class="footer-buttons">
    <a href="/" class="home-btn">Home</a>
    <a href="/user/register" class="register-btn">New Register</a>

    <div class="footer-text">
        User Management System
    </div>


</body>
</html>