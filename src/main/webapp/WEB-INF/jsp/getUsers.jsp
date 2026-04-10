<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>All Users</title>
</head>
<body>

<h2>User List</h2>

<table border="1" cellpadding="8" cellspacing="0">
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
            <td><a href="${pageContext.request.contextPath}/user/profileJdbc/id/${user.id}">
                    ${user.id}
                </a></td>
                        <td>${user.name}</td>

                        <td>
                            <a href="${pageContext.request.contextPath}/user/profileJdbc/id/${user.id}">
                                ${user.email}
                            </a>

                        </td>

                        <td>${user.phoneNo}</td>
                        <td>${user.userName}</td>

            <td>
                <c:url var="deleteUrl" value="/user/delete/${user.email}" />
                <form action="${deleteUrl}" method="post"
                      onsubmit="return confirm('Are you sure you want to delete this user?');">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>

</table>

</body>
</html>