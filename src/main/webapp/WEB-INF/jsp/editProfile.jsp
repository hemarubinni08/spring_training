<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User Profile</title>

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

        /* ===== HEADER ===== */
        .header {
            background-color: #f1f5f9;
            text-align: center;
            padding: 26px 20px 22px;
            position: relative;
            border-bottom: 1px solid #e2e8f0;
        }

        /* ✅ BACK BUTTON (LEFT) */
        .top-nav {
            position: absolute;
            top: 18px;
            left: 18px;
        }

        .nav-btn {
            padding: 6px 14px;
            background-color: #eef0f3;
            color: #374151;
            text-decoration: none;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            border: 1px solid #d1d5db;
        }

        .nav-btn:hover {
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

        /* ===== FORM BODY ===== */
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
            background-color: #ffffff;
            color: #1f2937;
        }

        .form-group input[readonly] {
            background-color: #f9fafb;
        }

        /* ===== FOOTER ===== */
        .footer {
            background-color: #f9fafb;
            padding: 14px;
            text-align: center;
            border-top: 1px solid #e5e7eb;
        }

        .btn {
            padding: 9px 26px;
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #1d4ed8;
        }
    </style>
</head>

<body>

<div class="profile-card">

    <!-- HEADER -->
    <div class="header">

        <!-- ✅ BACK BUTTON ONLY -->
        <div class="top-nav">
            <a href="/user/display" class="nav-btn">Back</a>
        </div>

        <div class="avatar">
            ${user.name.substring(0,1)}
        </div>

        <h2>${user.name}</h2>
        <div class="username">@${user.userName}</div>
    </div>

    <!-- EDIT FORM -->
    <form action="${pageContext.request.contextPath}/user/editProfile/${user.id}" method="post">

        <div class="body">

            <div class="form-group">
                <label>User ID</label>
                <input type="text" name="id" value="${user.id}" readonly />
            </div>

            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" value="${user.name}" />
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" value="${user.email}" />
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="userName" value="${user.userName}" />
            </div>

            <div class="form-group">
                <label>Phone Number</label>
                <input type="text" name="phoneNo" value="${user.phoneNo}" />
            </div>

            <div class="form-group">
                <label>Age</label>
                <input type="number" name="age" value="${user.age}" />
            </div>

            <div class="form-group">
                <label>Date of Birth</label>
                <input type="text" name="dateOfBirth" value="${user.dateOfBirth}" />
            </div>

            <!-- ✅ PASSWORD REMOVED -->

            <!-- SINGLE ROLE -->
            <div class="form-group">
                <label>Role</label>
                <select name="roleName">
                    <option value="">-- Select Role --</option>
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.name}"
                            <c:if test="${fn:trim(role.name) eq fn:trim(user.roleName)}">
                                selected="selected"
                            </c:if>>
                            ${role.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!-- MULTI ROLE -->
            <div class="form-group">
                <label>Roles</label>
                <select name="roleNames" multiple size="4">
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.name}"
                            <c:forEach var="r" items="${user.roleNames}">
                                <c:if test="${fn:trim(r) eq fn:trim(role.name)}">
                                    selected="selected"
                                </c:if>
                            </c:forEach>>
                            ${role.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

        </div>

        <div class="footer">
            <button type="submit" class="btn">Save Changes</button>
        </div>

    </form>

</div>

</body>
</html>