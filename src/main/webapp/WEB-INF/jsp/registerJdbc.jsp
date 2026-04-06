<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Register</title>
</head>
<body>

<h2>User Registration</h2>

<form:form method="post" modelAttribute="userDto" action="/user/registerJdbc">

    Name: <form:input path="name"/><br/><br/>
    Email: <form:input path="email"/><br/><br/>
    Phone: <form:input path="phoneNo"/><br/><br/>
    Username: <form:input path="userName"/><br/><br/>
    Password: <form:password path="password"/><br/><br/>
    Age: <form:input path="age"/><br/><br/>

    <input type="submit" value="Register"/>
</form:form>

</body>
</html>