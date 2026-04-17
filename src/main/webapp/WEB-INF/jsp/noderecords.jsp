<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Nodes Management</title>
    <style>
        /* General Layout */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            min-height: 100vh;
            background-color: #f4f4f4;
            color: #333;
        }

        /* Basic Sidebar */
        aside {
            width: 200px;
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
        }

        aside h2 {
            padding: 0 20px;
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        aside nav a {
            display: block;
            color: #bdc3c7;
            padding: 12px 20px;
            text-decoration: none;
            border-bottom: 1px solid #34495e;
        }

        aside nav a:hover {
            background-color: #34495e;
            color: white;
        }

        /* Main Content Area */
        main {
            flex: 1;
            padding: 25px;
        }

        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        /* Simple Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border: 1px solid #ccc;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #eee;
        }

        /* Basic Buttons */
        .btn {
            padding: 5px 10px;
            text-decoration: none;
            font-size: 13px;
            border-radius: 3px;
            display: inline-block;
        }

        .btn-add { background: #2ecc71; color: white; margin-bottom: 10px; }
        .btn-edit { background: #3498db; color: white; }
        .btn-delete { background: #e74c3c; color: white; border: none; cursor: pointer; }
        .btn-home { background: #7f8c8d; color: white; border: none; padding: 10px; cursor: pointer; margin-top: 20px;}

        form { display: inline; }
    </style>
</head>

<body>
    <main>
        <div class="header-actions">
            <h2>Node Records</h2>
            <a href="${pageContext.request.contextPath}/nodes/addnodes" class="btn btn-add">+ Add Node</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Node Name</th>
                    <th>Node Path</th>
                    <th>Roles</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty nodes}">
                    <tr>
                        <td colspan="5" style="text-align: center;">No nodes found.</td>
                    </tr>
                </c:if>

                <c:forEach var="node" items="${nodes}">
                    <tr>
                        <td>${node.id}</td>
                        <td>${node.name}</td>
                        <td>${node.path}</td>
                        <td>
                            <c:forEach var="roleList" items="${node.roles}">
                                <c:forEach var="role" items="${roleList}" varStatus="status">
                                    ${role}<c:if test="${!status.last}">, </c:if>
                                </c:forEach>
                            </c:forEach>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/nodes/update?id=${node.id}" class="btn btn-edit">Edit</a>

                            <form action="${pageContext.request.contextPath}/nodes/deletenodes" method="get" onsubmit="return confirm('Delete this node?');">
                                <input type="hidden" name="id" value="${node.id}" />
                                <button type="submit" class="btn btn-delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <button class="btn-home" onclick="window.location.href='/'">
            Back to Home
        </button>'
    </main>
</body>
</html>