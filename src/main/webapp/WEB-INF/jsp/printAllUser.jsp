<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User List</title>

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
        .action-btn {
            width: 100%;
        }
    </style>
</head>
<body>

<div class="container table-container">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold">User List</h2>

        <div class="d-flex gap-2">
            <a href="${pageContext.request.contextPath}/"
               class="btn btn-success fw-bold">
                 Back To Home
            </a>

            <a href="/user/register" class="btn btn-primary fw-bold">
                + Register User (JPA)
            </a>

            <a href="/user/registerjdbc" class="btn btn-warning fw-bold">
                + Register User (JDBC)
            </a>
        </div>
    </div>

    <!--  USER TABLE -->
    <div class="card shadow-sm">
        <div class="card-body p-0">

            <table class="table table-hover table-striped mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>ID (Param)</th>
                        <th>ID (Path)</th>
                        <th>Name</th>
                        <th>Email (Param JDBC)</th>
                        <th>Email (Path JPA)</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th class="text-center">Roles</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>
                                <a href="/user/getProfileById?id=${user.id}"
                                   class="fw-semibold text-decoration-none">
                                    ${user.id}
                                </a>
                            </td>

                            <td>
                                <a href="/user/getProfileByIdJdbc/${user.id}"
                                   class="fw-semibold text-decoration-none">
                                    ${user.id}
                                </a>
                            </td>

                            <td>${user.name}</td>

                            <td>
                                <a href="/user/profilejdbc?email=${user.email}"
                                   class="text-decoration-none">
                                    ${user.email}
                                </a>
                            </td>

                            <td>
                                <a href="/user/profile/${user.email}"
                                   class="text-decoration-none">
                                    ${user.email}
                                </a>
                            </td>

                            <td>${user.phoneNo}</td>
                            <td>${user.role}</td>
                            <td>${user.roles}</td>

                            <!--  ACTION COLUMN -->
                            <td class="text-center">
                                <div class="d-grid gap-2">
                                    <a href="/user/getProfileById?id=${user.id}"
                                       class="btn btn-sm btn-outline-primary action-btn">
                                        Update
                                    </a>

                                    <a href="/user/deleteUser?email=${user.email}"
                                       class="btn btn-sm btn-outline-danger action-btn"
                                       onclick="return confirm('Are you sure?');">
                                        Delete
                                    </a>

                                    <a href="/user/deleteUserJdbc?email=${user.email}"
                                       class="btn btn-sm btn-outline-warning action-btn"
                                       onclick="return confirm('Are you sure JDBC?');">
                                        Delete JDBC
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty users}">
                        <tr>
                            <td colspan="10" class="text-center py-4 text-muted">
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