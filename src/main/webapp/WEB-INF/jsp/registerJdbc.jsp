<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
        }
        .container {
            width: 400px;
            margin: 50px auto;
            padding: 25px;
            background-color: #ffffff;
            border-radius: 6px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        button {
            width: 100%;
            margin-top: 20px;
            padding: 10px;
            background-color: #2c7be5;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #1a68d1;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Register</h2>

    <form:form method="post"  modelAttribute="userDto">

        <label>Name</label>
        <form:input path="name"/>

        <label>Email</label>
        <form:input path="email"/>

        <label>Phone Number</label>
        <form:input path="phoneNo"/>

        <label>Username</label>
        <form:input path="userName"/>

        <label>Password</label>
        <form:password path="password"/>

        <label>Age</label>
        <form:input path="age"/>

        <button type="submit">Register</button>

    </form:form>
</div>
</body>
</html>