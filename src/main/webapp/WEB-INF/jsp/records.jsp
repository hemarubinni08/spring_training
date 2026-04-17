<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Records</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f9;
            margin: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #2c3e50;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            text-decoration: none;
            color: #2980b9;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        .btn {
            padding: 6px 12px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 13px;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }

        .btn:hover {
            opacity: 0.85;
        }

        .action-cell {
            white-space: nowrap;
        }

        .home-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 26px;
            background-color: #3498db;
            color: white;
            font-size: 15px;
            font-weight: bold;
            border-radius: 6px;
            text-decoration: none;
        }

        .home-btn:hover {
            background-color: #2980b9;
        }

        .action-buttons {
            text-align: right;
        }
    </style>
</head>

<body>
<div class="action-buttons">
    <a href="/user/register" class="home-btn">Add User</a>
</div>
<h2>User Records</h2>

<table>
    <thead>
        <tr>
            <th>ID (JPA)</th>
            <th>ID (JDBC)</th>
            <th>Name</th>
            <th>Email (JPA)</th>
            <th>Email (JDBC)</th>
            <th>Phone</th>
            <th>User Name</th>
            <th>Age</th>
            <th>roles</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>
                    <a href="/user/getprofileId/${user.id}">${user.id}</a>
                </td>

                <td>
                    <a href="/user/getprofileIdJdbc/${user.id}">${user.id}</a>
                </td>

                <td>${user.name}</td>

                <td class="action-cell">
                    <a href="/user/getprofile?email=${user.email}">
                        ${user.email}
                    </a>
                    <br/>
                    <a href="/user/deleteemail/${user.email}">
                        <button class="btn btn-delete">Delete</button>
                    </a>
                </td>

                <td class="action-cell">
                    <a href="/user/getprofile/${user.email}">
                        ${user.email}
                    </a>
                    <br/>
                    <a href="/user/deleteemail/${user.email}">
                        <button class="btn btn-delete">Delete</button>
                    </a>
                </td>

                <td>${user.phoneNo}</td>
                <td>${user.userName}</td>
                <td>${user.age}</td>
                <td>${user.roles}</td>

                <td>
                    <fmt:formatDate value="${user.dateOfBirth}" pattern="dd-MM-yyyy" />
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="action-buttons">
    <a href="/" class="home-btn">Home</a>
</div>

</body>
</html>