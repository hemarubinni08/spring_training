<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Users</title>
</head>
<body>
<table border="1">
<tr>
<th>Name</th>
<th>Age</th>
<th>Email(Param)</th>
<th>Email(Path)</th>
<th>Phone</th>
</tr>
<c:forEach items="${users}" var="user">
<tr>
<td>${user.name}</td>
<td>${user.age}</td>
<td><a href="/user/profilejdbc?email=${user.email}">${user.email}</a></td>
<td><a href="/user/profile/${user.email}">${user.email}</a></td>
<td><a href="/user/deleteUser?email=${user.email}">delete</a></td>
<td><a href="/user/deleteUserJdbc?email=${user.email}">deleteJdbc</a></td>
<td>${user.phoneNo}</td>
</tr>
</c:forEach>
</table>
</body>
</html>