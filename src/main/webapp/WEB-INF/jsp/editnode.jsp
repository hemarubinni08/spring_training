<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Node</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

<style>
    body {
        background: linear-gradient(to right, #28a745, #0a9b2b);
        height: 100vh;
    }
    .card {
        border-radius: 15px;
    }
    .form-control {
        border-radius: 10px;
    }
    .btn-primary {
        border-radius: 10px;
        width: 100%;
    }
</style>

</head>
<body>

<div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="card shadow p-4" style="width: 400px;">
        <h3 class="text-center mb-4">Edit Node</h3>

        <form action="/node/editnode" method="post">
            <div class="form-group">
                <label>ID</label>
                <input type="text" class="form-control" name="id" value="${nodeDetails.id}" readonly>
            </div>

            <div class="form-group">
                <label>Path Name</label>
                <input type="text" class="form-control" name="name" value="${nodeDetails.name}" required>
            </div>

            <div class="form-group">
                <label>Path</label>
                <input type="text" class="form-control" name="path" value="${nodeDetails.path}" required>
            </div>

            <div class="form-group">
                <label>Roles</label>
                <select class="form-control" name="roles" multiple required>
                <c:forEach items="${rolesList}" var="role">
                    <option value="${role.name}"
                    <c:if test="${not empty nodeDetails.roles and fn:contains(nodeDetails.roles, role.name)}">
                       selected
                    </c:if>>
                    ${role.name}
                    </option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</div>

</body>
</html>