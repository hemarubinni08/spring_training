<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Roles</title>
 <style>
     body {
         font-family: "Segoe UI", Arial, sans-serif;
         background-color: #f0f4f8;
         margin: 0;
         padding: 0;
     }
     h2 {
         text-align: center;
         margin: 30px 0;
         color: #0d47a1;
     }
     table {
         width: 60%;
         margin: auto;
         border-collapse: collapse;
         background-color: #ffffff;
         border-radius: 10px;
         overflow: hidden;
         box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
     }
     thead {
         background-color: #1e88e5;
         color: #ffffff;
     }
     th, td {
         padding: 12px 15px;
         text-align: center;
         border-bottom: 1px solid #dce3ea;
     }
     th {
         text-transform: uppercase;
         font-size: 14px;
     }
     tbody tr:nth-child(even) {
         background-color: #f5f9ff;
     }
     tbody tr:hover {
         background-color: #e3f2fd;
     }
     td {
         font-size: 14px;
         color: #333;
     }
     .btn-delete {
         color: white;
         background-color: red;
         padding: 5px 10px;
         border-radius: 5px;
         text-decoration: none;
     }
     .btn-delete:hover {
         background-color: darkred;
     }
     .btn-edit {
         color: white;
         background-color: #4a3aff;
         padding: 5px 10px;
         border-radius: 5px;
         text-decoration: none;
     }
     .btn-edit:hover {
         background-color: #372bdb;
     }
 </style>
</head>
<body>
<h2>All Roles (JDBC)</h2>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Role Name</th>
            <th>Delete</th>
            <th>Edit</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="role" items="${roles}">
            <tr>
                <td>${role.id}</td>
                <td>${role.name}</td>
                <td>
                    <a href="/role/delete-jdbc/${role.id}"
                       class="btn-delete"
                       onclick="return confirm('Are you sure to delete this role?');">
                        Delete
                    </a>
                </td>
                <td>
                    <a href="/role/edit-jdbc/${role.id}" class="btn-edit">
                        Edit
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>