<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Home</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            overflow-x: hidden;
        }

        /* The Checkbox Hack */
        #nav-toggle {
            display: none;
        }

        /* Menu Button Styling */
        .menu-label {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1001;
            background-color: #2c3e50;
            color: white;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #2c3e50;
            color: white;
            position: fixed;
            left: -250px;
            transition: 0.3s;
            z-index: 1000;
            padding-top: 70px;
        }

        /* Logic: If checkbox is checked, move sidebar to left: 0 */
        #nav-toggle:checked ~ .sidebar {
            left: 0;
        }

        .sidebar-header {
            padding: 15px 20px;
            font-size: 12px;
            color: #95a5a6;
            text-transform: uppercase;
            border-bottom: 1px solid #3e4f5f;
        }

        .nav-item {
            display: block;
            padding: 15px 20px;
            color: #ecf0f1;
            text-decoration: none;
            border-bottom: 1px solid #3e4f5f;
        }

        .nav-item:hover {
            background-color: #34495e;
        }

        /* Overlay Styling */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            display: none;
            z-index: 999;
        }

        /* Logic: If checkbox is checked, show overlay */
        #nav-toggle:checked ~ .overlay {
            display: block;
        }

        /* Main Content */
        .content {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .content h1 {
            font-size: 48px;
            color: #2c3e50;
            margin: 0;
        }

        .content p {
            font-size: 18px;
            color: #7f8c8d;
        }

        .empty-msg {
            padding: 20px;
            font-size: 14px;
            color: #bdc3c7;
            text-align: center;
        }
    </style>
</head>
<body>

    <input type="checkbox" id="nav-toggle">

    <label for="nav-toggle" class="menu-label">MENU</label>

    <label for="nav-toggle" class="overlay"></label>

    <nav class="sidebar">
        <div class="sidebar-header">System Nodes</div>

        <c:forEach var="nodeItem" items="${node}">
            <a href="${nodeItem.path}" class="nav-item">
                ${nodeItem.name}
            </a>
        </c:forEach>

        <c:if test="${empty node}">
            <div class="empty-msg">No nodes registered</div>
        </c:if>
    </nav>

    <div class="content">
        <h1>System Administration</h1>
        <p>Click Menu to view registered system nodes.</p>
    </div>

</body>
</html>