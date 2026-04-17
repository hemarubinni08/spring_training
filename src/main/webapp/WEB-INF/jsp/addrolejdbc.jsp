<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Add Role</title>
</head>
<body>

<h2>Add Role</h2>

<form:form action="${pageContext.request.contextPath}/role/addrolejdbc"
           method="post"
           modelAttribute="roleDto">

    <label>Name:</label>
    <form:input path="name" />
    <br><br>

    <input type="submit" value="Save Role" />

</form:form>

<br>
<a href="${pageContext.request.contextPath}/role/allrolesjdbc">
    View Roles
</a>

</body>
</html>