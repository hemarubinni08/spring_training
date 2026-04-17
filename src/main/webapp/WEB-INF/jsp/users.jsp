<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Users</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        body {
            margin: 0;
            padding: 24px;
            font-family: Arial, Helvetica, sans-serif;
            color: #e0e0e0;
            background:
                radial-gradient(circle at top left,
                    rgba(255,255,255,0.08),
                    rgba(0,0,0,0.9) 60%),
                linear-gradient(120deg,#0f2027,#203a43,#2c5364);
            min-height: 100vh;
        }

        .container {
            max-width: 1300px;
        }

        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 14px;
        }

        .back {
            color: #4da6ff;
            text-decoration: none;
            font-size: 14px;
        }

        .back:hover {
            color: #80c1ff;
            text-decoration: underline;
        }

        .add-btn {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: #4da6ff;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            text-decoration: none;
            box-shadow: 0 6px 18px rgba(0,0,0,0.5);
        }

        .add-btn:hover {
            background: #6fb6ff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(25,25,25,0.95);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0,0,0,0.6);
        }

        th, td {
            padding: 12px 14px;
            border: 1px solid #333;
            font-size: 13px;
            text-align: left;
            vertical-align: middle;
        }

        th {
            background: linear-gradient(135deg,#1f1f1f,#2b2b2b);
            color: #ffffff;
            text-transform: uppercase;
            letter-spacing: .4px;
        }

        tr:nth-child(even) {
            background-color: #1c1c1c;
        }

        tr:hover {
            background-color: #252525;
        }

        a {
            color: #4da6ff;
            text-decoration: none;
        }

        a:hover {
            color: #80c1ff;
        }

        .password {
            max-width: 240px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            font-family: monospace;
            font-size: 12px;
            color: #aaa;
        }

        .actions {
            text-align: center;
            width: 90px;
        }

        .actions a {
            color: #ff6b6b;
            font-size: 14px;
        }

        .actions a:hover {
            color: #ff9a9a;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="header">
        <a class="back" href="${pageContext.request.contextPath}/">
            ← Back to Home
        </a>

        <a href="${pageContext.request.contextPath}/user/register"
           class="add-btn"
           title="Add User">
            <i class="fa-solid fa-plus"></i>
        </a>
    </div>

    <table>
        <tr>
            <th>Edit</th>
            <th>Username</th>
            <th>Role</th>
            <th>Additional Roles</th>
            <th>Email</th>
            <th>Password</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="user" items="${users}">
            <tr>
                <td>
                    <a href="${pageContext.request.contextPath}/user/getProfileId?id=${user.id}">
                        <i class="fa-solid fa-pen"></i>
                    </a>
                </td>

                <td>${user.userName}</td>
                <td>${user.role}</td>
                <td>${user.roles}</td>

                <td>
                    <a href="${pageContext.request.contextPath}/user/getProfile?email=${user.email}">
                        ${user.email}
                    </a>
                </td>

                <td class="password" title="${user.password}">
                    ${user.password}
                </td>

                <td class="actions">
                    <a href="${pageContext.request.contextPath}/user/deleteProfile/${user.email}"
                       onclick="return confirm('Are you sure you want to delete this user?');">
                        <i class="fa-solid fa-trash"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>

</body>
</html>
``
