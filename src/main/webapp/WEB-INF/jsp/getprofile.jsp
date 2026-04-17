<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
</head>
<body>

    <h2>User Profile</h2>

    <p><b>ID:</b> ${userDto.id}</p>
    <p><b>Name:</b> ${userDto.name}</p>
    <p><b>Email:</b> ${userDto.email}</p>
    <p><b>Phone:</b> ${userDto.phoneNo}</p>
    <p><b>Username:</b> ${userDto.userName}</p>
    <p><b>Age:</b> ${userDto.age}</p>

    <a href="${pageContext.request.contextPath}/user/editprofileJdbc">
        Update
    </a>

</body>
</html>