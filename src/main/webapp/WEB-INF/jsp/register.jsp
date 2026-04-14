<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Registration</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background: linear-gradient(120deg, rgba(0, 0, 0, 0.075));
            height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .register-card {
            max-width: 550px;
            margin: 60px auto;
            background: #ffffff;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>

<body>

<div class="register-card shadow">
    <h3 class="text-center mb-4">User Registration</h3>

    <form:form action="/user/register" method="post" modelAttribute="userDto">

        <div class="mb-3">
            <form:label path="name">Full Name</form:label>
            <form:input path="name" cssClass="form-control"/>
        </div>

        <div class="mb-3">
            <form:label path="email">Email</form:label>
            <form:input path="email" cssClass="form-control"/>
        </div>

        <div class="mb-3">
            <form:label path="phoneNo">Phone Number</form:label>
            <form:input path="phoneNo" cssClass="form-control"/>
        </div>

        <div class="mb-3">
            <form:label path="userName">Username</form:label>
            <form:input path="userName" cssClass="form-control"/>
        </div>

        <div class="mb-3">
            <form:label path="password">Password</form:label>
            <form:password path="password" cssClass="form-control"/>
        </div>

        <!-- ✅ SINGLE ROLE -->
        <div class="mb-3">
            <form:label path="role">Primary Role</form:label>
            <form:select path="role" cssClass="form-select">
                <form:option value="">-- Select Role --</form:option>
                <c:forEach var="r" items="${role}">
                    <form:option value="${r.name}">
                        ${r.name}
                    </form:option>
                </c:forEach>
            </form:select>
        </div>

        <!-- ✅ MULTI ROLE (FIXED) -->
        <div class="mb-3">
            <form:label path="roles">Multiple Roles</form:label>
            <form:select path="roles"
                         cssClass="form-select"
                         multiple="true"
                         size="4">
                <c:forEach var="r" items="${role}">
                    <form:option value="${r.name}">
                        ${r.name}
                    </form:option>
                </c:forEach>
            </form:select>

            <small class="text-muted">
                Hold Ctrl (Windows) or Cmd (Mac) to select multiple roles
            </small>
        </div>

        <div class="mb-3">
            <form:label path="age">Age</form:label>
            <form:input path="age" cssClass="form-control"/>
        </div>

        <div class="d-grid gap-2 mt-4">
            <form:button cssClass="btn btn-primary btn-lg">
                Register
            </form:button>
        </div>

    </form:form>
</div>

</body>
</html>
