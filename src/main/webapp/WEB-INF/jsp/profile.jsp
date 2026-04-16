<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">

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
        .btn {
            border-radius: 10px;
        }
    </style>
</head>

<body>

<!--  HEADER -->
<nav class="navbar navbar-dark bg-dark shadow">
    <div class="container-fluid">
        <span class="navbar-brand fw-bold">User Profile</span>
        <a href="/user/getuser" class="btn btn-outline-light btn-sm">Back</a>
    </div>
</nav>

<div class="container d-flex justify-content-center align-items-center mt-5">
    <div class="card shadow p-4" style="width: 500px;">

        <h4 class="text-center fw-bold mb-4">Update User</h4>

        <!--  PROPER FORM TAG -->
        <form action="/user/updateUser" method="post">

            <!--  REQUIRED -->
            <input type="hidden" name="id" value="${userDetails.id}" />

            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" name="name"
                       class="form-control"
                       value="${userDetails.name}" required />
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email"
                       class="form-control"
                       value="${userDetails.email}" readonly />
            </div>

            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="userName"
                       class="form-control"
                       value="${userDetails.userName}" required />
            </div>

            <div class="mb-3">
                <label class="form-label">Phone</label>
                <input type="text" name="phoneNo"
                       class="form-control"
                       value="${userDetails.phoneNo}" />
            </div>

            <!--  SINGLE ROLE -->
            <div class="mb-3">
                <label class="form-label">Role (Single)</label>
                <select name="role" class="form-control">
                    <option value="">-- Select Role --</option>
                    <c:forEach items="${singlerole}" var="r">
                        <option value="${r.name}"
                            ${userDetails.role == r.name ? "selected" : ""}>
                            ${r.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!--  MULTIPLE ROLES (CHECKBOX) -->
            <div class="mb-4">
                <label class="form-label fw-semibold">Roles (Multiple)</label>

                <div class="border rounded p-2">
                    <c:forEach items="${multiplerole}" var="r">
                        <div class="form-check">
                            <input class="form-check-input"
                                   type="checkbox"
                                   name="roles"
                                   value="${r.name}"
                                   <c:if test="${userDetails.roles != null && userDetails.roles.contains(r.name)}">
                                       checked
                                   </c:if>
                            >
                            <label class="form-check-label">
                                ${r.name}
                            </label>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!--  BUTTONS -->
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary w-100">
                    Update
                </button>

                <a href="/user/getuser" class="btn btn-outline-secondary w-100">
                    Cancel
                </a>
            </div>

        </form>

    </div>

</div>

</body>
</html>