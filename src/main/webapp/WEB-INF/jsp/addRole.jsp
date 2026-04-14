<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Role</title>

    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

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

        <h3 class="text-center mb-4">Add Role</h3>

        <form action="/role/addrole" method="post">

            <div class="form-group">
                <label>Role Name</label>
                <input
                    type="text"
                    class="form-control"
                    name="name"
                    placeholder="Enter role name"
                    required>
            </div>

            <button type="submit" class="btn btn-primary">
                Add Role
            </button>

        </form>

    </div>

</div>

</body>
</html>