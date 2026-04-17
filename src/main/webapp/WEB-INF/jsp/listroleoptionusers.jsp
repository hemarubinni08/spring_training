<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>List Roles</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f5f5f5;
            padding: 30px;
        }

        h2 {
            color: #333;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px 14px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        th {
            background-color: #f0f0f0;
            font-weight: bold;
            color: #333;
        }

        tr:hover {
            background-color: #fafafa;
        }

        .action-links a {
            display: inline-block;
            margin-right: 12px;
            text-decoration: none;
            color: #007bff;
            font-size: 13px;
        }

        .action-links a:hover {
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
    </style>
</head>

<body>

<h2>All Roles (JPA / JDBC)</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Delete</th>
        <th>Update</th>
    </tr>

    <c:forEach var="role" items="${roles}">
        <tr>
            <td>${role.id}</td>
            <td>${role.name}</td>


            <td class="action-links">
                <a href="/userrole/deletebyname/${role.id}">Delete (JPA)</a>
                <a href="/userrole/deletebyid/${role.id}">Delete (JDBC)</a>
            </td>


            <td class="action-links">
                <a href="/userrole/update/${role.id}">Update (JPA)</a>
                <a href="/userrole/updatejdbc/${role.id}">Update (JDBC)</a>
            </td>
        </tr>
    </c:forEach>

</table>

<div class="addButton">
   <a href="/userrole/addrole" class="btn-blue">Add Role</a>
</div>

</body>
</html>