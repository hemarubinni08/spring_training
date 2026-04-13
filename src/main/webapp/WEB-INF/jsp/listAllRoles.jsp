<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Role List</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .table-container {
            margin-top: 50px;
        }
    </style>
</head>
<body>

<div class="container table-container">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold">Role List</h2>
        <a href="/role/addrole" class="btn btn-primary">
            + Add Role
        </a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body p-0">

            <table class="table table-hover table-striped mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${role}" var="rolevariable">
                        <tr>
                            <td>
                                <a href="/role/roleprofile/${rolevariable.id}"
                                   class="text-decoration-none fw-semibold">
                                    ${rolevariable.id}
                                </a>
                            </td>

                            <td>${rolevariable.name}</td>

                            <td class="text-center">

                                <a href="/role/roleprofile/${rolevariable.id}"
                                   class="btn btn-sm btn-outline-primary me-2">
                                    Update
                                </a>

                                <a href="/role/deleterole/${rolevariable.id}"
                                   class="btn btn-sm btn-outline-danger me-2"
                                   onclick="return confirm('Are you sure you want to delete this role?');">
                                    Delete
                                </a>

                                <a href="/role/deleterolejdbc/${rolevariable.id}"
                                   class="btn btn-sm btn-outline-warning"
                                   onclick="return confirm('Delete using JDBC?');">
                                    Delete JDBC
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty role}">
                        <tr>
                            <td colspan="3" class="text-center py-4 text-muted">
                                No roles found.
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