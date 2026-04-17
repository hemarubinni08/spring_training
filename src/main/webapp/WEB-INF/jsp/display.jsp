<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .page-title {
            text-align: center;
            padding: 30px 0;
            color: #ffffff;
            font-size: 32px;
            font-weight: 600;
        }

        .card {
            width: 95%;
            max-width: 1200px;
            margin: 0 auto 40px;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
            padding: 25px;
        }

        /* ✅ TOP ACTIONS BAR */
        .top-actions {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .home-btn {
            display: inline-block;
            padding: 10px 18px;
            background: #374151;
            color: #ffffff;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }

        .home-btn:hover {
            background: #1f2937;
        }

        .add-user-btn {
            display: inline-block;
            padding: 10px 18px;
            background: #16a34a;
            color: #ffffff;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }

        .add-user-btn:hover {
            background: #15803d;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        thead {
            background: linear-gradient(90deg, #4CAF50, #43A047);
            color: white;
        }

        th {
            padding: 14px;
            text-transform: uppercase;
            letter-spacing: 0.06em;
        }

        td {
            padding: 12px;
            text-align: center;
            color: #333;
        }

        tbody tr {
            border-bottom: 1px solid #e5e7eb;
        }

        tbody tr:nth-child(even) {
            background-color: #f9fafb;
        }

        tbody tr:hover {
            background-color: #eef2ff;
        }

        .username {
            font-weight: 600;
            color: #4f46e5;
        }

        .delete-link {
            display: inline-block;
            padding: 6px 14px;
            background-color: #dc2626;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
        }

        .delete-link:hover {
            background-color: #b91c1c;
        }

        .edit-link {
            display: inline-block;
            padding: 6px 14px;
            background-color: #2563eb;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            margin-right: 6px;
        }

        .edit-link:hover {
            background-color: #1d4ed8;
        }

        .footer {
            text-align: right;
            margin-top: 10px;
            color: #555;
            font-size: 14px;
        }
    </style>
</head>

<body>

<div class="page-title">👤 User Dashboard</div>

<div class="card">

    <!-- ✅ HOME + REGISTER BUTTONS -->
    <div class="top-actions">
        <a href="/" class="home-btn">🏠 Home</a>

        <a href="/user/register" class="add-user-btn">
            ➕ Register New User
        </a>
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
            <th>RoleNames</th>
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