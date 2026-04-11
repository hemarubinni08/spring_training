<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>

<style>
    body {
        font-family: Arial;
        background: linear-gradient(135deg, #667eea, #764ba2);
    }

    .box {
        width: 420px;
        margin: 80px auto;
        background: white;
        padding: 30px;
        border-radius: 10px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }

    .form-group label {
        width: 100px;
        font-weight: bold;
    }

    .form-group input {
        flex: 1;
        padding: 8px;
    }

    button {
        width: 100%;
        padding: 10px;
        background: #4a3aff;
        color: white;
        border: none;
        margin-top: 15px;
        cursor: pointer;
    }

    button:hover {
        background: #3726d6;
    }
</style>

</head>

<body>

<!-- ERROR POPUP -->
<c:if test="${not empty error}">
    <script>
        alert("${error}");
    </script>
</c:if>

<div class="box">

<h2>Edit User</h2>

<form action="/user/update" method="post">

    <input type="hidden" name="id" value="${user.id}">

    <div class="form-group">
        <label>Name:</label>
        <input type="text" name="name" value="${user.name}">
    </div>

    <div class="form-group">
        <label>Email:</label>
        <input type="email" name="email" value="${user.email}">
    </div>

    <div class="form-group">
        <label>Phone:</label>
        <input type="text" name="phoneNo" value="${user.phoneNo}">
    </div>

    <div class="form-group">
        <label>Username:</label>
        <input type="text" name="userName" value="${user.userName}">
    </div>

    <button type="submit">Update</button>

</form>

</div>
</body>
</html>