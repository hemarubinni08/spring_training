<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background-image: linear-gradient(-225deg, #B7F8DB 0%, #50A7C2 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .container {
        width: 95%;
        max-width: 1150px;
        background: #ffffff;
        padding: 28px;
        border-radius: 28px;
        box-shadow: 0 18px 35px rgba(0, 0, 0, 0.15);
    }

    .header-actions {
        display: flex;
        justify-content: flex-end; /* Aligns button to the right */
        margin-bottom: 20px;
    }

    .btn-register {
        padding: 10px 20px;
        background: linear-gradient(120deg, #11998e, #38ef7d);
        color: white;
        border-radius: 25px;
        text-decoration: none;
        font-size: 14px;
        font-weight: 600;
        box-shadow: 0 4px 12px rgba(56, 239, 125, 0.3);
        transition: transform 0.2s ease;
    }

    .btn-register:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(56, 239, 125, 0.4);
        color: white;
    }

    h1 {
        text-align: center;
        margin-bottom: 22px;
        color: #333;
        letter-spacing: 1px;
        font-weight: 600;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
        border-radius: 15px;
        overflow: hidden;
    }

    thead {
        background: linear-gradient(120deg, #1d2b64, #6dd5ed);
        color: white;
    }

    th, td {
        padding: 12px 14px;
        text-align: center;
        border-bottom: 1px solid #eee;
    }

    th {
        font-size: 12px;
        text-transform: uppercase;
    }

    tbody tr:nth-child(even) {
        background: #f6f9ff;
    }

    tbody tr:hover {
        background: linear-gradient(120deg, #eef2ff, #dbeafe);
    }

    .action-cell {
        display: flex;
        flex-direction: column;
        gap: 6px;
        align-items: center;
    }

    .btn-view {
        padding: 7px 14px;
        background: linear-gradient(120deg, #36d1dc, #5b86e5);
        color: white;
        border-radius: 20px;
        text-decoration: none;
        font-size: 12px;
        font-weight: 600;
        box-shadow: 0 4px 8px rgba(0,0,0,0.12);
    }

    .btn-view:hover {
        background: linear-gradient(120deg, #5b86e5, #36d1dc);
    }

    .btn-delete {
        background: linear-gradient(120deg, #ff416c, #ff4b2b);
    }

    .btn-delete:hover {
        background: linear-gradient(120deg, #e11d48, #be123c);
    }

    .no-data {
        text-align: center;
        padding: 25px;
        font-weight: 600;
        color: #888;
    }
</style>
</head>

<body>

<div class="container">
    <h1>User List</h1>
    <div class="header-actions">
        <a href="${pageContext.request.contextPath}/user/register" class="btn-register">
            + Register New User
        </a>
    </div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Age</th>
                <th>DOB</th>
                <th>Username</th>
                <th>Primary Role</th>
                <th>Other Roles</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
        <c:choose>
            <c:when test="${not empty usersDetailsList}">
                <c:forEach var="user" items="${usersDetailsList}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.phoneNo}</td>
                        <td>${user.age}</td>
                        <td>${user.dateOfBirth}</td>
                        <td>${user.userName}</td>
                        <td>${user.roleName}</td>

                        <!-- MULTI-ROLES COLUMN -->
                        <td>
                            <c:choose>
                                <c:when test="${not empty user.roles}">
                                    ${user.roles}
                                </c:when>
                                <c:otherwise>
                                    -
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td class="action-cell">
                            <!-- RequestParam -->
                            <a href="${pageContext.request.contextPath}/user/userProfileJdbcById?id=${user.id}"
                               class="btn-view">
                                View (RequestParam)
                            </a>

                            <!-- PathVariable -->
                            <a href="${pageContext.request.contextPath}/user/profileById/${user.id}"
                               class="btn-view">
                                View (PathVariable)
                            </a>

                            <a href="${pageContext.request.contextPath}/user/delete/${user.email}"
                               class="btn-view btn-delete">
                                Delete User
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <tr>
                    <td colspan="10" class="no-data">
                        No users found
                    </td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
    <div class="action-cell">

        <a href="${pageContext.request.contextPath}/"
            style="display:inline-block; margin-top:15px; font-weight:600; color:#2563eb; text-decoration:none;">
                ← Back to Home
        </a>
    </div>
</div>
</body>
</html>