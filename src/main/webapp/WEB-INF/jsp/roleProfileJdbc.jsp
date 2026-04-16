<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Role</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

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

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card shadow p-4" style="width: 420px;">

        <h3 class="text-center mb-4 fw-bold">Update Role (JDBC)</h3>

        <!--  JDBC Update Form -->
        <form action="/role/updateroleJdbc" method="post">

            <!-- Role ID -->
            <div class="mb-3">
                <label class="form-label">Role ID</label>
                <input type="text"
                       class="form-control"
                       value="${roledata.id}"
                       readonly>
                <input type="hidden" name="id" value="${roledata.id}">
            </div>

            <!-- Role Name -->
            <div class="mb-4">
                <label class="form-label">Role Name</label>
                <input type="text"
                       class="form-control"
                       name="name"
                       value="${roledata.name}"
                       placeholder="Enter role name"
                       required>
            </div>

            <!-- Actions -->
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary w-100">
                    Update & Save
                </button>
                <a href="/role/list" class="btn btn-secondary w-100">
                    Cancel
                </a>
            </div>

        </form>

    </div>
</div>

</body>
</html>
``