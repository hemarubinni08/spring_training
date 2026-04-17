<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            height: 100vh;
            background: radial-gradient(
                circle,
                #ffffff 0%,
                #b8b4ff 35%,
                #1900c1 100%
            );
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .profile-card {
            background: #ffffff;
            padding: 30px 35px;
            border-radius: 12px;
            width: 420px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #1900c1;
            margin-bottom: 20px;
        }

        .profile-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #e0e0e0;
        }

        .profile-row:last-child {
            border-bottom: none;
        }

        .label {
            font-weight: 600;
            color: #444;
        }

        .value {
            color: #222;
        }

        .back-btn {
            margin-top: 25px;
            display: block;
            text-align: center;
            padding: 10px 0;
            background-color: #1900c1;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
        }

        .back-btn:hover {
            background-color: #140096;
        }
    </style>
</head>

<body>

<div class="profile-card">
    <h2>User Profile</h2>

    <div class="profile-row">
        <span class="label">ID</span>
        <span class="value">${user.id}</span>
    </div>

    <div class="profile-row">
        <span class="label">Name</span>
        <span class="value">${user.name}</span>
    </div>

    <div class="profile-row">
        <span class="label">Email</span>
        <span class="value">${user.email}</span>
    </div>

    <div class="profile-row">
        <span class="label">Phone</span>
        <span class="value">${user.phoneNo}</span>
    </div>

    <div class="profile-row">
        <span class="label">Username</span>
        <span class="value">${user.userName}</span>
    </div>

    <div class="profile-row">
        <span class="label">Age</span>
        <span class="value">${user.age}</span>
    </div>

    <a href="${pageContext.request.contextPath}/user/usersJpa" class="back-btn">
        Back to Users
    </a>
</div>

</body>
</html>