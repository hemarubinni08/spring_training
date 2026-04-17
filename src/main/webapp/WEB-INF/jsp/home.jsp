<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Role Management</title>

    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background-color: #f4f6f9;
        }

        .topbar {
            height: 56px;
            background-color: #1f2937;
            display: flex;
            align-items: center;
            padding: 0 16px;
            color: white;
            justify-content: space-between;
        }

        .topbar-left {
            display: flex;
            align-items: center;
        }

        .menu {
            width: 28px;
            cursor: pointer;
            margin-right: 16px;
        }

        .menu div {
            height: 3px;
            background: white;
            margin: 5px 0;
        }

        /* ✅ Logout Button */
        .logout-btn {
            background: #ef4444;
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }

        .logout-btn:hover {
            background: #dc2626;
        }

        .sidebar {
            position: fixed;
            top: 56px;
            left: -240px;
            width: 240px;
            height: calc(100vh - 56px);
            background: #111827;
            transition: left 0.3s ease;
        }

        .sidebar.active {
            left: 0;
        }

        .sidebar a {
            display: block;
            padding: 16px 24px;
            color: #d1d5db;
            text-decoration: none;
            font-size: 15px;
        }

        .sidebar a:hover {
            background: #374151;
            color: #ffffff;
        }

        .content {
            margin-top: 56px;
            padding: 40px;
        }

        .welcome {
            font-size: 18px;
            font-weight: 600;
            color: #1f2937;
        }

        .welcome-sub {
            margin-top: 4px;
            font-size: 14px;
            color: #6b7280;
        }
    </style>

    <script>
        function toggleMenu() {
            document.getElementById("sidebar").classList.toggle("active");
        }
    </script>
</head>

<body>

<!-- ✅ TOP BAR -->
<div class="topbar">
    <div class="topbar-left">
        <div class="menu" onclick="toggleMenu()">
            <div></div>
            <div></div>
            <div></div>
        </div>
        <strong>Role Management</strong>
    </div>

    <!-- ✅ PROPER LOGOUT FORM (NO UI BREAK) -->
    <form action="${pageContext.request.contextPath}/logout" method="post" style="margin:0;">
        <button type="submit" class="logout-btn">Logout</button>
    </form>
</div>

<!-- ✅ SIDEBAR -->
<div class="sidebar" id="sidebar">
    <c:forEach var="node" items="${nodes}">
        <a href="${pageContext.request.contextPath}${node.path}">
            ${node.name}
        </a>
    </c:forEach>
</div>

<!-- ✅ CONTENT -->
<div class="content">
    <div class="welcome">Welcome to the Role Management System</div>
    <div class="welcome-sub">
        Please select an option from the menu.
    </div>
</div>

</body>
</html>