<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - ${u.name}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            color: #333;
            display: flex;
            justify-content: center;
        }

        .container {
            max-width: 500px;
            width: 100%;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }

        .header {
            border-bottom: 2px solid #eeeeee;
            padding-bottom: 15px;
            margin-bottom: 25px;
            text-align: center;
        }

        h2 { margin: 0; color: #2c3e50; }

        .form-group { margin-bottom: 15px; }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 13px;
            color: #666;
            text-transform: uppercase;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .readonly-field {
            background-color: #f9f9f9;
            color: #999;
            cursor: not-allowed;
        }

        /* Scrollable box for multi-role selection */
        .role-selector {
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 10px;
            max-height: 120px;
            overflow-y: auto;
            background: #fafafa;
        }

        .role-option {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
        }

        .role-option input {
            width: auto;
            margin-right: 10px;
        }

        .btn-save {
            width: 100%;
            background-color: #3498db;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn-save:hover { background-color: #2980b9; }

        .btn-cancel {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            color: #7f8c8d;
            font-size: 14px;
        }

        .status-msg {
            background-color: #e8f4fd;
            color: #3498db;
            padding: 10px;
            border-radius: 4px;
            text-align: center;
            margin-bottom: 20px;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2>Edit User Profile</h2>
    </div>

    <c:if test="${not empty u.message}">
        <div class="status-msg">${u.message}</div>
    </c:if>

    <form action="/user/update" method="POST">

        <div class="form-group">
            <label>Database ID (Read-Only)</label>
            <input type="text" name="id" class="readonly-field" value="${u.id}" readonly>
        </div>

        <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="name" value="${u.name}" required>
        </div>

        <div class="form-group">
            <label>Username</label>
            <input type="text" name="userName" value="${u.userName}" required>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <input type="email" name="email" value="${u.email}" required>
        </div>

        <div class="form-group">
            <label>Primary Role</label>
            <select name="role" required>
                <c:forEach var="role" items="${roles}">
                    <option value="${role.name}" ${role.name == u.role ? 'selected' : ''}>
                        ${role.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Additional Access Roles</label>
            <div class="role-selector">
                <c:forEach var="r" items="${roles}">
                    <label class="role-option">
                        <input type="checkbox" name="roles" value="${r.name}"
                               ${fn:contains(u.roles, r.name) ? 'checked' : ''}>
                        ${r.name}
                    </label>
                </c:forEach>
            </div>
        </div>

        <div class="form-group" style="display: flex; gap: 15px;">
            <div style="flex: 1;">
                <label>Age</label>
                <input type="number" name="age" value="${u.age}" required>
            </div>
            <div style="flex: 1;">
                <label>Date of Birth</label>
                <input type="date" name="dateOfBirth" value="${u.dateOfBirth}" required>
            </div>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <input type="text" name="phoneNo" value="${u.phoneNo}" required>
        </div>

        <button type="submit" class="btn-save">Save Changes</button>
        <a href="/user/getAllUsers" class="btn-cancel">Cancel and Go Back</a>
    </form>
</div>

</body>
</html>