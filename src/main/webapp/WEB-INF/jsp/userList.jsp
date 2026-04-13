<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            min-height: 100vh;
        }

        .card {
            border-radius: 15px;
        }

        .table th {
            background-color: #343a40;
            color: white;
        }

        a.user-link {
            text-decoration: none;
            font-weight: 500;
        }

        a.user-link:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="container mt-5">
    <div class="card shadow-lg">
        <div class="card-body">

            <h3 class="text-center mb-4">User Management</h3>

            <c:if test="${empty users}">
                <div class="alert alert-warning text-center">
                    No users found
                </div>
            </c:if>

            <c:if test="${not empty users}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle text-center">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Roles</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>
                                    <a class="user-link"
                                       href="/user/userById/${user.id}">
                                        ${user.id}
                                    </a>
                                </td>
                                <td>${user.name}</td>
                                <td>${user.email}</td>
                                <td>${user.phoneNo}</td>
                                <td>${user.role}</td>
                                <td>${user.roles}</td>
                                <td>
                                    <a class="btn btn-danger btn-sm"
                                       href="/user/deleteUser/${user.email}"
                                       onclick="return confirm('Are you sure you want to delete this user?');">
                                        Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </c:if>

        </div>

        <div class="card-footer text-muted text-center small">
            User Management System
        </div>
    </div>
</div>

</body>
</html>