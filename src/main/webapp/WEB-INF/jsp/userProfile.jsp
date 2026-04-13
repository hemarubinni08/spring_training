<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background-image: linear-gradient(-225deg, #B7F8DB 0%, #50A7C2 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .profile-container {
        width: 520px;
        background: #ffffff;
        padding: 30px;
        border-radius: 28px;
        box-shadow: 0 18px 35px rgba(0, 0, 0, 0.15);
    }

    .profile-header {
        text-align: center;
        margin-bottom: 25px;
    }

    .avatar {
        width: 80px;
        height: 80px;
        background: linear-gradient(120deg, #1d2b64, #6dd5ed);
        color: #fff;
        border-radius: 50%;
        line-height: 80px;
        font-size: 34px;
        font-weight: 600;
        margin: 0 auto 10px auto;
    }

    h2 {
        margin: 8px 0;
        color: #333;
    }

    .profile-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 12px 0;
        border-bottom: 1px solid #eee;
        font-size: 14px;
    }

    .label {
        font-weight: 600;
        color: #555;
        width: 40%;
    }

    .value {
        color: #333;
        width: 60%;
        text-align: right;
    }

    input {
        width: 60%;
        padding: 7px 10px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 13px;
        display: none;
    }

    .actions {
        text-align: center;
        margin-top: 25px;
    }

    button {
        padding: 9px 22px;
        border-radius: 20px;
        border: none;
        font-size: 13px;
        font-weight: 600;
        cursor: pointer;
    }

    .edit-btn {
        background: linear-gradient(120deg, #36d1dc, #5b86e5);
        color: white;
    }

    .save-btn {
        background: linear-gradient(120deg, #22c55e, #16a34a);
        color: white;
        display: none;
        margin-left: 10px;
    }
</style>
</head>

<body>

<div class="profile-container">

<form action="${pageContext.request.contextPath}/user/updateUserJdbc" method="post">

<input type="hidden" name="id" value="${userDetailsDto.id}">

<div class="profile-header">
    <div class="avatar">${userDetailsDto.name.substring(0,1)}</div>
    <h2>User Profile</h2>
</div>

<div class="profile-row">
    <span class="label">Name</span>
    <span class="value">${userDetailsDto.name}</span>
    <input type="text" name="name" value="${userDetailsDto.name}">
</div>

<div class="profile-row">
    <span class="label">Email</span>
    <span class="value">${userDetailsDto.email}</span>
    <input type="text" name="email" value="${userDetailsDto.email}">
</div>

<div class="profile-row">
    <span class="label">Phone</span>
    <span class="value">${userDetailsDto.phoneNo}</span>
    <input type="text" name="phoneNo" value="${userDetailsDto.phoneNo}">
</div>

<div class="profile-row">
    <span class="label">Age</span>
    <span class="value">${userDetailsDto.age}</span>
    <input type="number" name="age" value="${userDetailsDto.age}">
</div>

<div class="profile-row">
    <span class="label">DOB</span>
    <span class="value">${userDetailsDto.dateOfBirth}</span>
    <input type="date" name="dateOfBirth" value="${userDetailsDto.dateOfBirth}">
</div>

<div class="profile-row">
    <span class="label">Username</span>
    <span class="value">${userDetailsDto.userName}</span>
    <input type="text" name="userName" value="${userDetailsDto.userName}">
</div>

<div class="actions">
    <button type="button" class="edit-btn" onclick="enableEdit()">Edit Profile</button>
    <button type="submit" class="save-btn">Save Changes</button>
</div>

</form>

<c:if test="${not empty userDetailsDto.message}">
    <div class="profile-row" style="justify-content:center;">
        <span style="color:${userDetailsDto.colour}; font-weight:600;">
            ${userDetailsDto.message}
        </span>
    </div>
</c:if>


</div>

<script>
function enableEdit(){
    document.querySelectorAll('.value').forEach(v => v.style.display = 'none');
    document.querySelectorAll('input').forEach(i => i.style.display = 'inline-block');
    document.querySelector('.edit-btn').style.display = 'none';
    document.querySelector('.save-btn').style.display = 'inline-block';
}
</script>

</body>
</html>