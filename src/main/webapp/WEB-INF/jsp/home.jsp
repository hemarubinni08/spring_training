<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Home Dashboard</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #f4f6f9;
            color: #1f2937;
        }

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 260px;
            height: 100vh;
            background: #111827;
            box-shadow: 4px 0 20px rgba(0,0,0,0.15);
        }

        .sidebar-header {
            padding: 18px;
            font-size: 18px;
            font-weight: 600;
            color: #ffffff;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .sidebar a {
            display: block;
            padding: 12px 18px;
            margin: 6px 10px;
            color: #e5e7eb;
            text-decoration: none;
            border-radius: 8px;
            transition: 0.2s;
        }

        .sidebar a:hover {
            background: rgba(255,255,255,0.08);
            transform: translateX(4px);
        }

        .content {
            margin-left: 260px;
            padding: 30px;
        }

        .title {
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
        }

        .card {
            background: #ffffff;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        h3 {
            margin-bottom: 15px;
            font-size: 18px;
            color: #111827;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            text-align: left;
            background: #eef2ff;
            padding: 12px;
            font-weight: 600;
            color: #374151;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background: #f9fafb;
        }

        .badge {
            background: #e0e7ff;
            color: #3730a3;
            padding: 4px 10px;
            border-radius: 8px;
            font-size: 12px;
        }
    </style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="sidebar-header">Dashboard</div>

    <c:forEach var="node" items="${nodes}">
        <a href="${pageContext.request.contextPath}${node.path}">
            ${node.name}
        </a>
    </c:forEach>
</div>

<!-- CONTENT -->
<div class="content">

    <div class="title">Home Dashboard</div>

    <div class="grid">

        <!-- USERS -->
        <div class="card">
            <h3>Users</h3>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Username</th>
                </tr>

                <c:forEach var="u" items="${users}">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.name}</td>
                        <td>${u.email}</td>
                        <td>${u.phoneNo}</td>
                        <td><span class="badge">${u.userName}</span></td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <!-- ROLES -->
        <div class="card">
            <h3>Roles</h3>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Role Name</th>
                </tr>

                <c:forEach var="r" items="${roles}">
                    <tr>
                        <td>${r.id}</td>
                        <td>${r.name}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <!-- NODES -->
        <div class="card">
            <h3>Nodes</h3>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Path</th>
                </tr>

                <c:forEach var="n" items="${nodes}">
                    <tr>
                        <td>${n.id}</td>
                        <td>${n.name}</td>
                        <td>${n.path}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </div>
</div>

</body>
</html>