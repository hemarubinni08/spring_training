<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User Profile</title>
    <style>
        /* General Layout */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            min-height: 100vh;
            background-color: #f4f4f4;
            color: #333;
        }

        /* Basic Sidebar */
        aside {
            width: 200px;
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
        }

        aside h2 {
            padding: 0 20px;
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        aside nav a {
            display: block;
            color: #bdc3c7;
            padding: 12px 20px;
            text-decoration: none;
            border-bottom: 1px solid #34495e;
        }

        aside nav a:hover {
            background-color: #34495e;
            color: white;
        }

        /* Main Content Area */
        main {
            flex: 1;
            padding: 30px;
        }

        .form-container {
            background: white;
            padding: 25px;
            border: 1px solid #ccc;
            max-width: 600px;
            border-radius: 4px;
        }

        h2 { margin-top: 0; }

        /* Form Styling */
        .field-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 14px;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box; /* Ensures padding doesn't affect width */
        }

        .roles-selector {
            border: 1px solid #ccc;
            padding: 10px;
            max-height: 150px;
            overflow-y: auto;
            background: #fafafa;
        }

        .roles-selector label {
            font-weight: normal;
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 5px;
        }

        /* Buttons */
        .btn-group {
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            display: inline-block;
        }

        .btn-submit { background-color: #27ae60; color: white; }
        .btn-cancel { background-color: #95a5a6; color: white; margin-left: 10px; }

        .section-header {
            border-bottom: 1px solid #eee;
            margin: 20px 0 10px;
            padding-bottom: 5px;
            color: #2c3e50;
            font-size: 16px;
        }
    </style>
</head>

<body>
    <main>
        <div class="form-container">
            <h2>User Profile: ${user.name}</h2>
            <p style="font-size: 0.9rem; color: #666;">ID: ${user.id}</p>

            <form method="post" action="${pageContext.request.contextPath}/user/updateprofiledata">
                <input type="hidden" name="id" value="${user.id}" />

                <div class="field-group">
                    <label>Full Name</label>
                    <input type="text" name="name" value="${user.name}" required />
                </div>

                <div class="field-group">
                    <label>Email Address</label>
                    <input type="text" name="email" value="${user.email}" required />
                </div>

                <div class="field-group">
                    <label>Username</label>
                    <input type="text" name="userName" value="${user.userName}" required />
                </div>

                <div class="section-header">Roles & Permissions</div>

                <div class="field-group">
                    <label>Primary Role</label>
                    <select name="role">
                        <option value="">-- Select --</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.name}" <c:if test="${user.role == role.name}">selected</c:if>>
                                ${role.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="field-group">
                    <label>Additional Roles (Check all that apply)</label>
                    <div class="roles-selector">
                        <c:forEach var="role" items="${roles}">
                            <label>
                                <input type="checkbox" name="roles" value="${role.name}"
                                    <c:if test="${user.roles != null && user.roles.contains(role.name)}">checked</c:if> />
                                ${role.name}
                            </label>
                        </c:forEach>
                    </div>
                </div>

                <div class="field-group">
                    <label>Age</label>
                    <input type="number" name="age" value="${user.age}" />
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn btn-submit">Update Profile</button>
                    <a href="${pageContext.request.contextPath}/user/display" class="btn btn-cancel">Cancel</a>
                </div>
            </form>
        </div>
    </main>
</body>
</html>