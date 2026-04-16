<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Role</title>
</head>
<body>

<form action="/role/editrolejpa" method="post">
    <table border="1">
        <tr>
            <th>ID</th>
            <td><input type="text" name="id" value="${roleDetails.id}" readonly></td>
        </tr>
        <tr>
        <tr>
            <th>Name</th>
            <td><input type="text" name="name" value="${roleDetails.name}"></td>
        </tr>
    </table><br>
    <input type="submit" name="save" value="Save">
</form>

</body>
</html>