<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 500px;
            background: #ffffff;
            padding: 30px 30px;
            margin : 20px;
            border-radius: 40px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
            margin : 15px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #555;
            margin-bottom: 6px;
        }

        input {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input:focus {
            outline: none;
            background-color: #5a6fd6; /* Slightly darker */
            box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.2);
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            font-weight: 600;
            background: #1d2b64; /* Or a darker navy blue */
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s, transform 0.2s;
        }

        button:hover {
            background: #5a67d8;
            transform: translateY(-1px);
        }

        button:active {
            transform: translateY(0);
        }
    </style>
</head>

<body>

<div class="container">
    <h2>User Registration</h2>

    <form:form action="/user/registerJdbc"
               method="POST"
               modelAttribute="userDto">

        <div class="form-group">
            <label>Name</label>
            <form:input path="name" />
        </div>

        <div class="form-group">
            <label>Email</label>
            <form:input path="email" />
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <form:input path="phoneNo" />
        </div>

        <div class="form-group">
            <label>Age</label>
            <form:input path="age" type="number" />
        </div>

        <div class="form-group">
            <label>Date of Birth</label>
            <form:input path="dateOfBirth" type="date" />
        </div>

        <div class="form-group">
            <label>Username</label>
            <form:input path="userName" />
        </div>

        <div class="form-group">
            <label>Password</label>
            <form:password path="password" />
        </div>

        <button type="submit">Register</button>

    </form:form>
</div>

</body>
</html>