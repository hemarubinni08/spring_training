<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg,#0f2027,#203a43,#2c5364);
            color: #fff;
            overflow-x: hidden;
        }

        .hamburger {
            position: fixed;
            top: 20px;
            left: 20px;
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
            cursor: pointer;
            z-index: 1001;
        }

        .hamburger span {
            position: absolute;
            left: 14px;
            width: 28px;
            height: 3px;
            background: #00f2ff;
            transition: .4s;
        }

        .hamburger span:nth-child(1) { top: 18px; }
        .hamburger span:nth-child(2) { top: 26px; }
        .hamburger span:nth-child(3) { top: 34px; }

        .hamburger.open span:nth-child(1) {
            transform: rotate(45deg) translate(5px,5px);
        }

        .hamburger.open span:nth-child(2) { opacity: 0; }

        .hamburger.open span:nth-child(3) {
            transform: rotate(-45deg) translate(6px,-6px);
        }

        nav {
            position: fixed;
            top: 0;
            left: -260px;
            width: 260px;
            height: 100%;
            background: rgba(15,32,39,0.95);
            padding-top: 90px;
            transition: .4s;
            z-index: 1000;
        }

        nav.show { left: 0; }

        nav h3 {
            text-align: center;
            color: #7f5cff;
            margin-bottom: 20px;
        }

        nav ul {
            list-style: none;
            padding: 0;
        }

        nav li {
            margin: 10px 16px;
        }

        nav a {
            display: block;
            padding: 12px;
            border-radius: 12px;
            color: #fff;
            text-decoration: none;
            transition: background 0.3s;
        }

        nav a:hover {
            background: rgba(0,242,255,0.2);
        }

        .logout-container {
            margin: 30px 16px;
        }

        .logout-btn {
            width: 100%;
            padding: 12px;
            border-radius: 14px;
            border: none;
            cursor: pointer;
            background: linear-gradient(90deg,#ff416c,#ff4b2b);
            color: #fff;
            font-weight: bold;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(255,75,43,0.4);
        }

        .overlay {
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.6);
            opacity: 0;
            pointer-events: none;
            transition: .4s;
            z-index: 999;
        }

        .overlay.show {
            opacity: 1;
            pointer-events: all;
        }

        .main {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .home-box {
            width: 420px;
            padding: 40px;
            border-radius: 20px;
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(18px);
            text-align: center;
            box-shadow: 0 20px 50px rgba(0,0,0,0.5);
        }

        .home-box h2 {
            margin-bottom: 10px;
            background: linear-gradient(90deg,#00f2ff,#7f5cff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .home-box p {
            opacity: 0.85;
        }
    </style>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const h = document.getElementById("hamburger");
            const nav = document.getElementById("nav");
            const o = document.getElementById("overlay");

            h.onclick = () => {
                h.classList.toggle("open");
                nav.classList.toggle("show");
                o.classList.toggle("show");
            };

            o.onclick = () => h.click();
        });
    </script>
</head>

<body>

<div class="hamburger" id="hamburger">
    <span></span>
    <span></span>
    <span></span>
</div>

<nav id="nav">
    <h3>Admin Panel</h3>

    <ul>
        <c:forEach var="node" items="${nodes}">
            <li>
                <a href="${node.path}">${node.name}</a>
            </li>
        </c:forEach>
    </ul>

    <form action="${pageContext.request.contextPath}/logout" method="post" class="logout-container">
        <button type="submit" class="logout-btn">Logout</button>
    </form>
</nav>

<div class="overlay" id="overlay"></div>

<div class="main">
    <div class="home-box">
        <h2>Welcome Admin</h2>
        <p>Select a module from the menu</p>
    </div>
</div>

</body>
</html>