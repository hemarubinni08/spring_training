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
<tr> <th>Name</th> <td>${userDetails.name}</td> </tr>
<tr> <th>Age</th> <td>${userDetails.age}</td> </tr>
<tr> <th>Email</th> <td>${userDetails.email}</td> </tr>
<tr> <th>Phone</th> <td>${userDetails.phoneNo}</td> </tr>
</table>
</body>
</html>