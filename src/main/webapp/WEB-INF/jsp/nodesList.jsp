<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Node Management</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-image: linear-gradient(-225deg, #B7F8DB 0%, #50A7C2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 1000px; /* Slightly wider for better table fit */
            background: #ffffff;
            padding: 30px;
            border-radius: 28px;
            box-shadow: 0 18px 35px rgba(0,0,0,0.15);
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            color: #1d2b64;
        }

        .add-node {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 12px;
            margin-bottom: 30px;
            background: #f8fafc;
            padding: 20px;
            border-radius: 15px;
        }

        .add-node input, .add-node select {
            width: 200px;
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #cbd5e1;
            font-size: 14px;
        }

        /* Improved multi-select height */
        .role-select {
            height: 42px;
            transition: height 0.2s;
        }
        .role-select:focus {
            height: 100px; /* Expands on focus to show options */
        }

        .btn-add {
            padding: 10px 25px;
            border-radius: 20px;
            border: none;
            background: linear-gradient(120deg, #36d1dc, #5b86e5);
            color: white;
            cursor: pointer;
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(91, 134, 229, 0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        thead {
            background: linear-gradient(120deg, #1d2b64, #6dd5ed);
            color: white;
        }

        th {
            padding: 15px;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 0.5px;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #f1f5f9;
            color: #334155;
            font-size: 14px;
        }

        .role-badge {
            background: #e2e8f0;
            padding: 2px 8px;
            border-radius: 12px;
            font-size: 12px;
            margin: 2px;
            display: inline-block;
        }

        .btn-view {
            padding: 7px 15px;
            border-radius: 18px;
            text-decoration: none;
            color: white;
            background: linear-gradient(120deg, #36d1dc, #5b86e5);
            font-size: 12px;
            font-weight: 600;
        }

        .btn-delete {
            background: linear-gradient(120deg, #ff416c, #ff4b2b);
            margin-left: 5px;
        }

        /* Toast Styling */
        .toast {
            position: fixed;
            top: 20px;
            right: -400px;
            padding: 14px 25px;
            border-radius: 12px;
            color: #fff;
            font-weight: 600;
            opacity: 0;
            transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            z-index: 9999;
        }

        .toast-success { background: #10b981; }
        .toast-error { background: #ef4444; }
        .toast.show { right: 20px; opacity: 1; }
    </style>
</head>

<body>

<c:if test="${not empty message}">
    <div id="toast" class="toast ${colour eq 'red' ? 'toast-error' : 'toast-success'}">
        ${message}
    </div>
</c:if>

<div class="container">
    <h1>Node Management</h1>

    <form action="${pageContext.request.contextPath}/node/add" method="post" class="add-node">
        <input type="text" name="name" placeholder="Node Name" required />
        <input type="text" name="path" placeholder="Path (e.g. /home)" required />

        <select name="roles" class="role-select" multiple required title="Hold Ctrl to select multiple">
            <c:forEach var="role" items="${rolesList}">
                <option value="${role}">${role}</option>
            </c:forEach>
        </select>

        <button type="submit" class="btn-add">Add Node</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Path</th>
                <th>Assigned Roles</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="node" items="${nodeDetailsList}">
                <tr>
                    <td><strong>#${node.id}</strong></td>
                    <td>${node.name}</td>
                    <td><code>${node.path}</code></td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty node.roles}">
                                <c:forEach var="r" items="${node.roles}">
                                    <span class="role-badge">${r}</span>
                                </c:forEach>
                            </c:when>
                            <c:otherwise><span style="color:#cbd5e1">None</span></c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/node/profile/${node.id}" class="btn-view">View / Edit</a>
                        <a href="${pageContext.request.contextPath}/node/delete/${node.id}"
                           class="btn-view btn-delete"
                           onclick="return confirm('Delete this node?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div style="text-align: center; margin-top: 25px;">
        <a href="${pageContext.request.contextPath}/"
           style="font-weight:600; color:#5b86e5; text-decoration:none;">
           ← Back to Homepage
        </a>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const toast = document.getElementById("toast");
        if (toast) {
            setTimeout(() => toast.classList.add("show"), 200);
            setTimeout(() => {
                toast.classList.remove("show");
                setTimeout(() => toast.remove(), 500);
            }, 3500);
        }
    });
</script>

</body>
</html>