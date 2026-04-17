<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Node</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }
        .container {
            width: 40%;
            margin: 60px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        button {
            margin-top: 20px;
            padding: 10px;
            width: 100%;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .error {
            color: red;
            text-align: center;
        }
        .back {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<div class="container">
    <h2 style="text-align:center">Update Node</h2>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <form:form method="post"
               action="${pageContext.request.contextPath}/node/update"
               modelAttribute="nodeDto">

        <form:hidden path="id"/>

        <label>Node Name:</label>
        <form:input path="name" required="true"/>

        <label>Node Path:</label>
        <form:input path="path" required="true"/>

        <label>Role:</label>
        <form:select path="role" required="true">
            <form:option value="" label="-- Select Role --"/>
            <c:forEach var="r" items="${roles}">
                <form:option value="${r.name}">${r.name}</form:option>
            </c:forEach>
        </form:select>

        <label>Roles:</label>
        <form:select path="roles" multiple="true">
            <c:forEach var="r" items="${roles}">
                <form:option value="${r.name}">${r.name}</form:option>
            </c:forEach>
        </form:select>

        <button type="submit">Update</button>
    </form:form>

    <div class="back">
        <a href="${pageContext.request.contextPath}/node/list">← Back to list</a>
    </div>
</div>

</body>
</html>