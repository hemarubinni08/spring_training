<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Display Roles</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f9;
            padding: 30px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-size: 28px;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #667eea;
            color: white;
            padding: 12px;
            font-size: 16px;
        }

        td {
            padding: 12px;
            text-align: center;
            font-size: 15px;
            color: #333;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #eef2ff;
        }

        a {
            text-decoration: none;
        }

        .delete-btn {
            background-color: #e74c3c;
            color: white;
            padding: 6px 14px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: bold;
        }

        .delete-btn:hover {
            background-color: #c0392b;
        }

        .action-buttons {
            text-align: right;
            margin-top: 30px;
        }

        .home-btn {
            display: inline-block;
            background-color: #3498db;
            color: white;
            margin-right: 20px;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 15px;
            font-weight: bold;
        }

        .home-btn:hover {
            background-color: #2980b9;
        }

        .add-btn {
            display: inline-block;
            background-color: #1abc9c;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 15px;
            font-weight: bold;
            margin-left: 10px;
        }

        .add-btn:hover {
            background-color: #16a085;
        }
    </style>
</head>

<body>

<h2>Roles List</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Role</th>
        <th>Delete</th>
    </tr>

    <c:forEach var="role" items="${roleDto}">
        <tr>
            <td>
                <a href="/role/getRoleDetails/${role.id}">
                    ${role.id}
                </a>
            </td>
            <td>${role.name}</td>
            <td>
                <a href="${pageContext.request.contextPath}/role/deleteRoleJpa?id=${role.id}" class="delete-btn">
                    Delete
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

<br>

<a href="${pageContext.request.contextPath}/role/addrolejpa" class="add-btn">
    Add New Role
</a>

<br><br>

<div class="action-buttons">
    <a href="/" class="home-btn">
       Home
    </a>
</div>

</body>
</html>