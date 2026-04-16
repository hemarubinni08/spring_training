<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #eef2ff, #f8fafc);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    color: #1e293b;
}

/* Card */
.edit-card {
    width: 420px;
    background: #ffffff;
    padding: 28px;
    border-radius: 12px;
    border: 1px solid #e2e8f0;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
}

/* Title */
h2 {
    text-align: center;
    margin-bottom: 20px;
    font-weight: 600;
    color: #0f172a;
}

/* Labels */
label {
    font-size: 13px;
    margin-bottom: 5px;
    display: block;
    color: #475569;
}

/* Inputs */
input, select {
    width: 100%;
    padding: 10px;
    margin-bottom: 14px;
    border-radius: 8px;
    border: 1px solid #cbd5f5;
    background-color: #f8fafc;
    color: #1e293b;
    font-size: 14px;
}

/* Focus */
input:focus, select:focus {
    outline: none;
    border-color: #6366f1;
    box-shadow: 0 0 6px rgba(99,102,241,0.25);
    background-color: #ffffff;
}

/* Role list (same as register page) */
.role-list {
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 6px;
    max-height: 150px;
    overflow-y: auto;
    margin-bottom: 18px;
    background: #f9fafb;
}

/* PERFECT ALIGNMENT */
.role-item {
    display: grid;
    grid-template-columns: 1fr 30px;
    align-items: center;
    padding: 8px 6px;
    font-size: 14px;
    border-radius: 6px;
}

.role-item:hover {
    background-color: #eef2ff;
}

.role-item input[type="checkbox"] {
    justify-self: center;
}

/* Button */
button {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 8px;
    background: linear-gradient(135deg, #6366f1, #4f46e5);
    color: white;
    font-weight: 600;
    cursor: pointer;
}

button:hover {
    box-shadow: 0 5px 15px rgba(99,102,241,0.3);
}

/* Actions */
.actions {
    margin-top: 15px;
    text-align: center;
}

.cancel-btn {
    color: #4f46e5;
    text-decoration: none;
    font-size: 14px;
}

.cancel-btn:hover {
    text-decoration: underline;
}

/* Error */
.error {
    text-align: center;
    color: #ef4444;
    font-weight: 600;
}

</style>
</head>

<body>

<div class="edit-card">

<h2>Edit Profile</h2>

<c:if test="${not empty user}">

<form action="${pageContext.request.contextPath}/user/saveProfile" method="post">

    <input type="hidden" name="id" value="${user.id}" />

    <label>Name</label>
    <input type="text" name="name" value="${user.name}" required />

    <label>Email</label>
    <input type="email" name="email" value="${user.email}" required />

    <label>Phone</label>
    <input type="text" name="phoneNo" value="${user.phoneNo}" />

    <label>Username</label>
    <input type="text" name="userName" value="${user.userName}" />

    <label>Password</label>
    <input type="password" name="password" value="${user.password}" />

    <label>Age</label>
    <input type="number" name="age" value="${user.age}" />

    <label>Date of Birth</label>
    <input type="date" name="dateOfBirth" value="${user.dateOfBirth}" />

    <!-- PRIMARY ROLE -->
    <label>Primary Role</label>
    <select name="role" required>
        <c:forEach var="r" items="${roles}">
            <option value="${r.name}"
                <c:if test="${user.role eq r.name}">selected</c:if>>
                ${r.name}
            </option>
        </c:forEach>
    </select>

    <!-- MULTI ROLES (CLEAN VERSION) -->
    <label>Additional Roles</label>

    <div class="role-list">

        <c:forEach var="r" items="${roles}">

            <c:set var="isSelected" value="false"/>
            <c:forEach var="ur" items="${user.roles}">
                <c:if test="${ur eq r.name}">
                    <c:set var="isSelected" value="true"/>
                </c:if>
            </c:forEach>

            <div class="role-item">
                <span>${r.name}</span>
                <input type="checkbox" name="roles" value="${r.name}"
                    <c:if test="${isSelected}">checked</c:if>>
            </div>

        </c:forEach>

    </div>

    <button type="submit">Save</button>

</form>

<div class="actions">
    <a class="cancel-btn"
       href="${pageContext.request.contextPath}/user/getProfileId?id=${user.id}">
        Cancel
    </a>
</div>

</c:if>

<c:if test="${empty user}">
    <p class="error">User not found</p>
</c:if>

</div>

</body>
</html>