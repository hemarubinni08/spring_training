<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 460px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 0 5px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 14px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        select[multiple] {
            height: 90px;
        }

        .hint {
            font-size: 12px;
            color: #666;
            margin-top: -8px;
            margin-bottom: 15px;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }

        button:hover {
            background: #43a047;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 12px;
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Edit User</h2>

    <c:if test="${error != null}">
                <div class="alert alert-error">${error}</div>
            </c:if>

            <c:if test="${success != null}">
                <div class="alert alert-success">${success}</div>
            </c:if>


    <form action="/user/editUser/${user.id}" method="post">

        <!-- USER ID -->
        <input type="hidden" name="id" value="${user.id}">

        <!-- BASIC DETAILS -->
        <label>Full Name</label>
        <input type="text" name="name" value="${user.name}" required>

        <label>Username</label>
        <input type="text" name="userName" value="${user.userName}" required>

        <label>Email</label>
        <input type="email" name="email" value="${user.email}" required>

        <label>Phone Number</label>
        <input type="tel" name="phoneNo" value="${user.phoneNo}" required>

        <label>Date of Birth</label>
        <input type="date" name="dateOfBirth" value="${user.dateOfBirth}" required>

        <label>Age</label>
        <input type="number" name="age" value="${user.age}" />

        <!-- PRIMARY ROLE -->
        <label>Primary Role</label>
        <select name="role">
            <option value="">-- Select Primary Role --</option>
            <c:forEach items="${roleList}" var="roleObj">
                <option value="${roleObj.name}">
                    ${roleObj.name}
                </option>
            </c:forEach>
        </select>

        <!-- MULTIPLE ROLES -->
        <label>Additional Roles</label>
        <select name="roles" multiple>
            <c:forEach items="${roleList}" var="roleObj">
                <option value="${roleObj.name}">
                    ${roleObj.name}
                </option>
            </c:forEach>
        </select>

        <div class="hint">
            Hold Ctrl (Windows) or Cmd (Mac) to select multiple roles
        </div>

        <button type="submit">Update User</button>

        <a href="/user/getAllUsers" class="back-link">
            Back to User List
        </a>

    </form>
</div>

</body>
</html>