<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        .login-link {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card shadow p-4" style="width: 420px;">

        <h3 class="text-center mb-4 font-weight-bold">Create Account</h3>

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

            <button type="submit" class="btn btn-primary">
                Register
            </button>

        </form>

        <div class="login-link">
            <small>Already have an account?</small><br>
            <a href="/user/login" class="btn btn-link btn-sm">Login</a>
        </div>

    </div>
</div>

</body>
</html>