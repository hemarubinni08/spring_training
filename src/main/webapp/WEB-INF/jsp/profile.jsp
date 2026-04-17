<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>View User Profile</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .profile-card {
            width: 440px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #4CAF50, #2E7D32);
            color: white;
            text-align: center;
            padding: 30px 20px;
            position: relative;
        }

        /* ✅ BACK BUTTON */
        .back-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 6px 14px;
            background: rgba(255,255,255,0.2);
            color: white;
            text-decoration: none;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            transition: background 0.3s ease;
        }

        .back-btn:hover {
            background: rgba(255,255,255,0.35);
        }

        .avatar {
            width: 100px;
            height: 100px;
            background: white;
            color: #4CAF50;
            border-radius: 50%;
            margin: 0 auto 10px;
            font-size: 40px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .body {
            padding: 25px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #555;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            border-radius: 8px;
            border: 1px solid #ccc;
            background: #f3f4f6;
            cursor: not-allowed;
        }
    </style>
</head>

<body>

<div class="profile-card">

    <!-- HEADER -->
    <div class="header">

        <!-- ✅ BACK TO USER LIST -->
        <a href="/user/display" class="back-btn">← Back to Users</a>

        <div class="avatar">
            ${user.name.substring(0,1)}
        </div>
        <h2>${user.name}</h2>
        <div>@${user.userName}</div>
    </div>

    <!-- DISPLAY ONLY -->
    <div class="body">

        <div class="form-group">
            <label>User ID</label>
            <input type="text" value="${user.id}" readonly />
        </div>

        <div class="form-group">
            <label>Name</label>
            <input type="text" value="${user.name}" readonly />
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" value="${user.email}" readonly />
        </div>

        <div class="form-group">
            <label>Username</label>
            <input type="text" value="${user.userName}" readonly />
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <input type="text" value="${user.phoneNo}" readonly />
        </div>

        <div class="form-group">
            <label>Age</label>
            <input type="number" value="${user.age}" readonly />
        </div>

        <div class="form-group">
            <label>Date of Birth</label>
            <input type="text" value="${user.dateOfBirth}" readonly />
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="text" value="${user.password}" readonly />
        </div>

        <div class="form-group">
            <label>Role</label>
            <select disabled>
                <c:forEach var="role" items="${roles}">
                    <option value="${role.name}"
                        <c:if test="${role.name eq user.roleName}">
                            selected
                        </c:if>>
                        ${role.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Roles</label>
            <select multiple disabled size="4">
                <c:forEach var="role" items="${roles}">
                    <option value="${role.name}"
                        <c:forEach var="assignedRole" items="${user.roleNames}">
                            <c:if test="${assignedRole eq role.name}">
                                selected
                            </c:if>
                        </c:forEach>>
                        ${role.name}
                    </option>
                </c:forEach>
            </select>
        </div>

    </div>

</div>

</body>
</html>