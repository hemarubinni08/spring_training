<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Role</title>
    https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css
    <style>
        body {
            background: linear-gradient(135deg, #2193b0, #6dd5ed);
            min-height: 100vh;
        }
        .card {
            border-radius: 15px;
        }
        .label {
            font-weight: 600;
        }
    </style>
</head>

<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="mb-0">Edit Role</h4>
                </div>
                <div class="card-body">
                    <c:if test="${empty role}">
                        <div class="alert alert-danger text-center">
                            Role not found
                        </div>
                    </c:if>
                    <c:if test="${not empty role}">
                        <form:form method="post"
                                   action="/role/updateRole"
                                   modelAttribute="role">
                            <form:hidden path="id"/>
                            <div class="mb-3">
                                <label class="label">Role ID</label>
                                <input type="text"
                                       class="form-control"
                                       value="${role.id}"
                                       readonly/>
                            </div>
                            <div class="mb-3">
                                <label class="label">Role Name</label>
                                <form:input path="name"
                                            cssClass="form-control"/>
                            </div>
                            <div class="d-flex justify-content-between">
                                <a href="/role/listOfRoles"
                                   class="btn btn-secondary">
                                    Cancel
                                </a>

                                <button type="submit"
                                        class="btn btn-success">
                                    Update Role
                                </button>
                            </div>

                        </form:form>

                    </c:if>

                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>