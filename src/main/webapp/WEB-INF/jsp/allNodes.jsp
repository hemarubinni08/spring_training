<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Node Dashboard - POS</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }

        /* Sidebar */
        .sidebar {
            width: 230px;
            height: 100vh;
            background-color: #2c3e50;
            position: fixed;
            padding-top: 20px;
        }

        .sidebar h2 {
            color: #ecf0f1;
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #bdc3c7;
            text-decoration: none;
            font-size: 15px;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background-color: #34495e;
            color: #ffffff;
        }

        /* Content */
        .content {
            margin-left: 250px;
            padding: 30px;
        }

        .dashboard-title {
            font-size: 22px;
            margin-bottom: 20px;
        }

        /* Table */
        table {
            border-collapse: collapse;
            width: 100%;
            background-color: #ffffff;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #34495e;
            color: #ffffff;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
        /* ===== FOOTER BUTTONS ===== */
                                .footer-buttons {
                                    margin-top: 30px;
                                    text-align: center;
                                }

                                .footer-buttons a {
                                    display: inline-block;
                                    padding: 10px 22px;
                                    margin: 0 8px;
                                    border-radius: 5px;
                                    font-size: 14px;
                                    font-weight: 600;
                                    color: #ffffff;
                                    text-decoration: none;
                                }

                                .home-btn {
                                    background-color: #7f8c8d;
                                }

                                .home-btn:hover {
                                    background-color: #636e72;
                                }
                                .footer-text {
                                                    margin-top: 10px;
                                                    font-size: 12px;
                                                    color: #7f8c8d;
                                                }
    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>POS Dashboard</h2>
    <a href="dashboard">Dashboard</a>
    <a href="addNode">Add Node</a>
    <a href="viewNodes" class="active">View Nodes</a>
    <a href="logout">Logout</a>
</div>

<!-- Content -->
<div class="content">
    <div class="dashboard-title">All Nodes
    <a href="/node/addNode" class="add-btn" title="Add Node">+</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Node name</th>
                <th>Node path</th>
                <th>Node Role</th>
                <th>Node Roles</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="node" items="${nodes}">
                <tr>
                    <td>${node.id}</td>
                    <td>${node.name}</td>
                    <td>${node.path}</td>
                    <td>${node.role}</td>
                    <td>${node.roles}</td>
                    <td>
                                            <!-- UPDATE BUTTON -->
                                            <a href="/node/getNode?id=${node.id}">
                                                Update
                                            </a>

                                            <!-- DELETE BUTTON -->
                                            <a href="/node/deleteNode?id=${node.id}"
                                               onclick="return confirm('Are you sure you want to delete this role?');">
                                                Delete
                                            </a>
                                        </td>

                </tr>
            </c:forEach>

            <c:if test="${empty nodeList}">
                <tr>
                    <td colspan="3">No nodes available</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>
<!-- ✅ FOOTER WITH HOME + REGISTER -->
<div class="footer-buttons">
    <a href="/" class="home-btn">Home</a>
    <div class="footer-text">
        User Management System
    </div>
</div>
</body>
</html>