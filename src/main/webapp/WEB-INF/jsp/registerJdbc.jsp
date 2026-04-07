<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #9face6);
            font-family: Arial, sans-serif;
        }

        .container-box {
            width: 400px;
            margin: 50px auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn-register {
            width: 100%;
            padding: 10px;
            background-color: #4e73df;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-register:hover {
            background-color: #2e59d9;
        }
    </style>
</head>

<body>

<div class="container-box">
    <h2>User Registration</h2>
     <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

 <form method="post" modal Attribute="userDto">

        <label>Name:</label>
        <input type="text" name="name" class="form-control" required>

        <label>Email:</label>
        <input type="email" name="email" class="form-control" required>

        <label>Phone Number:</label>
        <input type="text" name="phoneNo" class="form-control" required>

        <label>Username:</label>
        <input type="text" name="userName" class="form-control" required>

        <label>Password:</label>
        <input type="password" name="password" class="form-control" required>

        <label>Age:</label>
        <input type="number" name="age" class="form-control" required>

        <button type="submit" class="btn-register">Register</button>
    </form>
</div>

</body>
</html>