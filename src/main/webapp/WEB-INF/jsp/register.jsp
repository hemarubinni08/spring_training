<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<h2>User Registration</h2>
<form action="/user/register" method="post" modelAttribute="userDto">
<div class="form-group">
Name: <input type="text" class="form-control" name="name" required><br>
</div>
<div class="form-group">
Email: <input type="email" class="form-control" name="email" required><br>
</div>
<div class="form-group">
Username: <input type="text" class="form-control" name="userName" required><br>
</div>
<div class="form-group">
Password: <input type="password" class="form-control" name="password" required><br>
</div>
<input type="submit" class="btn btn-primary" value="Register">
</form>
<a href="/user/login" class="badge badge-warning">Login</a>
</body>
</html>