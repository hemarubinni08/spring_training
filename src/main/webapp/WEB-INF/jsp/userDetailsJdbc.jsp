<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
</head>
<body>

<h2>Update User Details</h2>

<form action="updateUserJdbc" method="post">

    <label>User ID:</label><br>
    <input type="text" name="id" value="${user.id}" readonly /><br><br>

    <label>Name:</label><br>
    <input type="text" name="Name" value="${user.name}" required /><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" value="${user.email}" required /><br><br>

    <label>Phone Number:</label><br>
    <input type="text" name="phoneNo" value="${user.phoneNo}" required /><br><br>

    <button type="submit">Update</button>

</form>

<br>
<a href="/user/listOfUsersJdbc">
    Back to User List
</a>

</body>
</html>