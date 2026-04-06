<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 420px;
            background: white;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 15px 25px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            font-weight: 600;
            margin-top: 10px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #6c63ff;
            box-shadow: 0 0 5px rgba(108,99,255,0.4);
        }

        button {
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #6c63ff;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #5548c8;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .footer {
            text-align: center;
            margin-top: 15px;
            font-size: 13px;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>User Registration</h2>

    <form action="/user/registerJdbc" method="post">


        <label>Full Name</label>
        <input type="text" name="fullName" placeholder="Enter Full Name" required />

        <label>Username</label>
        <input type="text" name="username" placeholder="Choose a username" required />

        <label>Email</label>
        <input type="email" name="email" placeholder="Enter email address" required />

        <label>Phone Number</label>
        <input type="tel" name="phoneNumber" placeholder="Enter phone number"
               pattern="[0-9]{10}" title="10 digit number" required />

        <label>Date of Birth</label>
        <input type="date" name="dateOfBirth" required />

        <label>Age</label>
        <input type="number" name="age" min="18" placeholder="Enter age" required />

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required />

        <button type="submit">Register</button>
    </form>

    <!-- Show error if registration fails -->
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <div class="footer">
        Already have an account? <a href="/user/login">Login</a>
    </div>
</div>

</body>
</html>