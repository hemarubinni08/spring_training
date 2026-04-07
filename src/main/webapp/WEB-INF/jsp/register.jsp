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
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .container {
            width: 400px;
            margin: 50px auto;
            background: white;
            padding: 25px;
            border-radius: 6px;
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        button {
            margin-top: 15px;
            width: 100%;
            padding: 10px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>User Registration</h2>

    <form:form action="/user/register"
               method="POST"
               modelAttribute="userDto">

        <label>Name</label>
        <form:input path="name" />

        <label>Email</label>
        <form:input path="email" />

        <label>Phone Number</label>
        <form:input path="phoneNo" />

        <label>Age</label>
        <form:input path="age" type="number" />

        <label>Date of Birth</label>
        <form:input path="dateOfBirth" type="date" />


        <label>Username</label>
        <form:input path="userName" />

        <label>Password</label>
        <form:password path="password" />

        <button type="submit">Register</button>

    </form:form>
</div>
<div>
    <c:if test="${not empty errorMessage}">
        <p style="color:red;">${errorMessage}</p>
    </c:if>
</div>

</body>
</html>