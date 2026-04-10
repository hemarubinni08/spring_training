<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Edit Profile</title>
</head>
<body>

<h2>Edit User Profile</h2>

<c:if test="${not empty errorMessage}">
    <p style="color:red;">
        ${errorMessage}
    </p>
</c:if>

<c:if test="${not empty successMessage}">
    <p style="color:green;">
        ${successMessage}
    </p>
</c:if>

<form method="post"
      action="${pageContext.request.contextPath}/user/userProfileJdbc">

    <input type="hidden" name="id" value="${user.id}" />

    <p>
        Name:<br>
        <input type="text" name="name" value="${user.name}" required />
    </p>

    <p>
        Email:<br>
        <input type="email" name="email" value="${user.email}" required />
    </p>

    <p>
        Phone:<br>
        <input type="text" name="phoneNo" value="${user.phoneNo}" />
    </p>

    <p>
        Username:<br>
        <input type="text" name="userName" value="${user.userName}" required />
    </p>

    <input type="submit" value="Update" />

</form>

</body>
</html>