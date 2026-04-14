<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration Form</title>

<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2);
        height: 100vh;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background-color: #ffffff;
        padding: 30px 40px;
        border-radius: 10px;
        width: 350px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 25px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #555;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 14px;
        box-sizing: border-box;
    }

    input:focus {
        border-color: #667eea;
        outline: none;
    }

    button {
        width: 100%;
        padding: 12px;
        background-color: #667eea;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        margin-top: 15px;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #5a67d8;
    }
</style>
</head>

<body>
    <div class="container">
        <h2>User Registration</h2>

        <form:form action="register" method="post" modelAttribute="userDto">

            <div class="form-group">
                <form:label path="name">Full Name</form:label>
                <form:input path="name"/>
            </div>

            <div class="form-group">
                <form:label path="email">E-mail</form:label>
                <form:input path="email"/>
            </div>

            <div class="form-group">
                            <form:label path="phoneNo">PhoneNumber</form:label>
                            <form:input path="phoneNo"/>
            </div>

            <div class="form-group">
                <form:label path="password">Password</form:label>
                <form:password path="password"/>
            </div>


            <div class="form-group">
                <form:label path="age">Age</form:label>
                <form:input path="age" type="number" min="0"/>
            </div>



<select name="role">
    <option value="">--Select role--</option>
    <c:forEach var="role" items="${roles}">
        <option value="${role.name}">${role.name}</option>
    </c:forEach>
</select>



<!-- ✅ ADDITIONAL ROLES (MULTIPLE) -->
<div class="form-group">
    <label>Additional Roles</label>
    <form:select path="roles" multiple="true">
        <form:options items="${roles}" itemValue="name" itemLabel="name"/>
    </form:select>

</div>



            <form:button>Register</form:button>

        </form:form>
    </div>
</body>
</html>