<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #eef2f7;
        }

        /* Layout */
        .layout {
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 220px;
            background-color: #2c3e50;
            color: white;
        }

        .sidebar h3 {
            text-align: center;
            padding: 20px 0;
            margin: 0;
            border-bottom: 1px solid #3d566e;
            font-weight: normal;
        }

        .menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            font-size: 15px;
        }

        .menu a:hover {
            background-color: #34495e;
        }

        /* Main section */
        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .header {
            height: 55px;
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
            display: flex;
            align-items: center;
            padding: 0 20px;
            color: #2c3e50;
            font-weight: bold;
        }

        /* ✅ CENTER CONTENT */
        .content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 40px;
            font-weight: bold;
            color: #2c3e50;
        }
    </style>
</head>

<body>

<div class="layout">

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Admin Panel</h3>

        <ul class="menu">
            <c:forEach var="node" items="${node}">
                <li>
                    <a href="${node.path}">
                        ${node.name}
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main">
        <div class="header">
            Dashboard
        </div>

        <!-- ✅ CENTERED TEXT -->
        <div class="content">
            Welcome to My POS Application
        </div>
    </div>

</div>

</body>
</html>