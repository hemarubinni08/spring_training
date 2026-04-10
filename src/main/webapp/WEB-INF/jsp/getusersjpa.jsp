<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>All Users (JPA)</title>
</head>
<body>

<h2>User List (JPA)</h2>

<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Username</th>
        <th>Actions</th>
    </tr>

    <c:forEach var="user" items="${getUsersJpa}">
        <tr>
            <td>
<a href="${pageContext.request.contextPath}/user/profileJpa/id/${user.id}">                    ${user.id}
                </a>
            </td>

            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.phoneNo}</td>
            <td>${user.userName}</td>

            <td>
                <form
                    action="${pageContext.request.contextPath}/user/deleteJpa/${user.email}"
                    method="get"
                    onsubmit="return confirm('Are you sure you want to delete this user?');">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>

</table>

</body>
</html>