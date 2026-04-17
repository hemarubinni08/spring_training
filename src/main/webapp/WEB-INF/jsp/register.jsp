<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f4f7;
        }

        .container {
            width: 350px;
            margin: 80px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            position: relative;
        }

        /* ✅ BACK BUTTON */
        .back-btn {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 5px 12px;
            background-color: #6c757d;
            color: #ffffff;
            text-decoration: none;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .back-btn:hover {
            background-color: #495057;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        label {
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin: 6px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #2e86de;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1b4f72;
        }
    </style>
</head>

<body>

<div class="container">

    <!-- ✅ BACK TO USER DISPLAY -->
    <a href="/user/display" class="back-btn">← Back</a>

    <h2>User Registration</h2>

    <form action="/user/register" method="POST">

        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Phone Number</label>
        <input type="text" name="phoneNo" required>

        <label>Username</label>
        <input type="text" name="userName" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <label>Age</label>
        <input type="number" name="age" required>

        <label>Date of Birth</label>
        <input type="date" name="dateOfBirth" required>

        <!-- ✅ SINGLE ROLE -->
        <label>Role</label>
        <select name="roleName" required>
            <option value="">-- Select Role --</option>
            <c:forEach var="role" items="${roles}">
                <option value="${role.name}">
                    ${role.name}
                </option>
            </c:forEach>
        </select>

        <!-- ✅ MULTI ROLE -->
        <label>Roles</label>
        <select name="roleNames" multiple required size="4">
            <c:forEach var="role" items="${roles}">
                <option value="${role.name}">
                    ${role.name}
                </option>
            </c:forEach>
        </select>

        <button type="submit">Register</button>

    </form>
</div>

</body>
</html>