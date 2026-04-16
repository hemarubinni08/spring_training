<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
        }

        .profile-container {
            max-width: 500px;
            background: #ffffff;
            margin: 60px auto;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }

        .profile-container h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .profile-row {
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
        }

        .label {
            font-weight: bold;
            color: #333;
        }

        .value {
            color: #555;
        }

        .back-btn {
            display: block;
            margin-top: 25px;
            text-align: center;
        }

        .back-btn a {
            text-decoration: none;
            background: #4CAF50;
            color: #fff;
            padding: 8px 16px;
            border-radius: 4px;
        }
    </style>
</head>

<body>

<div class="profile-container">

    <h2>User Profile</h2>

    <c:if test="${user != null}">
        <div class="profile-row">
            <span class="label">Full Name</span>
            <span class="value">${user.name}</span>
        </div>

        <div class="profile-row">
            <span class="label">Email</span>
            <span class="value">${user.email}</span>
        </div>

        <div class="profile-row">
            <span class="label">Username</span>
            <span class="value">${user.userName}</span>
        </div>

        <div class="profile-row">
            <span class="label">Phone No</span>
            <span class="value">${user.phoneNo}</span>
        </div>

        <div class="profile-row">
            <span class="label">Date of Birth</span>
            <span class="value">${user.dateOfBirth}</span>
        </div>

         <div class="profile-row">
                    <span class="label">Roles</span>
                    <span class="value">${user.roles}</span>
                </div>
    </c:if>

    <c:if test="${user == null}">
        <h3 style="color:red; text-align:center;">
            User not found
        </h3>
    </c:if>

    <div class="back-btn">
        <a href="/user/getAllUsers">Back to Users</a>
    </div>

</div>

</body>
</html>
``