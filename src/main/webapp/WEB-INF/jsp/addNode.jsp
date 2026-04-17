<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Node</title>
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
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
        }
        td {
            padding: 10px;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        select[multiple] {
            height: 120px;
        }
        input[type="submit"] {
            background: #28a745;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            border: none;
        }
        input[type="submit"]:hover {
            background: #218838;
        }
        .success {
            color: green;
            text-align: center;
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
    <h2>Add Node</h2>
    <c:if test="${not empty message}">
        <p class="success">${message}</p>
    </c:if>
    <form:form action="/node/addNode" method="post" modelAttribute="nodeDto">
        <table>
            <form:hidden path="id"/>
            <tr>
                <td>Node Name</td>
                <td>
                    <form:input path="name" placeholder="Enter node name" required="true"/>
                </td>
            </tr>
            <tr>
                <td>Node Path</td>
                <td>
                    <form:input path="path" placeholder="Enter node path" required="true"/>
                </td>
            </tr>
            <tr>
                <td>Role</td>
                <td>
                    <select name="role" required>
                        <option value="">-- Select Role --</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.name}">${role.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Roles</td>
                <td>
                    <select name="roles" multiple required>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.name}">${role.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Add Node"/>
                </td>
            </tr>
        </table>
    </form:form>
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    <div class="back">
        <a href="${pageContext.request.contextPath}/node/list">← Back to List</a>
    </div>
</div>
</body>
</html>