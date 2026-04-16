<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Node</title>

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
.container {
    width: 400px;
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
    color: #475569;
}

/* Inputs */
input {
    width: 100%;
    padding: 10px;
    margin: 6px 0 14px 0;
    border-radius: 8px;
    border: 1px solid #cbd5f5;
    background: #f8fafc;
    color: #1e293b;
}

input:focus {
    outline: none;
    border-color: #6366f1;
    box-shadow: 0 0 6px rgba(99,102,241,0.25);
    background: #ffffff;
}

/* Role list (same as registration) */
.role-list {
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 6px;
    max-height: 140px;
    overflow-y: auto;
    margin-bottom: 16px;
    background: #f9fafb;
}

/* Perfect alignment */
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
    border-radius: 8px;
    border: none;
    background: linear-gradient(135deg, #6366f1, #4f46e5);
    color: white;
    font-weight: 600;
    cursor: pointer;
}

button:hover {
    box-shadow: 0 5px 15px rgba(99,102,241,0.3);
}

/* Error */
.bottom-error {
    margin-top: 12px;
    padding: 10px;
    text-align: center;
    border-radius: 6px;
    background: #fee2e2;
    color: #b91c1c;
    font-size: 13px;
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

<div class="container">

<h2>Create Node</h2>

<form action="${pageContext.request.contextPath}/node/addNode" method="post">

    <label>Node Name</label>
    <input type="text" name="name" required>

    <label>Path</label>
    <input type="text" name="path" required>

    <!-- Roles (same as registration page) -->
    <label>Roles</label>
    <div class="role-list">
        <c:forEach var="r" items="${roles}">
            <div class="role-item">
                <span>${r.name}</span>
                <input type="checkbox" name="roles" value="${r.name}">
            </div>
        </c:forEach>
    </div>

    <button type="submit">Save Node</button>

</form>

<c:if test="${not empty errorMessage}">
    <div class="bottom-error">
        ${errorMessage}
    </div>
</c:if>

<div class="link">
    <a href="${pageContext.request.contextPath}/node/showAllNodes">
        View All Nodes
    </a>
</div>

</div>

</body>
</html>