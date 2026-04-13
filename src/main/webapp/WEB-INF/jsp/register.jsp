<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

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
        background-image: linear-gradient(-225deg, #B7F8DB 0%, #50A7C2 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .container {
        width: 480px;
        background: #ffffff;
        padding: 30px;
        border-radius: 28px;
        box-shadow: 0 18px 35px rgba(0, 0, 0, 0.15);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
        letter-spacing: 1px;
        font-weight: 600;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-size: 13px;
        font-weight: 600;
        color: #555;
        margin-bottom: 6px;
    }

    input {
        width: 100%;
        padding: 9px 12px;
        font-size: 14px;
        border-radius: 8px;
        border: 1px solid #ccc;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    input:focus {
        outline: none;
        border-color: #36d1dc;
        box-shadow: 0 0 0 2px rgba(54,209,220,0.2);
    }

    button {
        width: 100%;
        margin-top: 10px;
        padding: 11px;
        border-radius: 22px;
        border: none;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        background: linear-gradient(120deg, #36d1dc, #5b86e5);
        color: white;
        transition: all 0.25s ease;
        box-shadow: 0 4px 8px rgba(0,0,0,0.12);
    }

    button:hover {
        opacity: 0.95;
        transform: translateY(-1px);
    }

    .error-box {
        margin-top: 15px;
        text-align: center;
        font-size: 13px;
        color: #b91c1c;
        font-weight: 600;
    }
</style>
</head>

<body>

<div class="container">
    <h2>User Registration</h2>

    <form:form action="/user/register"
               method="POST"
               modelAttribute="userDto">

        <div class="form-group">
            <label>Name</label>
            <form:input path="name"/>
        </div>

        <div class="form-group">
            <label>Email</label>
            <form:input path="email"/>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <form:input path="phoneNo"/>
        </div>

        <div class="form-group">
            <label>Age</label>
            <form:input path="age" type="number"/>
        </div>

        <div class="form-group">
            <label>Date of Birth</label>
            <form:input path="dateOfBirth" type="date"/>
        </div>

        <div class="form-group">
            <label>Username</label>
            <form:input path="userName"/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <form:password path="password"/>
        </div>

        <button type="submit">Register</button>
    </form:form>

    <c:if test="${not empty errorMessage}">
        <div class="error-box">
            ${errorMessage}
        </div>
    </c:if>
</div>

</body>
</html>