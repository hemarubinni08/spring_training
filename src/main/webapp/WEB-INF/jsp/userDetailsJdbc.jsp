<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management (JDBC)</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 1300px;
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
            align-items: center;
        }

        .btn {
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 4px;
            font-size: 13px;
            font-weight: bold;
            display: inline-block;
            text-align: center;
            border: none;
        }

        .btn-home { background-color: #7f8c8d; color: white; }
        .btn-add { background-color: #2ecc71; color: white; }
        .btn-edit { background-color: #3498db; color: white; padding: 5px 10px; font-size: 11px; }
        .btn-delete { background-color: #e74c3c; color: white; padding: 5px 10px; font-size: 11px; }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            text-align: left;
            padding: 12px 15px;
            border-bottom: 1px solid #eeeeee;
            font-size: 14px;
        }

        th {
            background-color: #f8f9fa;
            color: #2c3e50;
            text-transform: uppercase;
            font-size: 11px;
        }

        .id-text { color: #7f8c8d; font-family: monospace; font-weight: bold; }

        .role-tag {
            background-color: #ebf5fb;
            color: #2980b9;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: bold;
        }

        .toast {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            color: white;
            font-weight: bold;
            text-align: center;
        }
        .success { background-color: #2ecc71; }
        .error { background-color: #e74c3c; }
    </style>
</head>
<body>

<c:if test="${not empty toastMessage}">
    <div class="toast ${toastType}">
        ${toastMessage}
    </div>
</c:if>

<div class="container">
    <div class="header">
        <h2>User Records <span style="font-size: 14px; color: #95a5a6; font-weight: normal;">(JDBC Mode)</span></h2>
        <div class="button-group">
            <a href="/" class="btn btn-home">Home</a>
            <a href="/user/registerJdbc" class="btn btn-add">+ Register User</a>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Role</th>
                <th>Contact</th>
                <th>Age/DOB</th>
                <th style="text-align: center;">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${users}">
                <tr>
                    <td class="id-text">#${u.id}</td>
                    <td style="font-weight: bold;">${u.name}</td>
                    <td>${u.email}</td>
                    <td>${u.userName}</td>
                    <td><span class="role-tag">${u.role}</span></td>
                    <td>${u.phoneNo}</td>
                    <td>
                        <div>${u.age} yrs</div>
                        <div style="font-size: 11px; color: #999;">${u.dateOfBirth}</div>
                    </td>
                    <td style="text-align: center;">
                        <div class="button-group" style="justify-content: center;">
                            <a href="/user/profilePageJdbc?email=${u.email}" class="btn btn-edit">Edit</a>
                            <a href="/user/deletePageJdbc?email=${u.email}"
                               class="btn btn-delete"
                               onclick="return confirm('Delete record for ${u.email}?');">Delete</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty users}">
        <p style="text-align: center; color: #999; margin: 50px 0;">No database records found.</p>
    </c:if>
</div>

</body>
</html>