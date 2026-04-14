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

        /* Header row (title + add button) */
        .header {
            width: 60%;
            margin: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        h2 {
            color: #2c3e50;
            margin: 0;
        }

        .add-btn {
            width: 32px;
            height: 32px;
            background-color: #27ae60;
            color: white;
            text-decoration: none;
            font-size: 22px;
            font-weight: bold;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }

        .add-btn:hover {
            background-color: #1e8449;
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
        .edit {
                    text-decoration: none;
                    font-size: 18px;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    cursor: pointer;
                }

                .edit:hover {
                    opacity: 0.7;
                }

                .edit {
                    color: #3498db;
                }
        /* ✅ FOOTER HOME BUTTON */
                .footer-buttons {
                    margin-top: 25px;
                    text-align: center;
                }

                .home-btn {
                    display: inline-block;
                    padding: 10px 22px;
                    background-color: #7f8c8d;
                    color: #ffffff;
                    text-decoration: none;
                    border-radius: 5px;
                    font-weight: 600;
                }

                .home-btn:hover {
                    background-color: #636e72;
                }
    </style>
</head>

<body>

<div class="header">
    <h2>All Roles JPA</h2>
    <a href="/role/addRoleJpa" class="add-btn" title="Add Role">+</a>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>Role Name</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>

    <c:forEach items="${role}" var="role">
        <tr>
            <td>${role.id}</td>
            <td>${role.name}</td>

            <td>
                <a class="edit" href="/role/update/by-idJpa/${role.id}">
                    ✏️
                </a>
            </td>

            <td>
                <a href="/role/deleteByIdJpa/${role.id}"
                   onclick="return confirm('Are you sure you want to delete this role?');"
                   title="Delete">
                    🗑️
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<!-- ✅ HOME BUTTON -->
<div class="footer-buttons">
    <a href="http://localhost:8080/" class="home-btn">
        Home
    </a>
</div>

</body>
</html>
