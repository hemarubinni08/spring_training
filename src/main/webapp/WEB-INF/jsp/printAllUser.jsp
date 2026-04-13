<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User List</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .table-container {
            margin-top: 50px;
        }
        td, th {
            vertical-align: middle;
        }
    </style>
</head>
<body>

<div class="container table-container">

    <!-- Header with TWO Add buttons -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold">User List</h2>

        <div>
            <a href="/user/register" class="btn btn-primary me-2">
                + Add User (JPA)
            </a>

            <a href="/user/registerjdbc" class="btn btn-warning">
                + Add User (JDBC)
            </a>
        </div>
    </div>

    <!-- User Table -->
    <div class="card shadow-sm">
        <div class="card-body p-0">

            <table class="table table-hover table-striped mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>ID (Param)</th>
                        <th>ID (Path)</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Email (Param JDBC)</th>
                        <th>Email (Path JPA)</th>
                        <th>Phone</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <!-- ID as Param -->
                            <td>
                                <a href="/user/getProfileById?id=${user.id}"
                                   class="text-decoration-none fw-semibold">
                                    ${user.id}
                                </a>
                            </td>

                            <!-- ID as Path -->
                            <td>
                                <a href="/user/getProfileByIdJdbc/${user.id}"
                                   class="text-decoration-none fw-semibold">
                                    ${user.id}
                                </a>
                            </td>

                            <td>${user.name}</td>
                            <td>${user.age}</td>

                            <!-- Email Param JDBC -->
                            <td>
                                <a href="/user/profilejdbc?email=${user.email}"
                                   class="text-decoration-none">
                                    ${user.email}
                                </a>
                            </td>

                            <!-- Email Path JPA -->
                            <td>
                                <a href="/user/profile/${user.email}"
                                   class="text-decoration-none">
                                    ${user.email}
                                </a>
                            </td>

                            <td>${user.phoneNo}</td>

                            <!-- Actions -->
                            <td class="text-center">
                                <a href="/user/deleteUser?email=${user.email}"
                                   class="btn btn-sm btn-outline-danger me-2"
                                   onclick="return confirm('Are you sure you want to delete this user?');">
                                    Delete
                                </a>

                                <a href="/user/deleteUserJdbc?email=${user.email}"
                                   class="btn btn-sm btn-outline-warning"
                                   onclick="return confirm('Are you sure you want to delete this user via JDBC?');">
                                    Delete JDBC
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <!-- Empty State -->
                    <c:if test="${empty users}">
                        <tr>
                            <td colspan="8" class="text-center py-4 text-muted">
                                No users found.
                            </td>
                        </tr>
                    </c:if>
                </tbody>

            </table>

        </div>
    </div>

</div>

</body>
</html>
``