<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Role</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
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
.card {
    width: 400px;
    background: #ffffff;
    border-radius: 12px;
    padding: 28px;
    border: 1px solid #e2e8f0;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
}

/* Title */
.title {
    text-align: center;
    font-size: 22px;
    font-weight: 600;
    margin-bottom: 6px;
    color: #0f172a;
}

/* Subtitle */
.subtitle {
    text-align: center;
    font-size: 13px;
    color: #64748b;
    margin-bottom: 20px;
}

/* Label */
label {
    font-size: 13px;
    font-weight: 500;
    color: #475569;
}

/* Input */
.input-box {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    margin-bottom: 16px;
    border-radius: 8px;
    border: 1px solid #cbd5f5;
    background-color: #f8fafc;
    font-size: 14px;
    color: #1e293b;
}

.input-box:focus {
    outline: none;
    border-color: #6366f1;
    box-shadow: 0 0 6px rgba(99,102,241,0.25);
    background-color: #ffffff;
}

/* Button */
.btn {
    width: 100%;
    padding: 12px;
    border-radius: 8px;
    border: none;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    color: white;
    background: linear-gradient(135deg, #6366f1, #4f46e5);
}

.btn:hover {
    box-shadow: 0 5px 15px rgba(99,102,241,0.3);
}

/* Footer */
.footer-text {
    margin-top: 15px;
    text-align: center;
    font-size: 13px;
    color: #64748b;
}

/* Link */
.link {
    text-align: center;
    margin-top: 14px;
}

.link a {
    color: #4f46e5;
    text-decoration: none;
    font-size: 13px;
}

.link a:hover {
    text-decoration: underline;
}

</style>
</head>

<body>

<div class="card">

    <div class="title">Add New Role</div>
    <div class="subtitle">Create a new role for your system</div>

    <form:form action="${pageContext.request.contextPath}/role/addRole"
               method="post"
               modelAttribute="roleDto">

        <label for="name">Role Name</label>
        <form:input path="name"
                    id="name"
                    placeholder="Enter role name"
                    class="input-box"
                    required="true"/>

        <button type="submit" class="btn">
            Save Role
        </button>

    </form:form>

    <div class="link">
        <a href="${pageContext.request.contextPath}/role/showAllRoles">
            View All Roles
        </a>
    </div>

</div>

</body>
</html>