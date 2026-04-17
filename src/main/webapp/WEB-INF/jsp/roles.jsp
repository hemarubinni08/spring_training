<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Roles List</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #eef2f3, #dfe9f3);
        }

        .header {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            padding: 18px 25px;
            color: white;
            font-size: 22px;
            font-weight: bold;
            box-shadow: 0px 3px 8px rgba(0,0,0,0.2);
        }

        .top-bar {
            padding: 15px 25px;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn {
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            font-size: 13px;
        }

        .back-btn {
            background: white;
            color: #4facfe;
        }

        .add-btn {
            background: linear-gradient(to right, #28a745, #5cd65c);
            color: white;
        }

        .content {
            padding: 0 25px 25px 25px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 15px;
        }

        .table-container {
            width: 100%;
            overflow-x: auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        table {
            min-width: 700px;
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px 12px;
            border: 1px solid #ddd;
            text-align: center;
            font-size: 13px;
            white-space: nowrap;
        }

        th {
            background: linear-gradient(to right, #007bff, #00c6ff);
            color: white;
            position: sticky;
            top: 0;
        }

        tr:nth-child(even) {
            background-color: #f7f9fc;
        }

        tr:hover {
            background-color: #e9f2ff;
        }

        a {
            text-decoration: none;
            font-weight: 500;
        }

        .edit-link {
            color: #ffc107;
            font-weight: bold;
        }

        .delete-link {
            color: #dc3545;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="header">
    Roles List
</div>

<div class="top-bar">
    <button class="btn add-btn" onclick="window.location.href='/role/addRole'">+ Add Role</button>
    <button class="btn back-btn" onclick="window.location.href='/'">← Back</button>
</div>

<div class="content">

    <h2>All Roles</h2>

    <div class="table-container">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <c:forEach var="role" items="${roles}">
                <tr>
                    <td>
                        <a href="/role/getRoleById?id=${role.id}">
                            ${role.id}
                        </a>
                    </td>

                    <td>${role.name}</td>

                    <td>
                        <a class="edit-link"
                           href="/role/getRoleById?id=${role.id}">
                           Edit
                        </a>
                    </td>

                    <td>
                        <a class="delete-link"
                           href="/role/deleteRole/${role.id}"
                           onclick="return confirm('Delete this role?')">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>

</div>

</body>
</html>