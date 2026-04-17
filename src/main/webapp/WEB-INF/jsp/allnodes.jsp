<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nodes List</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            min-height: 100vh;
            background: radial-gradient(
                circle,
                #ffffff 0%,
                #b8b4ff 35%,
                #1900c1 100%
            );
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 40px;
        }

        .card {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            display: inline-block;
            max-width: 95%;
            overflow-x: auto;
        }

        h2 {
            margin-bottom: 15px;
            color: #1900c1;
            text-align: center;
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .home-btn,
        .add-btn {
            padding: 8px 18px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
        }

        .home-btn {
            background-color: #1900c1;
            color: #ffffff;
        }

        .home-btn:hover {
            background-color: #12008f;
        }

        .add-btn {
            background-color: #fbc02d;
            color: #000000;
        }

        .add-btn:hover {
            background-color: #f9a825;
        }

        table {
            width: auto;
            min-width: 700px;
            border-collapse: collapse;
        }

        thead {
            background-color: #1900c1;
            color: #ffffff;
        }

        th,
        td {
            padding: 10px 14px;
            text-align: left;
            white-space: nowrap;
        }

        th {
            font-weight: 600;
        }

        tbody tr {
            border-bottom: 1px solid #e0e0e0;
        }

        tbody tr:nth-child(even) {
            background-color: #f8f8ff;
        }

        tbody tr:hover {
            background-color: #e9ebff;
        }

        .delete-btn {
            padding: 6px 12px;
            background-color: #e53935;
            color: #ffffff;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
        }

        .delete-btn:hover {
            background-color: #c62828;
        }

        .update-btn {
            padding: 6px 12px;
            background-color: #2e7d32;
            color: #ffffff;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
        }

        .update-btn:hover {
            background-color: #1b5e20;
        }
    </style>
</head>

<body>

<div class="card">
    <h2>Nodes List</h2>

    <div class="action-buttons">
        <a href="/" class="home-btn">Home</a>
        <a href="/node/add" class="add-btn">Add New Node</a>
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Node Name</th>
            <th>Node Path</th>
            <th>Roles</th>
            <th>Delete</th>
            <th>Update</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${nodeDtos}" var="nodeDto">
            <tr>
                <td>${nodeDto.id}</td>
                <td>${nodeDto.name}</td>
                <td>${nodeDto.path}</td>
                <td>${nodeDto.roles}</td>
                <td>
                    <a href="/node/delete?id=${nodeDto.id}" class="delete-btn">
                        Delete
                    </a>
                </td>
                <td>
                    <a href="/node/update?id=${nodeDto.id}" class="update-btn">
                        Update
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>