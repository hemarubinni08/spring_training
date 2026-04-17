<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }

        .container {
            width: 400px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
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
            margin-top: 4px;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            border: none;
            color: white;
            font-size: 15px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2980b9;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Update Profile</h2>

    <c:if test="${not empty message}">
        <div class="error">${message}</div>
    </c:if>

    <form action="/user/saveprofileJdbc" method="post">

        <input type="hidden" name="id" value="${userDto.id}" />

        <label>Name</label>
        <input type="text" name="name" value="${userDto.name}" required />

        <label>Email</label>
        <input type="email" name="email" value="${userDto.email}" required />

        <label>User Name</label>
        <input type="text" name="userName" value="${userDto.userName}" required />

        <label>Phone No</label>
        <input type="text" name="phoneNo" value="${userDto.phoneNo}" />

        <label>Age</label>
        <input type="number" name="age" value="${userDto.age}" />

        <label>Password</label>
        <input type="password" name="password"
               placeholder="Leave blank to keep old password"/>

        <button type="submit">Update Profile</button>
    </form>
</div>

</body>
</html>