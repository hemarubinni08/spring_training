<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>

    <style>
        /* ===== GLOBAL ===== */
        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
            background-color: #f6f7f9;
            color: #1f2937;
        }

        /* ===== PAGE TITLE ===== */
        .page-title {
            text-align: center;
            padding: 18px 0 10px;
            font-size: 26px;
            font-weight: 600;
            color: #1f2937;
        }

        /* ===== CARD ===== */
        .card {
            width: 95%;
            max-width: 1200px;
            margin: 10px auto 24px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.08);
            padding: 22px;
        }

        /* ===== TOP ACTIONS ===== */
        .top-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }

        .action-btn {
            padding: 7px 14px;
            font-size: 14px;
            font-weight: 600;
            border-radius: 6px;
            text-decoration: none;
            border: 1px solid transparent;
        }

        .btn-home {
            background-color: #eef0f3;
            color: #374151;
            border: 1px solid #d1d5db;
        }

        .btn-home:hover {
            background-color: #e5e7eb;
        }

        /* ===== TABLE ===== */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 13.5px;
        }

        thead {
            background-color: #f1f5f9;
        }

        th {
            padding: 12px;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: #475569;
            border-bottom: 1px solid #cbd5e1;
        }

        td {
            padding: 12px;
            text-align: center;
            color: #1f2937;
            border-bottom: 1px solid #e2e8f0;
        }

        tbody tr:hover {
            background-color: #f8fafc;
        }

        /* ===== LINKS ===== */
        a {
            color: #2563eb;
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        .username {
            font-weight: 600;
            color: #1d4ed8;
        }

        /* ===== ACTION BUTTONS ===== */
        .edit-link,
        .delete-link {
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            color: #ffffff;
            display: inline-block;
        }

        .edit-link {
            background-color: #2563eb;
            margin-right: 6px;
        }

        .edit-link:hover {
            background-color: #1d4ed8;
        }

        .delete-link {
            background-color: #dc2626;
        }

        .delete-link:hover {
            background-color: #b91c1c;
        }

        /* ===== FOOTER ===== */
        .footer {
            margin-top: 10px;
            text-align: right;
            font-size: 13.5px;
            color: #6b7280;
        }
    </style>
</head>

<body>

<div class="page-title">User Dashboard</div>

<div class="card">

    <div class="top-actions">
        <a href="/" class="action-btn btn-home">Home</a>
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Username</th>
            <th>Age</th>
            <th>Role</th>
            <th>Roles</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>
                    <a href="/user/displayByIdByRequestParam?id=${user.id}">
                        ${user.id}
                    </a>
                </td>
                <td>${user.name}</td>
                <td>
                    <a href="/user/displayByEmailByPathVariable/${user.email}">
                        ${user.email}
                    </a>
                </td>
                <td class="username">${user.userName}</td>
                <td>${user.age}</td>
                <td>${user.roleName}</td>
                <td>${user.roleNames}</td>
                <td>
                    <a href="/user/editProfile/${user.id}" class="edit-link">Edit</a>
                    <a href="/user/deleteByEmail/${user.email}" class="delete-link">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="footer">
        Total Users: ${users.size()}
    </div>

</div>

</body>
</html>