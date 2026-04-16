<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Node</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
        }

        .container {
            width: 400px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 12px;
        }

        select, input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
        }

        .btn-update {
            background-color: #007bff;
            color: white;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 10px;
            padding: 10px;
            border-radius: 4px;
        }

        .btn-back {
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 10px;
            padding: 10px;
            border-radius: 4px;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Update Node</h2>

    <form:form action="${pageContext.request.contextPath}/node/updateNode"
               method="post" modelAttribute="node">


        <!-- Hidden ID -->
        <form:hidden path="id"/>

        <label>Node Name</label>
        <form:input path="name"/>

        <label>Path</label>
        <form:input path="path"/>

        <!-- ✅ SINGLE ROLE -->
        <label>Role</label>
        <form:select path="role">
            <form:option value="" label="-- Select Role --"/>
            <form:options items="${roles}" itemValue="name" itemLabel="name"/>
        </form:select>

        <!-- ✅ MULTIPLE ROLES -->
        <label>Roles(Multi)</label>
        <form:select path="roles" multiple="true">
            <form:options items="${roles}" itemValue="name" itemLabel="name"/>
        </form:select>

        <button type="submit" class="btn btn-update">Update</button>
    </form:form>

    <!-- Delete -->
    <a class="btn-delete"
       href="${pageContext.request.contextPath}/node/delete?id=${nodeDto.id}"
       onclick="return confirm('Are you sure you want to delete this node?');">
        Delete
    </a>

    <!-- Back -->
    <a class="btn-back"
       href="${pageContext.request.contextPath}/node/list">
        Back to List
    </a>
</div>

</body>
</html>