<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            display: flex;
            height: 100vh;
        }

        /* ===== LEFT SIDEBAR ===== */
        .sidebar {
            width: 220px;
            background: #343a40;
            color: #fff;
            padding: 15px;
        }

        .sidebar h3 {
            margin-top: 0;
            margin-bottom: 15px;
            font-size: 18px;
        }

        .nav-item {
            margin-bottom: 10px;
        }

        .nav-item a {
            color: #ffffff;
            text-decoration: none;
            display: block;
            padding: 8px 10px;
            background: #495057;
            border-radius: 4px;
        }

        .nav-item a:hover {
            background: #5a6268;
        }

        .nav-path {
            font-size: 11px;
            color: #ccc;
            margin-top: 3px;
        }

        /* ===== RIGHT CONTENT ===== */
        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        /* TOP BAR */
        .top-bar {
            background: #ffffff;
            padding: 12px 20px;
            border-bottom: 1px solid #ccc;
            font-size: 18px;
            font-weight: bold;
        }

        .content {
            padding: 20px;
            background: #ffffff;
            flex: 1;
        }

        .content p {
            color: #555;
        }
    </style>
</head>

<body>

<!-- ===== LEFT NAVIGATION ===== -->
<div class="sidebar">
    <h3>Navigation</h3>

    <c:if test="${empty nodeList}">
        <p>No navigation items found</p>
    </c:if>

    <c:forEach items="${nodeList}" var="node">
        <div class="nav-item">
            <a href="${node.path}">
                ${node.name}
            </a>
            <div class="nav-path">${node.path}</div>
        </div>
    </c:forEach>
</div>

<!-- ===== RIGHT CONTENT ===== -->
<div class="main">

    <!-- TOP BAR -->
    <div class="top-bar">
        POS
    </div>

    <div class="content">
        <h2>Home</h2>
        <p>
            Use the left navigation panel to manage Users, Roles, Nodes,
            or other master data in the system.
        </p>
    </div>

</div>

</body>
</html>