<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f5f5f5;
        }

        .navbar {
            height: 55px;
            background-color: #7F0099;
            color: white;
            display: flex;
            align-items: center;
            padding: 0 20px;
        }

        .menu-btn {
            cursor: pointer;
            font-size: 20px;
            margin-right: 15px;
        }

        #menu-toggle {
            display: none;
        }


        .container {
            display: flex;
            min-height: calc(100vh - 55px);
        }


        .side-menu {
            width: 220px;
            background-color: #ffffff;
            border-right: 1px solid #ddd;
            padding: 20px;
            transform: translateX(-100%);
            transition: transform 0.2s ease;
        }


        #menu-toggle:checked ~ .container .side-menu {
            transform: translateX(0);
        }


        .content {
            flex: 1;
            padding: 40px;
        }

        .side-menu h3 {
            margin-top: 0;
            font-size: 16px;
            margin-bottom: 15px;
        }

        .side-menu ul {
            list-style: none;
            padding: 0;
        }

        .side-menu ul li {
            margin-bottom: 10px;
        }

        .side-menu ul li a {
            text-decoration: none;
            color: #333;
            font-size: 14px;
        }

        .side-menu ul li a:hover {
            text-decoration: underline;
        }

        h2 {
            margin-top: 0;
            color: #333;
        }

        p {
            color: #555;
        }
    </style>
</head>

<body>


<input type="checkbox" id="menu-toggle">


<div class="navbar">
    <label for="menu-toggle" class="menu-btn">☰</label>
    Home
</div>

<div class="container">
    <div class="side-menu">
        <h3>Menu</h3>
        <ul>
            <c:forEach var="node" items="${nodes}">
                <a href="${node.path}"><li>${node.name}</li></a>
            </c:forEach>
             <a href="/logout" class="home-btn">Go to Logout</a>
        </ul>
    </div>


    <div class="content">
        <h2>Welcome Pranav</h2>
        <p>
            This is your home page. Use the menu button to open or close the menu.
        </p>
    </div>

</div>

</body>
</html>