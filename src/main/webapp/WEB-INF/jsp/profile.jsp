<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>User Profile</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #eef2f3, #dfe9f3);
        }

        .header {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            padding: 18px 25px;
            color: white;
            font-size: 22px;
            font-weight: bold;
            box-shadow: 0px 3px 8px rgba(0,0,0,0.2);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .back-btn {
            background: white;
            color: #4facfe;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 13px;
        }

        .back-btn:hover {
            background: #e6f0ff;
        }

        .content {
            padding: 30px;
        }

        .profile-container {
            width: 360px;
            margin: auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 15px;
            color: #333;
        }

        .profile-item {
            margin-bottom: 10px;
        }

        .label {
            font-weight: 600;
            display: block;
            margin-bottom: 4px;
            font-size: 13px;
        }

        input, select {
            width: 100%;
            padding: 7px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 13px;
        }

        .btn {
            width: 100%;
            margin-top: 12px;
            padding: 9px;
            background: linear-gradient(to right, #007bff, #00c6ff);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 8px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 10px;
            font-size: 13px;
        }
    </style>
</head>

<body>

<div class="header">
    Edit Profile
    <button class="back-btn" onclick="window.location.href='/user/users'">← Back</button>
</div>

<div class="content">

    <div class="profile-container">
        <h2>Update User</h2>

        <c:if test="${not empty message}">
            <div class="message">${message}</div>
        </c:if>

        <form action="/user/updateUserJpa" method="post">

            <input name="id" value="${user.id}" readonly />

            <div class="profile-item">
                <label class="label">Name:</label>
                <input type="text" name="name" value="${user.name}" />
            </div>

            <div class="profile-item">
                <label class="label">Email:</label>
                <input type="email" name="email" value="${user.email}" />
            </div>

            <div class="profile-item">
                <label class="label">Phone:</label>
                <input type="text" name="phoneNo" value="${user.phoneNo}" />
            </div>

            <div class="profile-item">
                <label class="label">Username:</label>
                <input type="text" name="userName" value="${user.userName}" />
            </div>

            <div class="profile-item">
                <label class="label">Password:</label>
                <input type="text" name="password" value="${user.password}" />
            </div>

            <div class="profile-item">
                <label class="label">Age:</label>
                <input type="number" name="age" value="${user.age}" />
            </div>

            <div class="profile-item">
                <label class="label">Role:</label>
                <select name="role" required>
                    <option value="">-- Select Role --</option>
                    <c:forEach var="r" items="${roles}">
                        <option value="${r.name}" ${r.name == user.role ? 'selected' : ''}>
                            ${r.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="profile-item">
                <label class="label">Roles:</label>
                <select name="roles" multiple required style="height:90px;">
                    <c:forEach var="r" items="${roles}">
                        <option value="${r.name}" ${r.name == user.role ? 'selected' : ''}>
                            ${r.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn">Update Profile</button>

        </form>
    </div>

</div>

</body>
</html>