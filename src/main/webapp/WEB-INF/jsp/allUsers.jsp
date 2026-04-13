<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Users JDBC</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #eef2f7;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

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

        .delete-icon {
            font-size: 18px;
        }
    </style>
</head>

<body>

<h2>All Users</h2>

<table>
    <tr>
        <th>ID (JPA)</th>
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

</body>
</html>
``