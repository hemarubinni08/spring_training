<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #eeeeee;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        h2 {
            margin: 0;
            color: #2c3e50;
        }

        .button-group {
            display: flex;
            gap: 10px;
        }

        .btn {
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            display: inline-block;
            text-align: center;
        }

        .btn-home { background-color: #7f8c8d; color: white; }
        .btn-add { background-color: #2ecc71; color: white; }
        .btn-edit { background-color: #3498db; color: white; padding: 5px 10px; font-size: 12px; }
        .btn-delete { background-color: #e74c3c; color: white; padding: 5px 10px; font-size: 12px; }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #eeeeee;
        }

        th {
            background-color: #f8f9fa;
            color: #2c3e50;
            text-transform: uppercase;
            font-size: 12px;
        }

        .role-badge {
            background-color: #e8f4fd;
            color: #3498db;
            padding: 3px 8px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: bold;
        }

        .extra-role-chip {
            background-color: #f1f1f1;
            color: #666;
            padding: 2px 6px;
            border-radius: 4px;
            font-size: 10px;
            margin-right: 3px;
            display: inline-block;
        }

        .toast {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            color: white;
            font-weight: bold;
        }
        .success { background-color: #2ecc71; }
        .error { background-color: #e74c3c; }
    </style>
</head>
<body>

<c:if test="${not empty message}">
    <div class="toast ${success ? 'success' : 'error'}">
        ${message}
    </div>
</c:if>

<div class="container">
    <div class="header">
        <h2>User Management</h2>
        <div class="button-group">
            <a href="/" class="btn btn-home">Home</a>
            <a href="/user/register" class="btn btn-add">Add New User</a>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Primary Role</th>
                <th>Additional Roles</th>
                <th>Username</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${users}">
                <tr>
                    <td>#${u.id}</td>
                    <td>
                        <strong>${u.name}</strong><br>
                        <small>Age: ${u.age}</small>
                    </td>
                    <td>${u.email}</td>
                    <td>${u.phoneNo}</td>
                    <td><span class="role-badge">${u.role}</span></td>
                    <td>
                        <c:forEach var="r" items="${u.roles}">
                            <span class="extra-role-chip">${r}</span>
                        </c:forEach>
                        <c:if test="${empty u.roles}">
                            <span style="color: #999; font-size: 11px;">None</span>
                        </c:if>
                    </td>
                    <td>@${u.userName}</td>
                    <td>
                        <a href="/user/profilePage?email=${u.email}" class="btn btn-edit">Edit</a>
                        <a href="/user/deletePage?email=${u.email}"
                           class="btn btn-delete"
                           onclick="return confirm('Delete user ${u.name}?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty users}">
        <p style="text-align: center; color: #999; margin-top: 50px;">No users found in the system.</p>
    </c:if>
</div>

</body>
</html>