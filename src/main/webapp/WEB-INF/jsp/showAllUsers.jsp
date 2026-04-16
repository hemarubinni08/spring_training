<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>All Users</title>

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
    max-width: 1200px;
    margin: auto;
}

/* Title */
h1 {
    text-align: center;
    margin-bottom: 25px;
    font-weight: 600;
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
}

tbody tr:hover {
    background: #f1f5f9;
}

/* Links */
a {
    color: #4f46e5;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

/* Delete button */
.delete-btn {
    background: #ef4444;
    padding: 6px 12px;
    border-radius: 6px;
    color: white;
    font-size: 12px;
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

/* Buttons */
.btn-container {
    text-align: center;
    margin-top: 25px;
}

.btn {
    display: inline-block;
    padding: 10px 20px;
    margin: 8px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 14px;
    color: white;
}

.register-btn {
    background: #6366f1;
}

.register-btn:hover {
    background: #4f46e5;
}

.home-btn {
    background: #0ea5e9;
}

.home-btn:hover {
    background: #0284c7;
}

/* Role tags */
.role-tag {
    display: inline-block;
    padding: 4px 8px;
    margin: 2px;
    border-radius: 6px;
    font-size: 12px;
    background: #e0e7ff;
    color: #3730a3;
}

</style>
</head>

<body>

<div class="container">

    <h1>User Management</h1>

    <div class="card">

        <!-- NO USERS -->
        <c:if test="${empty users}">
            <div class="no-data">No users found</div>
        </c:if>

        <!-- USERS TABLE -->
        <c:if test="${not empty users}">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Username</th>
                    <th>Age</th>
                    <th>DOB</th>
                    <th>Role</th>
                    <th>Roles</th>
                    <th>Delete</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>

                        <td>
                            <c:url value="/user/getProfileId" var="ReqUrl">
                                <c:param name="id" value="${user.id}" />
                            </c:url>
                            <a href="${ReqUrl}">${user.id}</a>
                        </td>

                        <td>${user.name}</td>

                        <td>
                            <c:url value="/user/getProfileEmail" var="ReqUrl">
                                <c:param name="email" value="${user.email}" />
                            </c:url>
                            <a href="${ReqUrl}">${user.email}</a>
                        </td>

                        <td>${user.phoneNo}</td>
                        <td>${user.userName}</td>
                        <td>${user.age}</td>

                        <td>
                            <c:choose>
                                <c:when test="${not empty user.dateOfBirth}">
                                    <fmt:formatDate value="${user.dateOfBirth}" pattern="dd-MM-yyyy"/>
                                </c:when>
                                <c:otherwise>
                                    N/A
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <span class="role-tag">${user.role}</span>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${not empty user.roles}">
                                    <c:forEach var="r" items="${user.roles}">
                                        <span class="role-tag">${r}</span>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <span style="color:#94a3b8;">-</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <c:url value="/user/deleteEmail" var="deleteUrl">
                                <c:param name="email" value="${user.email}" />
                            </c:url>

                            <a href="${deleteUrl}"
                               class="delete-btn"
                               onclick="return confirm('Are you sure you want to delete this user?');">
                                Delete
                            </a>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

    </div>

    <!-- BUTTONS -->
    <div class="btn-container">

        <a class="btn register-btn"
           href="${pageContext.request.contextPath}/user/register">
            Add Another User
        </a>

        <a class="btn home-btn"
           href="${pageContext.request.contextPath}/">
            Go to Home
        </a>

    </div>

</div>

</body>
</html>