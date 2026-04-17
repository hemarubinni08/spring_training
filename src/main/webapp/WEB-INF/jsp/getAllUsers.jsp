<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, sans-serif;
        background: linear-gradient(135deg, #eef2ff, #f8fafc);
        margin: 0;
        padding: 30px;
    }
    h2 {
        text-align: center;
        color: #1f2937;
        margin-bottom: 20px;
        font-size: 28px;
    }
    .top-actions {
        display: flex;
        justify-content: flex-end;
        gap: 12px;
        margin-bottom: 15px;
    }
    .top-actions a {
        padding: 8px 14px;
        border-radius: 6px;
        text-decoration: none;
        font-weight: 600;
        color: white;
    }
    .back-btn {
        background: #6b7280;
    }
    .add-btn {
        background: #16a34a;
    }
    .back-btn:hover {
        background: #4b5563;
    }
    .add-btn:hover {
        background: #15803d;
    }
    table {
        border-collapse: collapse;
        width: 85%;
        margin: auto;
        background: white;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 10px 25px rgba(0,0,0,0.08);
    }
    th {
        background: #1e3a8a;
        color: white;
        padding: 12px;
        font-size: 14px;
    }
    td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #e5e7eb;
        color: #374151;
    }
    tr:hover {
        background: #f1f5f9;
    }
    a {
        text-decoration: none;
        color: #2563eb;
        font-weight: 500;
    }
    a[href*="delete"] {
        color: #dc2626;
        font-weight: 600;
    }
    a[href*="edit"] {
        color: #059669;
        font-weight: 600;
    }
    p {
        text-align: center;
        color: #6b7280;
        margin-top: 15px;
    }
</style>
</head>
<body>
<h2>Users</h2>
<div class="top-actions">
    <a class="add-btn" href="${pageContext.request.contextPath}/user/register">
        + Add Register
    </a>
     <a class="back-btn" href="/">← Back</a>
</div>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Age</th>
        <th>Password</th>
        <th>Role</th>
        <th>UserName</th>
        <th>PhoneNo</th>
        <th>Roles</th>
        <th>Action</th>
        <th>Edit</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td><a href="/user/getUserById/${user.id}">${user.id}</a></td>
            <td>${user.name}</td>
            <td><a href="/user/profile/${user.email}">${user.email}</a></td>
            <td>${user.age}</td>
            <td>${user.password}</td>
            <td>${user.role}</td>
            <td>${user.userName}</td>
            <td>${user.phoneNo}</td>
            <td>${user.roles}</td>
            <td>
                <a href="${pageContext.request.contextPath}/user/deleteProfile/${user.email}"
                   onclick="return confirm('Are you sure?');">
                    Delete
                </a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/user/edit/${user.id}">
                    Edit
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<c:if test="${empty users}">
    <p>No users found.</p>
</c:if>
</body>
</html>
``