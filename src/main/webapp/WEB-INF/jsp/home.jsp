<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            background: linear-gradient(to right, #eef2f3, #dfe9f3);
        }

        .sidebar {
            width: 240px;
            height: 100vh;
            background: linear-gradient(180deg, #1f4037, #99f2c8);
            color: white;
            position: fixed;
            left: 0;
            top: 0;
            padding-top: 20px;
            box-shadow: 4px 0 15px rgba(0,0,0,0.2);
        }

        .sidebar h3 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 22px;
        }

        .menu-title {
            padding: 10px 20px;
            font-weight: bold;
            font-size: 16px;
        }

        .submenu a {
            display: block;
            padding: 10px 20px;
            margin: 5px 10px;
            text-decoration: none;
            color: white;
            border-radius: 5px;
            background: rgba(0,0,0,0.15);
            transition: 0.3s;
        }

        .submenu a:hover {
            background: rgba(0,0,0,0.3);
            padding-left: 25px;
        }

        .logout-btn {
            position: absolute;
            bottom: 20px;
            left: 20px;
            right: 20px;
            padding: 10px;
            background: linear-gradient(to right, #dc3545, #ff6b6b);
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            width: calc(100% - 40px);
        }

        .logout-btn:hover {
            opacity: 0.9;
        }

        .main {
            margin-left: 240px;
            width: 100%;
        }

        .header {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            padding: 18px 25px;
            color: white;
            font-size: 22px;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .content {
            padding: 40px;
        }

        .card {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 5px 20px rgba(0,0,0,0.1);
            text-align: center;
        }
    </style>
</head>

<body>

<div class="sidebar">
    <h3>Admin Panel</h3>

    <div class="menu-title">Nodes</div>

    <div class="submenu">
        <c:forEach var="node" items="${nodes}">
            <a href="${node.path}">🔹 ${node.name}</a>
        </c:forEach>
    </div>

    <form action="/logout" method="post">
        <button type="submit" class="logout-btn">Logout</button>
    </form>
</div>

<div class="main">

    <div class="header">
        Dashboard
    </div>

    <div class="content">
        <div class="card">
            <h2>Welcome to Home Page</h2>
            <p>Select an option from the sidebar to continue.</p>
        </div>
    </div>

</div>

</body>
</html>