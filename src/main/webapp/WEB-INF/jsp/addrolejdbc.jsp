<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Role</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 360px;
            margin: 80px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .btn-group {
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin: 5px;
            font-weight: bold;
        }

        .submit-btn {
            background-color: #28a745;
            color: white;
        }

        .reset-btn {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Add Role</h2>

    <form action="/role/addRoleJdbc" method="post" modelAttribute="roleDto">
        <label>Role Name</label>
        <input type="text" name="name" placeholder="Enter role name">

        <div class="btn-group">
            <input type="submit" value="Add Role" class="btn submit-btn">
            <input type="reset" value="Clear" class="btn reset-btn">
        </div>
    </form>
</div>

</body>
</html>