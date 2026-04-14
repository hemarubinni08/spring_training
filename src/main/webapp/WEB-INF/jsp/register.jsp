<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            min-height: 100vh;
        }
        .card {
            border-radius: 16px;
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

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card shadow p-4" style="width: 420px;">

        <h3 class="text-center mb-4 font-weight-bold">Create Account</h3>

        <!-- ✅ PROPER FORM -->
        <form action="/user/register" method="post">

            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="name" required>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="email" required>
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" name="userName" required>
            </div>

            <div class="form-group">
                <label>Phone</label>
                <input type="text" class="form-control" name="phoneNo" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" required>
            </div>

            <!-- ✅ SINGLE ROLE -->
            <div class="form-group">
                <label>Role (Single)</label>
                <select class="form-control" name="role">
                    <option value="">-- Select Role --</option>
                    <c:forEach items="${singlerole}" var="r">
                        <option value="${r.name}">
                            ${r.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!-- ✅ MULTIPLE ROLES (CHECKBOX) -->
            <div class="form-group">
                <label class="font-weight-bold">Roles (Multiple)</label>

                <div class="border rounded p-2">
                    <c:forEach items="${multiplerole}" var="r">
                        <div class="form-check">
                            <input class="form-check-input"
                                   type="checkbox"
                                   name="roles"
                                   value="${r.name}">
                            <label class="form-check-label">
                                ${r.name}
                            </label>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">
                Register
            </button>

        </form>

    </div>
</div>

</body>
</html>