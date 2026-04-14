<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Node List</title>

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
        <h2 class="fw-bold">Node List</h2>

        <div class="d-flex gap-2">
            <a href="${pageContext.request.contextPath}/" class="btn btn-success btn-sm">
                Back To Home
            </a>

            <a href="/node/addnode" class="btn btn-primary btn-sm">
                + Add Node
            </a>
        </div>
    </div>

    <div class="card shadow-sm">
        <div class="card-body p-0">

            <table class="table table-hover table-striped mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Path</th>
                        <th>Roles</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${nodes}" var="node">
                        <tr>
                            <td>
                                <a href="/node/nodeprofile/${node.id}"
                                   class="text-decoration-none fw-semibold">
                                    ${node.id}
                                </a>
                            </td>

                            <td>${node.name}</td>
                            <td class="text-muted">${node.path}</td>

                            <!-- ✅ ROLES DISPLAY -->
                            <td>
                                <c:if test="${empty node.roles}">
                                    <span class="text-muted">No Roles</span>
                                </c:if>

                                <c:forEach items="${node.roles}" var="r">
                                    <span class="badge bg-secondary me-1">
                                        ${r}
                                    </span>
                                </c:forEach>
                            </td>

                            <td class="text-center">
                                <a href="/node/nodeprofile/${node.id}"
                                   class="btn btn-sm btn-outline-primary me-2">
                                    Update
                                </a>

                                <a href="/node/deletenode/${node.id}"
                                   class="btn btn-sm btn-outline-danger"
                                   onclick="return confirm('Are you sure you want to delete this node?');">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty nodes}">
                        <tr>
                            <td colspan="5" class="text-center py-4 text-muted">
                                No nodes found.
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