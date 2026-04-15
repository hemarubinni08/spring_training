<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>POS Management</title>

    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(-225deg, #B7F8DB 0%, #50A7C2 100%);
        }

        /* HEADER */
        .header {
            height: 64px;
            background: linear-gradient(120deg, #1d2b64, #6dd5ed);
            color: white;
            display: flex;
            align-items: center;
            padding: 0 25px;
            font-size: 20px;
            font-weight: 600;
            letter-spacing: 1px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        /* MAIN LAYOUT */
        .container {
            display: flex;
            height: calc(100vh - 64px);
        }

        /* SIDEBAR */
        .sidebar {
            width: 240px;
            background: rgba(255,255,255,0.95);
            padding-top: 20px;
            box-shadow: 4px 0 10px rgba(0,0,0,0.08);
        }

        .sidebar-title {
            font-size: 14px;
            font-weight: 600;
            color: #555;
            padding: 10px 20px;
            text-transform: uppercase;
            letter-spacing: 0.8px;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            margin: 4px 10px;
            border-radius: 10px;
            color: #333;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        .sidebar a:hover {
            background: linear-gradient(120deg, #36d1dc, #5b86e5);
            color: white;
            transform: translateX(4px);
        }

        .sidebar hr {
            border: none;
            height: 1px;
            background: #e5e7eb;
            margin: 15px;
        }

        /* CONTENT */
        .content {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
        }

        .content-card {
            background: white;
            padding: 30px;
            border-radius: 28px;
            box-shadow: 0 18px 35px rgba(0,0,0,0.15);
            max-width: 900px;
        }

        h2 {
            margin-top: 0;
            font-weight: 600;
            letter-spacing: 0.5px;
            color: #333;
        }

        p {
            color: #555;
            font-size: 14px;
            line-height: 1.5;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    POS Retail Management
</div>

<!-- MAIN LAYOUT -->
<div class="container">

    <!-- SIDEBAR -->
    <div class="sidebar">

        <div class="sidebar-title">Navigation</div>

        <a href="${pageContext.request.contextPath}/">
            Home
        </a>

        <hr>

        <div class="sidebar-title">Modules</div>

        <!-- Dynamic Node Menu -->
        <c:forEach items="${nodes}" var="node">
            <a href="${pageContext.request.contextPath}${node.path}">
                🔹 ${node.name}
            </a>
        </c:forEach>

    </div>

    <!-- CONTENT AREA -->
    <div class="content">
        <div class="content-card">
            <h2>Welcome</h2>
            <p>
                Select a module from the left navigation menu to manage
                users, roles, nodes, and other POS system features.
            </p>
        </div>
    </div>

</div>

</body>
</html>
