<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>List Users</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f8;
            padding: 30px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background-color: #ffffff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 10px;
            text-align: left;
        }

        th {
            background-color: #1976d2;
            color: #ffffff;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #eef3f8;
        }

        td a {
            color: #1976d2;
            text-decoration: none;
            margin-right: 10px;
            font-weight: 500;
        }

        td a:hover {
            text-decoration: underline;
        }

        .addButton {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .btn-blue {
            background-color: #007bff;
            color: white;
            padding: 10px 24px;
            text-decoration: none;
            font-size: 15px;
            border-radius: 4px;
            border: none;
        }

        .btn-blue:hover {
            background-color: #0056b3;
        }

        .btn-green {
            background-color: green;
            color: white;
            padding: 10px 24px;
            text-decoration: none;
            font-size: 15px;
            border-radius: 4px;
            border: none;
        }

        .btn-green:hover {
            background-color: #00B31E;
        }

        .btn-red {
             background-color: red;
             color: white;
             padding: 10px 24px;
             text-decoration: none;
             font-size: 15px;
             border-radius: 4px;
             border: none;
        }

        .btn-red:hover {
             background-color: #B31E00;
        }
    </style>

</head>

<body>

<h2>All Users Using JPA</h2>

<table>

    <tr>

        <th>ID</th>
        <th>Name</th>
        <th>Email(JDBC & Path Variable)</th>
        <th>Email(JPA & Path Variable)</th>
        <th>Phone</th>
        <th>Username</th>
        <th>Age</th>
        <th>Roles</th>
        <th>Update</th>
        <th>Delete</th>

    </tr>

<c:forEach var="user" items="${users}">

    <tr>

        <td><a href="/user/profilebyid/${user.id}">${user.id}</a></td>
        <td>${user.name}</td>
        <td><a href="/user/getuserprofile/${user.email}">${user.email}</a></td>
        <td><a href="/user/getuserprofileusingjpa/${user.email}">${user.email}</a></td>
        <td>${user.phoneNo}</td>
        <td>${user.userName}</td>
        <td>${user.age}</td>
        <td>${user.roles}</td>
        <td><a href="/user/update/${user.id}" class="btn-green">Update</a></td>
        <td><a href="/user/deletebyemail/${user.email}" class="btn-red">Delete</a></td>

    </tr>

</c:forEach>

</table>

<div class="addButton">
   <a href="/user/register" class="btn-blue">Add User</a>
</div>

</body>

</html>