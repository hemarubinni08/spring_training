<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Path</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

<style>
    body {
        background: linear-gradient(to right, #6a11cb, #2575fc);
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
        <h3 class="text-center mb-4">Add Node</h3>

        <form action="/node/addnode" method="post" modelAttribute="pathDto">
            <div class="form-group">
                <label>Path Name</label>
                <input type="text" class="form-control" name="name" placeholder="Enter path name" required>
            </div>
            <div class="form-group">
                 <label>Path Name</label>
                 <input type="text" class="form-control" name="path" placeholder="Enter path" required>
            </div>
            <div class="form-group">
                            <label>Roles</label>
                            <select class="form-control"
                                    name="roles"
                                    multiple
                                    size="4"
                                    required>
                                <c:forEach items="${rolesList}" var="role">
                                    <option value="${role.name}">
                                        ${role.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

    </div>
</div>

</body>
</html>