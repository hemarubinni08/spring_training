<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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

        .delete-jpa {
            background-color: #e74c3c;
            color: white;
            padding: 6px 12px;
            border-radius: 5px;
        }

        .delete-jdbc {
            background-color: #f39c12;
            color: white;
            padding: 6px 12px;
            border-radius: 5px;
        }

        .delete-jpa:hover {
            background-color: #c0392b;
        }

        .delete-jdbc:hover {
            background-color: #d68910;
        }

    </style>
</head>

<body>

<h2>All Users (JDBC)</h2>

<table>
    <tr>
        <th>ID(Jpa)</th>
        <th>Age</th>
        <th>Email</th>
        <th>Name</th>
        <th>Password</th>
        <th>Phone No</th>
        <th>Username</th>
        <th>Delete (JPA)</th>
    </tr>

    <c:forEach items="${user}" var="user">
        <tr>
            <td><a href="/user/detail/by-idJpa/${user.id}">${user.id}</td>
            <td>${user.age}</td>

            <td>
                <a href="/user/detail?email=${user.email}">
                    ${user.email}
                </a>
            </td>

            <td>${user.name}</td>
            <td>${user.password}</td>
            <td>${user.phoneNo}</td>
            <td>${user.userName}</td>

            <td>
                <a class="delete-jpa"
                   href="/user/deleteByEmailJpa/${user.email}">
                    DELETE
                </a>
            </td>

        </tr>
    </c:forEach>
</table>

</body>
</html>
``