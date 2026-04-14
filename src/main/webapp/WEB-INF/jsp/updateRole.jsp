<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
</head>
<body>

<h2>Update User Details</h2>

<form action="/role/updateRole" method="post">

    <!-- User ID (Readonly, but submitted) -->
    <label>User ID:</label>

    <input type="hidden" name="id" value="${role.id}" readonly />



    <!-- Name -->
    <label>Name:</label>

    <input type="text" name="name" value="${role.name}" required />





    <!-- Submit -->
    <button type="submit">Update</button>

</form>



<a href="/role/allRoles">
    Back to User List
</a>

</body>
</html>