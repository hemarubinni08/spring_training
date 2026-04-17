<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Display Roles</title>
</head>
<body>

<h2>Roles List</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Role</th>
        <th>Delete</th>
    </tr>

    <c:forEach var="role" items="${roleDto}">
        <tr>
            <td><a href = "/role/getRoleDetails/${role.id}">${role.id}</a></td>
            <td>${role.name}</td>
            <td>
            <a href="${pageContext.request.contextPath}/role/deleteRoleJpa?id=${role.id}"class="delete-btn">
            Delete
            </a>
            </td>

        </tr>
    </c:forEach>

</table>

<br>
<a href="${pageContext.request.contextPath}/role/addrolejdbc">
    Add New Role
</a>

</body>
</html>
