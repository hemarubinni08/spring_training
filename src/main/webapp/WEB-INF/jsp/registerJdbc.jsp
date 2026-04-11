<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2); /* ✅ changed */
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
            color: #4a3aff; /* ✅ added */
        }

        label {
            font-weight: bold;
            color: #4a3aff; /* ✅ added */
        }

        .form-control {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .form-control:focus {
            border-color: #4a3aff; /* ✅ added */
            outline: none;
            box-shadow: 0 0 5px rgba(74, 58, 255, 0.3); /* ✅ added */
        }

        .btn-register {
            width: 100%;
            padding: 10px;
            background: linear-gradient(135deg, #4a3aff, #6a5cff); /* ✅ changed */
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-register:hover {
            background: linear-gradient(135deg, #372bdb, #5749ff); /* ✅ changed */
        }

        .error {
            color: red;
            text-align: center;
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