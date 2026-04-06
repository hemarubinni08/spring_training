<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>

    <h2>Registration Form</h2>

    <form action="/user/registerJdbc" method="post" modelAttribute="userDto">
        <label>Username:</label>

        <input type="text" name="username">



        <label>Email:</label>

        <input type="email" name="email">



        <label>Password:</label>

        <input type="password" name="password">



        <input type="submit" value="Register">
        <input type="reset" value="Clear">
    </form>

</body>
</html>