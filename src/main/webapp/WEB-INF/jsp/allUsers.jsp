<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>

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
            max-width: 1000px;
            margin: 0 auto 10px;
            text-align: right;
        }

        .add-user-btn {
            padding: 8px 14px;
            background: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
        }

        .add-user-btn:hover {
            background: #43a047;
        }

        .table-container {
            max-width: 1000px;
            margin: auto;
            background: #fff;
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
            text-align: center;
        }

        th {
            background: #e6e6e6;
        }

        a {
            text-decoration: none;
            font-weight: 500;
        }

        .edit-btn {
            color: #007bff;
        }

        .delete-btn {
            color: red;
        }

        a:hover {
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

<h2>All Registered Users</h2>

<div class="top-bar">
    <a href="/user/register" class="add-user-btn">+ Add User</a>
</div>

<div class="table-container">

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Phone</th>
                <th>DOB</th>
                <th>Roles</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.userName}</td>
                    <td>${user.phoneNo}</td>
                    <td>${user.dateOfBirth}</td>

                    <td>
                        <c:if test="${not empty user.roles}">
                            <c:forEach var="role" items="${user.roles}" varStatus="status">
                                ${role}<c:if test="${!status.last}">,</c:if>
                            </c:forEach>
                        </c:if>
                    </td>

                    <td>
                        <a class="edit-btn" href="/user/editUser/${user.id}">Edit</a>
                        <a class="delete-btn"
                           href="/user/deleteProfile?id=${user.id}"
                           onclick="return confirm('Are you sure you want to delete this user?');">
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
