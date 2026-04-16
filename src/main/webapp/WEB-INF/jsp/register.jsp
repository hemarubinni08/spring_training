<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

<style>
    body {
        background: linear-gradient(to right, #6a11cb, #2575fc);
    }
    .login-link {
        text-align: center;
        margin-top: 15px;
    }
</style>

</head>
<body>

<div class="container d-flex justify-content-center align-items-center">
    <div class="card shadow p-4" style="width: 400px;">
        <h3 class="text-center mb-4">Create Account</h3>

        <form action="/user/register" method="post" modelAttribute="userDto">

            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="name" placeholder="Enter your name" required>
            </div>

            <div class="form-group">
                 <label>Age</label>
                 <input type="text" class="form-control" name="age" placeholder="Enter your age" required>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                 <label>Phone</label>
                 <input type="phone" class="form-control" name="phoneNo" placeholder="Enter your phone no" required>
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" name="userName" placeholder="Choose a username" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" placeholder="Enter password" required>
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

            <button type="submit" class="btn btn-primary">Register</button>
        </form>

    </div>
</div>

</body>
</html>