<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Role</title>
</head>
<body>

<h2>Add Role</h2>

<!-- Success Message -->
<c:if test="${not empty role}">
    <p style="color: green;">${role}</p>
</c:if>

<!-- Role Form -->

<form:form method="post"
           action="/role/addRole"
           modelAttribute="roleDto">

    <table>
        <tr>
            <td>Role Name:</td>
            <td>
                <form:input path="name" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="submit" value="Add Role" />
            </td>
        </tr>
    </table>

</form:form>

</body>
</html>