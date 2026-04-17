<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Nodes</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .table-container {
            margin-top: 50px;
        }

        .table thead th {
            background-color: #C9996B !important;
            color: #fff;
        }
    </style>
</head>

<body style="background-color:#EDE9E6;">
<div class="container table-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold">Node List</h2>
        <a href="/node/addnode" class="btn btn-success shadow-sm"> + Add Node</a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body p-0">
            <table class="table table-bordered table-hover table-striped mb-0">
                <thead style="background-color: #C9996B">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Path</th>
                        <th>Roles</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${nodesList}" var="node">
                        <tr>
                            <td>
                                <a href="/node/editnode?id=${node.id}" class="text-decoration-none fw-semibold">
                                    ${node.id}
                                </a>
                            </td>
                            <td>${node.name}</td>
                            <td class="text-muted">${node.path}</td>
                            <td>${node.roles}</td>
                            <td class="text-center">
                                <a href="/node/editnode?id=${node.id}" class="btn btn-sm btn-primary me-2">
                                    Edit
                                </a>
                                <a href="/node/deletenode?id=${node.id}"
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure you want to delete this node?');">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty nodesList}">
                        <tr>
                            <td colspan="4" class="text-center py-4 text-muted">
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