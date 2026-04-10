<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>All Users</title>
</head>
<body>

<h2>User List</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Username</th>
        <th>Action</th>
    </tr>

    <c:forEach var="user" items="${getUsers}">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>

            <td>
                <a href="/user/profileJdbc/${user.email}">
                    ${user.email}
                </a>
            </td>

            <td>${user.phoneNo}</td>
            <td>${user.userName}</td>

            <td>
                <form action="/user/delete/${user.email}"
                      method="post"
                      onsubmit="return confirm('Are you sure you want to delete this user?');">
                    <button type="submit">Delete</button>
                </form>
            </td>

        </tr>
    </c:forEach>
</table>

</body>
</html>