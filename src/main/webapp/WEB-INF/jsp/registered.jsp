<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

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
    .login-link {
        text-align: center;
        margin-top: 15px;
    }
</style>

</head>
<body>

<div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">

    <div class="card shadow p-4" style="width: 400px;">

        <h3 class="text-center mb-4">Create Account</h3>

        <form action="/user/registerjdbc" method="post" modelAttribute="userDto">

            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="name" placeholder="Enter your name" required>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" name="userName" placeholder="Choose a username" required>
            </div>

            <!-- ✅ Age field added -->
            <div class="form-group">
                <label>Age</label>
                <input type="number" class="form-control" name="age"
                       placeholder="Enter your age" min="1" max="120" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" placeholder="Enter password" required>
            </div>

            <button type="submit" class="btn btn-primary">Register</button>

        </form>

        <div class="login-link">
            <small>Already have an account?</small>
            <a href="/user/login" class="btn btn-sm">Login</a>
        </div>

    </div>

</div>

</body>
</html>