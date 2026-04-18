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
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
            background-color: #f6f7f9;
            color: #1f2937;
        }

        .profile-card {
            width: 440px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        .header {
            background-color: #f1f5f9;
            text-align: center;
            padding: 28px 20px 24px;
            position: relative;
            border-bottom: 1px solid #e2e8f0;
        }

        .back-btn {
            position: absolute;
            top: 18px;
            left: 18px;
            padding: 6px 14px;
            background-color: #eef0f3;
            color: #374151;
            text-decoration: none;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            border: 1px solid #d1d5db;
        }

        .back-btn:hover {
            background-color: #e5e7eb;
        }

        .avatar {
            width: 90px;
            height: 90px;
            background-color: #e0e7ff;
            color: #1d4ed8;
            border-radius: 50%;
            margin: 0 auto 12px;
            font-size: 36px;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .header h2 {
            margin: 0;
            font-size: 22px;
            font-weight: 600;
        }

        .header .username {
            margin-top: 4px;
            font-size: 14px;
            color: #475569;
        }

        .body {
            padding: 22px;
        }

        .form-group {
            margin-bottom: 14px;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            color: #475569;
            margin-bottom: 4px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 9px 11px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
            background: #f9fafb;
            color: #1f2937;
            cursor: not-allowed;
        }
    </style>
</head>

<body>

<div class="profile-card">

    <div class="header">
        <a href="/user/display" class="back-btn">Back</a>

        <div class="avatar">
            ${user.name.substring(0,1)}
        </div>

        <h2>${user.name}</h2>
        <div class="username">@${user.userName}</div>
    </div>

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

        <!-- ✅ PASSWORD REMOVED -->

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