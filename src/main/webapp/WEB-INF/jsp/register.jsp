<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background-image: linear-gradient(-225deg, #B7F8DB 0%, #50A7C2 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .container {
        width: 480px;
        background: #ffffff;
        padding: 30px;
        border-radius: 28px;
        box-shadow: 0 18px 35px rgba(0, 0, 0, 0.15);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
        letter-spacing: 1px;
        font-weight: 600;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-size: 13px;
        font-weight: 600;
        color: #555;
        margin-bottom: 6px;
    }

    input, select {
        width: 100%;
        padding: 9px 12px;
        font-size: 14px;
        border-radius: 8px;
        border: 1px solid #ccc;
    }

    button {
        width: 100%;
        margin-top: 10px;
        padding: 11px;
        border-radius: 22px;
        border: none;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        background: linear-gradient(120deg, #36d1dc, #5b86e5);
        color: white;
    }

    /* TOAST STYLE */
    .toast {
        position: fixed;
        top: 20px;
        right: 20px;
        min-width: 260px;
        padding: 14px 20px;
        border-radius: 10px;
        color: #fff;
        font-size: 14px;
        font-weight: 600;
        z-index: 9999;
        opacity: 0;
        transform: translateY(-10px);
        animation: fadeInOut 4s ease forwards;
    }

    .toast.success {
        background: linear-gradient(120deg, #22c55e, #16a34a);
    }

    .toast.error {
        background: linear-gradient(120deg, #ef4444, #dc2626);
    }

    @keyframes fadeInOut {
        0% { opacity: 0; transform: translateY(-10px); }
        15% { opacity: 1; transform: translateY(0); }
        85% { opacity: 1; }
        100% { opacity: 0; }
    }
</style>
</head>

<body>

<div class="container">
    <h2>User Registration</h2>

    <form:form action="${pageContext.request.contextPath}/user/register"
               method="POST"
               modelAttribute="userDto">

        <div class="form-group">
            <label>Name</label>
            <form:input path="name"/>
        </div>

        <div class="form-group">
            <label>Email</label>
            <form:input path="email"/>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <form:input path="phoneNo"/>
        </div>

        <div class="form-group">
            <label>Age</label>
            <form:input path="age" type="number"/>
        </div>

        <div class="form-group">
            <label>Date of Birth</label>
            <form:input path="dateOfBirth" type="date"/>
        </div>

        <div class="form-group">
            <label>Username</label>
            <form:input path="userName"/>
        </div>

        <!-- ROLE DROPDOWN (FROM DB) -->
        <div class="form-group">
            <label>Role</label>
            <form:select path="roleName">
                <form:option value="">-- Select Role --</form:option>
                <c:forEach var="role" items="${roleList}">
                    <form:option value="${role}">${role}</form:option>
                </c:forEach>
            </form:select>
        </div>

        <!-- MULTI-ROLES DROPDOWN (FROM DB) -->
        <div class="form-group">
            <label>Other Roles</label>
            <form:select path="roles" multiple="true" size="1">
                <form:option value="">-- Select Other Roles --</form:option>
                <c:forEach var="role" items="${roleList}">
                    <form:option value="${role}">${role}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="form-group">
            <label>Password</label>
            <form:password path="password"/>
        </div>

        <button type="submit">Register</button>
    </form:form>
    <a href="${pageContext.request.contextPath}/"
        style="display:inline-block; margin-top:15px; font-weight:600; color:#2563eb; text-decoration:none;">
            ← Back to Home
    </a>
</div>

<!-- TOAST MESSAGE -->

<c:if test="${not empty toastMessage1}">
    <div id="toast1" class="toast ${toastType}">
        ${toastMessage1}
    </div>
</c:if>

<c:if test="${not empty toastMessage2}">
    <div id="toast2" class="toast ${toastType}" style="display:none;">
        ${toastMessage2}
    </div>
</c:if>


<!-- AUTO REDIRECT ON SUCCESS -->

<c:if test="${toastType eq 'success'}">
<script>
    setTimeout(function () {
        document.getElementById("toast2").style.display = "block";
    }, 4000);

    setTimeout(function () {
        window.location.href =
            "${pageContext.request.contextPath}/user/list";
    }, 8000);
</script>
</c:if>

</body>
</html>