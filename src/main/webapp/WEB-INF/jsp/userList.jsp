<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
</head>

<body>

<h2>List of Users</h2>

<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Action</th>   <!-- ✅ New column -->
    </tr>

    <c:forEach var="user" items="${users}">
        <tr>
            <td><a href="/user/userById/${user.id}">${user.id}</a></td>
            <td>${user.name}</td>
            <td>
                    ${user.email}
            </td>
            <td>${user.phoneNo}</td>
            <td>
                <a href="/user/deleteUser/${user.email}"
                   onclick="return confirm('Are you sure you want to delete this user?');">
                    Delete
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>