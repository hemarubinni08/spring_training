<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS Dashboard</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, sans-serif;
    height: 100vh;
    overflow: hidden;
    background: linear-gradient(135deg,
        #020617 0%,
        #0f172a 40%,
        #1e3a8a 100%);
}

.header {
    height: 60px;
    background: rgba(2, 6, 23, 0.6);
    backdrop-filter: blur(15px);
    color: #e2e8f0;
    display: flex;
    align-items: center;
    padding: 0 20px;
    z-index: 3;
}

.hamburger {
    font-size: 26px;
    cursor: pointer;
    margin-right: 15px;
    width: 42px;
    height: 42px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    background: rgba(59,130,246,0.15);
}
.hamburger:hover {
    background: rgba(59,130,246,0.35);
}

.sidebar {
    position: fixed;
    top: 0;
    left: -280px;
    width: 260px;
    height: 100%;
    background: rgba(15, 23, 42, 0.95);
    backdrop-filter: blur(18px);
    transition: 0.35s ease;
    padding-top: 20px;
    z-index: 4;
}
.sidebar.active {
    left: 0;
}
.sidebar h2 {
    text-align: center;
    color: #e2e8f0;
    margin-bottom: 25px;
}
.sidebar a {
    display: block;
    padding: 14px 20px;
    color: #94a3b8;
    text-decoration: none;
    transition: 0.3s;
}
.sidebar a:hover {
    background: rgba(59,130,246,0.2);
    color: white;
}

.logout-form {
    position: absolute;
    bottom: 20px;
    left: 0;
    width: 100%;
    padding: 0 20px;
}

.logout-btn {
    width: 100%;
    padding: 6px;          /* smaller height */
    background: linear-gradient(135deg, #ef4444, #dc2626);
    border: none;
    border-radius: 8px;
    color: white;
    font-size: 14px;       /* smaller text */
    cursor: pointer;
}
.logout-btn:hover {
    background: linear-gradient(135deg, #f87171, #ef4444);
}

.content {
    padding: 40px;
    transition: margin-left 0.3s ease;
}
.content.shift {
    margin-left: 260px;
}

.card {
    background: rgba(15, 23, 42, 0.65);
    padding: 45px;
    border-radius: 20px;
    max-width: 650px;
    margin: 100px auto;
    text-align: center;
    color: #e2e8f0;
}
</style>
</head>

<body>

<div id="sidebar" class="sidebar">
    <h2>POS Menu</h2>

    <c:forEach var="node" items="${nodes}">
        <a href="${pageContext.request.contextPath}${node.path}">
            ${node.name}
        </a>
    </c:forEach>

    <form class="logout-form"
          action="${pageContext.request.contextPath}/logout"
          method="post">
        <button type="submit" class="logout-btn">
            Logout
        </button>
    </form>
</div>

<div class="header">
    <span class="hamburger" onclick="toggleSidebar()">☰</span>
    <h3>POS Dashboard</h3>
</div>

<div id="content" class="content">
    <div class="card">
        <h2>Welcome to the POS Application 🧾</h2>
        <p>Manage Users, Roles, and Nodes efficiently.</p>
        <p>Use the sidebar menu to navigate.</p>
    </div>
</div>

<script>
function toggleSidebar() {
    document.getElementById("sidebar").classList.toggle("active");
    document.getElementById("content").classList.toggle("shift");
}
</script>

</body>
</html>