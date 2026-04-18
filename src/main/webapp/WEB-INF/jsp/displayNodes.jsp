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
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
            background-color: #f6f7f9;
            color: #1f2937;
        }

        .page-title {
            text-align: center;
            padding: 18px 0 10px;
            font-size: 26px;
            font-weight: 600;
            color: #1f2937;
        }

        .container {
            width: 95%;
            max-width: 1000px;
            margin: 10px auto 24px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.08);
            padding: 22px;
        }

        /* ✅ TOP BAR */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }

        .home-btn {
            padding: 7px 14px;
            background-color: #eef0f3;
            color: #374151;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            border: 1px solid #d1d5db;
        }

        .home-btn:hover {
            background-color: #e5e7eb;
        }

        .add-btn {
            padding: 7px 14px;
            background-color: #2563eb;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
        }

        .add-btn:hover {
            background-color: #1d4ed8;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 13.5px;
        }

        thead {
            background-color: #f1f5f9;
        }

        th {
            padding: 12px;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: #475569;
            border-bottom: 1px solid #cbd5e1;
            text-align: center;
        }

        td {
            padding: 12px;
            text-align: center;
            color: #1f2937;
            border-bottom: 1px solid #e2e8f0;
        }

        tbody tr:hover {
            background-color: #f8fafc;
        }

        .action-link {
            padding: 5px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            font-size: 13px;
            color: #ffffff;
            display: inline-block;
        }

        .edit {
            background-color: #2563eb;
        }

        .edit:hover {
            background-color: #1d4ed8;
        }

        .delete {
            background-color: #dc2626;
            margin-left: 6px;
        }

        .delete:hover {
            background-color: #b91c1c;
        }
    </style>
</head>

<body>

<div class="page-title">Node Management</div>

<div class="container">

    <div class="top-bar">
        <a href="/" class="home-btn">Home</a>

        <a href="${pageContext.request.contextPath}/node/addNode"
           class="add-btn">
            Add Node
        </a>
    </div>

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