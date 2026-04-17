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

        /* ✅ TOP NAV BUTTONS */
        .top-nav {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            gap: 8px;
        }

        .nav-btn {
            padding: 6px 14px;
            background: rgba(255,255,255,0.2);
            color: white;
            text-decoration: none;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            transition: background 0.3s ease;
        }

        .nav-btn:hover {
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
        }

        .form-group input[readonly] {
            background: #f3f4f6;
        }

        .footer {
            background: #f9fafb;
            padding: 15px;
            text-align: center;
        }

        .btn {
            padding: 10px 25px;
            background: #4f46e5;
            color: white;
            border: none;
            border-radius: 25px;
            font-weight: 600;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="profile-card">

    <!-- HEADER -->
    <div class="header">

        <!-- ✅ HOME + BACK BUTTON -->
        <div class="top-nav">
            <a href="/" class="nav-btn">Home</a>
            <a href="/user/display" class="nav-btn">Users</a>
        </div>

        <div class="avatar">
            ${user.name.substring(0,1)}
        </div>
        <h2>${user.name}</h2>
        <div>@${user.userName}</div>
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

            <div class="form-group">
                <label>Password</label>
                <input type="text" name="password" value="${user.password}" />
            </div>

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