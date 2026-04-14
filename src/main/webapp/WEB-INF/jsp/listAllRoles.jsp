<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Role List</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">

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

                <c:if test="${empty rolesList}">
                    <tr>
                        <td colspan="3" class="text-center text-muted py-4">
                            No roles found
                        </td>
                    </tr>
                </c:if>

                <c:forEach items="${rolesList}" var="role">
                    <tr>
                        <td>${role.id}</td>
                        <td>${role.name}</td>
                        <td class="text-center">

                            <a href="/role/getrolebyidjdbc/${role.id}"
                               class="btn btn-sm btn-outline-primary me-2">
                                Update
                            </a>

                            <a href="/role/deleterolejdbc?id=${role.id}"
                               class="btn btn-sm btn-outline-danger"
                               onclick="return confirm('Are you sure?');">
                                Delete
                            </a>

                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>

        </div>
    </div>

</div>

</body>
</html>