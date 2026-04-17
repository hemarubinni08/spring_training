<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Node Management</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .page-title {
            text-align: center;
            padding: 25px 0;
            color: #ffffff;
            font-size: 32px;
            font-weight: 600;
        }

        .container {
            width: 95%;
            max-width: 1000px;
            margin: 0 auto 40px;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
            padding: 25px;
        }

        /* ✅ TOP BAR */
        .top-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .home-btn {
            padding: 10px 18px;
            background-color: #374151;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }

        .home-btn:hover {
            background-color: #1f2937;
        }

        .add-btn {
            padding: 10px 18px;
            background-color: #16a34a;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }

        .add-btn:hover {
            background-color: #15803d;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: linear-gradient(90deg, #0ea5e9, #0284c7);
            color: white;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        tbody tr:nth-child(even) {
            background-color: #f9fafb;
        }

        tbody tr:hover {
            background-color: #eef2ff;
        }

        .action-link {
            padding: 6px 12px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            color: white;
        }

        .edit {
            background-color: #2563eb;
        }

        .delete {
            background-color: #dc2626;
            margin-left: 6px;
        }
    </style>
</head>

<body>

<div class="page-title">🧭 Node Management</div>

<div class="container">

    <!-- ✅ HOME + ADD BUTTONS -->
    <div class="top-bar">
        <a href="/" class="home-btn">🏠 Home</a>

        <a href="${pageContext.request.contextPath}/node/addNode"
           class="add-btn">
            ➕ Add Node
        </a>
    </div>

    <!-- ✅ TABLE -->
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Path</th>
            <th>Roles</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="n" items="${nodes}">
            <tr>
                <td>${n.id}</td>
                <td>${n.name}</td>
                <td>${n.path}</td>
                <td>${n.roleNames}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/node/editNode/${n.id}"
                       class="action-link edit">
                        Edit
                    </a>

                    <a href="${pageContext.request.contextPath}/node/deleteNode/${n.id}"
                       class="action-link delete"
                       onclick="return confirm('Delete this node?');">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>