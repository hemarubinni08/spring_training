<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Roles</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Roles</h3>
        <a href="/role/addrolejpa" class="btn btn-primary">Add Role</a>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID (JPA)</th>
                    <th>ID (JDBC)</th>
                    <th>Name</th>
                    <th>Update (JPA)</th>
                    <th>Update (JDBC)</th>
                    <th>Delete (JPA)</th>
                    <th>Delete (JDBC)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${rolesList}" var="role">
                    <tr>
                        <td>
                            <a href="/role/editrolejpa?id=${role.id}">
                                ${role.id}
                            </a>
                        </td>
                        <td>

                            <a href="/role/editrolejdbc?id=${role.id}">
                                ${role.id}
                            </a>
                        </td>
                        <td>${role.name}</td>
                        <td>
                            <a href="/role/editrolejpa?id=${role.id}">
                                ${role.id}
                            </a>
                        </td>
                        <td>
                        <a href="/role/editrolejdbc?id=${role.id}">
                            ${role.id}
                        </a>
                        </td>
                        <td>
                            <a href="/role/deleterolejpa?id=${role.id}"
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('Delete this role?');">
                                Delete
                            </a>
                        </td>
                        <td>
                            <a href="/role/deleterolejdbc?id=${role.id}"
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('Delete this role?');">
                                Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>