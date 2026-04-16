<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Users</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-transform: uppercase;
            font-size: 14px;
        }

        td {
            padding: 12px;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e9f5ff;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .delete-link {
            color: #dc3545;
        }

        .delete-link:hover {
            color: #a71d2a;
        }
    </style>
</head>

<body>

<h2>User List</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Action</th>
    </tr>

    <c:forEach var="user" items="${users}">
        <tr>
            <td>
                <a href="/user/profileJdbcId?id=${user.id}">
                    ${user.id}
                </a>
            </td>

            <td>${user.name}</td>

            <td>
                <a href="/user/profileJdbcEmail?email=${user.email}">
                    ${user.email}
                </a>
            </td>

            <td>
                <a class="delete-link" href="/user/delete?email=${user.email}">
                    Delete
                </a>
            </td>
        </tr>
    </c:forEach>

</table>

</body>
</html>