<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show All Roles</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #eef2ff, #f8fafc);
    color: #1e293b;
    padding: 40px 20px;
}

/* Container */
.container {
    width: 95%;
    max-width: 1000px;
    margin: auto;
}

/* Title */
.title {
    text-align: center;
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 25px;
    color: #0f172a;
}

/* Card */
.card {
    background: #ffffff;
    border-radius: 12px;
    padding: 20px;
    border: 1px solid #e2e8f0;
    box-shadow: 0 8px 20px rgba(0,0,0,0.05);
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
}

/* Header */
thead {
    background: #6366f1;
    color: white;
}

th {
    padding: 14px;
    font-size: 12px;
    text-transform: uppercase;
}

/* Rows */
td {
    padding: 12px;
    font-size: 14px;
    border-bottom: 1px solid #e5e7eb;
    text-align: center;
}

tbody tr:hover {
    background: #f1f5f9;
}

/* Buttons */
.btn {
    padding: 6px 12px;
    border-radius: 6px;
    font-size: 12px;
    text-decoration: none;
    color: white;
    margin: 2px;
    display: inline-block;
}

/* Edit */
.edit-btn {
    background: #6366f1;
}

.edit-btn:hover {
    background: #4f46e5;
}

/* Delete */
.delete-btn {
    background: #ef4444;
}

.delete-btn:hover {
    background: #dc2626;
}

/* No data */
.no-data {
    text-align: center;
    padding: 20px;
    color: #64748b;
}

/* Footer */
.footer {
    text-align: center;
    margin-top: 25px;
}

/* Bottom buttons */
.add-btn, .home-btn {
    padding: 10px 20px;
    border-radius: 6px;
    color: white;
    text-decoration: none;
    margin: 8px;
    display: inline-block;
    font-size: 14px;
}

.add-btn {
    background: #6366f1;
}

.add-btn:hover {
    background: #4f46e5;
}

.home-btn {
    background: #0ea5e9;
}

.home-btn:hover {
    background: #0284c7;
}

</style>
</head>

<body>

<div class="container">

    <div class="title">Role Management</div>

    <div class="card">

        <c:choose>
            <c:when test="${not empty roles}">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Role Name</th>
                        <th>Actions</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="role" items="${roles}">
                        <tr>
                            <td>${role.id}</td>
                            <td>${role.name}</td>
                            <td>
                                <a class="btn edit-btn"
                                   href="${pageContext.request.contextPath}/role/editRole?id=${role.id}">
                                    Edit
                                </a>

                                <a class="btn delete-btn"
                                   href="${pageContext.request.contextPath}/role/deleteRole?id=${role.id}"
                                   onclick="return confirm('Are you sure you want to delete this role?');">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>

            <c:otherwise>
                <div class="no-data">
                    No roles found.
                </div>
            </c:otherwise>
        </c:choose>

    </div>

    <!-- Buttons -->
    <div class="footer">

        <a href="${pageContext.request.contextPath}/role/addRole" class="add-btn">
            Add Another Role
        </a>

        <a href="${pageContext.request.contextPath}/" class="home-btn">
            Go to Home
        </a>

    </div>

</div>

</body>
</html>