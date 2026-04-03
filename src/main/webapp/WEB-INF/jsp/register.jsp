<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Register</title>
</head>
<body>

<h2>User Registration</h2>

<c:if test="${not empty errorMessage}">
    <p style="color:red">${errorMessage}</p>
</c:if>

<form:form method="post"
           action="${pageContext.request.contextPath}/user/register"
           modelAttribute="user">

    <form:input path="name" placeholder="Enter your full name"/><br><br>

    <form:input path="email" placeholder="Enter your email address"/><br><br>

    <form:input path="phoneNo" placeholder="Enter phone number"/><br><br>

    <form:input path="userName" placeholder="Choose a username"/><br><br>

    <form:input path="age" placeholder="Enter age"/><br><br>

    <input type="submit" value="Register"/>
</form:form>

</body>
</html>