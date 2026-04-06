<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        background: linear-gradient(120deg,#ff0760, rgba(0, 0, 0, 0.075));
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
        animation: fadeIn 0.6s ease-in-out;
    }

    h3 {
        font-weight: 600;
        color: #4a4a4a;
    }

    label {
        font-weight: 500;
        color: #555;
        margin-bottom: 5px;
    }

    .form-control {
        border-radius: 10px;
        padding: 10px 14px;
        border: 1px solid #ddd;
        transition: all 0.3s ease;
    }

    .form-control:focus {
        border-color: #667eea;
        box-shadow: 0 0 8px rgba(102, 126, 234, 0.4);
    }

    .btn-primary {
        background: linear-gradient(to right, #667eea, #764ba2);
        border: none;
        border-radius: 12px;
        height: 48px;
        font-size: 18px;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        background: linear-gradient(to right, #5a6fdc, #6a42a1);
        transform: translateY(-2px);
        box-shadow: 0 8px 18px rgba(118, 75, 162, 0.4);
    }

    .btn-outline-secondary {
        border-radius: 12px;
        height: 48px;
        font-size: 18px;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .btn-outline-secondary:hover {
        background-color: #f1f1f1;
        border-color: #555;
        transform: translateY(-1px);
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(15px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @media (max-width: 576px) {
        .register-card {
            margin: 20px;
            padding: 25px;
        }
    }
</style>
</head>

<body>

<div class="register-card shadow">
    <h3 class="text-center mb-4">User Registration</h3>

    <form:form action="/user/registerJdbc" method="post" modelAttribute="userDto">

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

        <div class="mb-3">
            <form:label path="age">Age</form:label>
            <form:input path="age" cssClass="form-control"/>
        </div>



        <div class="d-grid gap-2 mt-4">
            <form:button cssClass="btn btn-primary btn-lg">
                Register
            </form:button>

            <button type="reset" class="btn btn-outline-secondary btn-lg">
                Reset
            </button>
        </div>

    </form:form>
</div>


\
</body>
</html>