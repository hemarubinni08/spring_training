<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>

    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">User Profile</h5>
                </div>

                <div class="card-body">
                    <form action="/user/updateuserjpa" method="post">

                        <div class="form-group">
                            <label>ID</label>
                            <input type="text" class="form-control"
                                   name="id"
                                   value="${userDetails.id}"
                                   readonly>
                        </div>

                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control"
                                   name="name"
                                   value="${userDetails.name}">
                        </div>

                        <div class="form-group">
                            <label>Age</label>
                            <input type="number" class="form-control"
                                   name="age"
                                   value="${userDetails.age}">
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control"
                                   name="email"
                                   value="${userDetails.email}">
                        </div>

                        <div class="form-group">
                            <label>Phone</label>
                            <input type="text" class="form-control"
                                   name="phoneNo"
                                   value="${userDetails.phoneNo}">
                        </div>

                        <div class="form-group">
                        <label>Roles</label>
                        <select class="form-control" name="roles" multiple required>
                            <c:forEach items="${rolesList}" var="role">
                                <option value="${role.name}"
                                    <c:if test="${not empty userDetails.roles and fn:contains(userDetails.roles, role.name)}">
                                        selected
                                    </c:if>>
                                    ${role.name}
                                </option>
                            </c:forEach>
                        </select>
                        </div>

                        <div class="text-right">
                            <button type="submit" class="btn btn-success">
                                Save
                            </button>
                        </div>

                    </form>
                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>