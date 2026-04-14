<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Roles</title>

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
            width: 60%;
            margin: auto;
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

        .delete {
            background-color: #e74c3c;
            color: white;
            padding: 6px 12px;
            border-radius: 5px;
        }

        .delete:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

<h2>All Roles Jdbc</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Role Name</th>
        <th>UPDATE</th>
        <th>Delete</th>
    </tr>

    <c:forEach items="${role}" var="role">
        <tr>
            <td>${role.id}</td>
            <td>${role.name}</td>
             <td>
                 <a class="delete" href="/role/update/by-idJdbc/${role.id}">
                      Edit
                 </a>
              </td>
            <td>
                <a class="delete" href="/role/deleteByIdJdbc/${role.id}">
                    🗑️
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>