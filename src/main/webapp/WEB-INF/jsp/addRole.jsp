
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Role</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }
        .container {
            width: 400px;
            margin: 80px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
        }
        h2 {
            text-align: center;
        }
        input[type="text"], button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .message {
            text-align: center;
            color: green;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Add Role</h2>

    <!-- ✅ OPENING form:form -->
    <form:form
            action="/role/addRoleJpa"
            method="post"
            modelAttribute="roleDto">

        <label>Role Name:</label>
        <form:input path="name" placeholder="Enter role name"/>
        <form:errors path="name" cssStyle="color:red"/>

        <button type="submit">Add Role</button>

    </form:form>
    <!-- ✅ CLOSING form:form -->

</div>

</body>
</html>
