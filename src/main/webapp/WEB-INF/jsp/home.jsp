<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f2f2f2;
        }

        .header {
            height: 60px;
            background-color: #1f2937;
            color: white;
            display: flex;
            align-items: center;
            padding: 0 20px;
        }

        .header a {
            text-decoration: none;
            color: white;
            padding: 5px;
            font-size: 12px;
            background: #ffffff75;
            border-radius: 5px;
            margin-left: 85vw;
        }

        .hamburger {
            font-size: 26px;
            cursor: pointer;
            margin-right: 15px;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: -250px;
            width: 250px;
            height: 100vh;
            background-color: #111827;
            transition: 0.3s ease;
            padding-top: 15px;
        }

        .sidebar.active {
            left: 0;
        }

        .close-btn {
            color: white;
            font-size: 24px;
            cursor: pointer;
            text-align: right;
            padding: 10px 20px;
        }

        .sidebar a {
            display: block;
            padding: 15px 20px;
            color: white;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: #374151;
        }

        .content {
            padding: 20px;
            transition: margin-left 0.3s ease;
        }

        .content.shift {
            margin-left: 250px;
        }
    </style>
</head>

<body>


    <div id="sidebar" class="sidebar">
       <div class="close-btn" onclick="toggleSidebar()">✖</div>

       <c:forEach var="node" items="${nodeDtoList}">
       <a href = "${node.path}">${node.name}</a>
       </c:forEach>
    </div>


    <div class="header">
        <span class="hamburger" onclick="toggleSidebar()">☰</span>
        <h3>Home</h3>
        <h4><a href="/login?logout">Logout</a></h4>
    </div>


    <div id="content" class="content">
        <h2>Welcome</h2>
        <p>Harshavardhan</p>

    </div>

    <script>
        function toggleSidebar() {
            document.getElementById("sidebar").classList.toggle("active");
            document.getElementById("content").classList.toggle("shift");
        }
    </script>

</body>
</html>