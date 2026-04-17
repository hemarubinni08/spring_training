<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #eee;
        }
        .btn-del {
            color: red;
        }
        .btn-view {
            color: blue;
        }
    </style>
</head>
<body>
    <h2>User Records List</h2>

    <div class="header-actions">
                <a href="${pageContext.request.contextPath}/user/register" class="btn btn-add">+ Add User</a>
            </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>ID (JDBC)</th>
                <th>Name</th>
                <th>Role</th>
                <th>Roles</th>
                <th>Email (JPA/Path)</th>
                <th>Email (JDBC)</th>
                <th>Phone</th>
                <th>Delete (JPA)</th>
                <th>Delete (JDBC)</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td><a href="/user/getprofilebyid?id=${user.id}">${user.id}</a></td>
                    <td><a href="/user/getprofilebyidjdbc?id=${user.id}">${user.id}</a></td>
                    <td>${user.name}</td>
                    <td>${user.role}</td>
                    <td>
                        <c:forEach var="roleList" items="${user.roles}">
                            <c:forEach var="role" items="${roleList}" varStatus="status">
                                ${role}<c:if test="${!status.last}">, </c:if>
                            </c:forEach>
                        </c:forEach>
                    </td>
                    <td><a href="/user/getprofile/${user.email}">${user.email}</a></td>
                    <td><a href="/user/getprofileJdbc?email=${user.email}">${user.email}</a></td>
                    <td>${user.phoneNo}</td>
                    <td>
                        <a href="/user/deleteprofile?email=${user.email}"
                           class="btn-del"
                           onclick="return confirm('Delete this user?');">Delete</a>
                    </td>
                    <td>
                        <a href="/user/deleteprofileJdbc?email=${user.email}"
                           class="btn-del"
                           onclick="return confirm('Delete this user?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button class="btn-home" onclick="window.location.href='/'">
         Back to Home
    </button>
</body>
</html>