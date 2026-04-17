<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Add Role</title>
</head>
<body>

<h2>Edit Role</h2>

<form:form action="${pageContext.request.contextPath}/role/updateRole"
           method="post"
           modelAttribute="roleDto">

     <label>Id:</label>
    <form:input path="id" value = "${role.id}" type="hidden"/>
    <label>Name:</label>
    <form:input path="name" value = "${role.name}"/>
    <br><br>

    <input type="submit" value="Update role" />

</form:form>
${role.id}
<br>
<a href="${pageContext.request.contextPath}/role/displayJpa">
    View Roles
</a>
</body>
</html>