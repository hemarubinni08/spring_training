<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>

<style>
    body {
        font-family: "Segoe UI", Arial, sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2); /* ✅ changed */
        margin: 0;
        padding: 0;
    }

    .profile-container {
        max-width: 520px;
        background: #ffffff;
        margin: 80px auto;
        padding: 30px;
        border-radius: 14px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
        transition: transform 0.2s ease-in-out;
    }

    .profile-container:hover {
        transform: translateY(-3px);
    }

    .profile-container h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #4a3aff; /* ✅ changed */
        font-weight: 600;
    }

    .profile-row {
        margin-bottom: 16px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 14px;
        background-color: #f5f7ff; /* ✅ changed */
        border-radius: 8px;
    }

    .label {
        font-weight: 600;
        color: #4a3aff; /* ✅ changed */
    }

    .value {
        color: #37474f;
    }

    .back-btn {
        display: block;
        margin-top: 30px;
        text-align: center;
    }

    .back-btn a {
        text-decoration: none;
        background: linear-gradient(135deg, #4a3aff, #6a5cff); /* ✅ changed */
        color: #fff;
        padding: 10px 22px;
        border-radius: 25px;
        font-weight: 500;
        border: 1px solid #4a3aff; /* ✅ changed */
        transition: all 0.3s ease;
    }

    .back-btn a:hover {
        background: #ffffff;
        color: #4a3aff; /* ✅ changed */
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
    </c:if>

    <c:if test="${user == null}">
        <h3 style="color:red; text-align:center;">
            User not found
        </h3>
    </c:if>

    <div class="back-btn">
        <a href="/user/usersListJdbc">Back to Users</a>
    </div>

</div>

</body>
</html>