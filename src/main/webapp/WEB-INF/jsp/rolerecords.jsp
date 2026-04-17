<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Role Management</title>
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

        .header-section {
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
            font-size: 14px;
        }

        th {
            background-color: #eee;
            font-weight: bold;
        }

        /* Basic Buttons */
        .btn {
            padding: 5px 10px;
            text-decoration: none;
            font-size: 12px;
            border-radius: 3px;
            display: inline-block;
        }

        .btn-add { background: #2ecc71; color: white; margin-left: 5px; }
        .btn-edit { background: #3498db; color: white; }
        .btn-delete { background: #e74c3c; color: white; border: none; cursor: pointer; }

        .empty-msg { text-align: center; color: #7f8c8d; font-style: italic; }
        form { display: inline; }
    </style>
</head>

<body>
    <main>
        <div class="header-section">
            <h2>Role Records</h2>
            <div>
                <a href="${pageContext.request.contextPath}/roles/addroles" class="btn btn-add">+ Add Role (JPA)</a>
                <a href="${pageContext.request.contextPath}/roles/addrolesjdbc" class="btn btn-add">+ Add Role (JDBC)</a>
            </div>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Role Name</th>
                    <th>Edit (JPA)</th>
                    <th>Edit (JDBC)</th>
                    <th>Delete (JPA)</th>
                    <th>Delete (JDBC)</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty roles}">
                    <tr>
                        <td colspan="6" class="empty-msg">No roles found.</td>
                    </tr>
                </c:if>

                <c:forEach var="role" items="${roles}">
                    <tr>
                        <td>${role.id}</td>
                        <td>${role.name}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/roles/update?id=${role.id}" class="btn btn-edit">Edit</a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/roles/updateJdbc?id=${role.id}" class="btn btn-edit">Edit</a>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/roles/deleteroles" method="get" onsubmit="return confirm('Delete this role?');">
                                <input type="hidden" name="id" value="${role.id}" />
                                <button type="submit" class="btn btn-delete">Delete</button>
                            </form>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/roles/deleterolesjdbc" method="get" onsubmit="return confirm('Delete this role?');">
                                <input type="hidden" name="id" value="${role.id}" />
                                <button type="submit" class="btn btn-delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <button class="btn-home" onclick="window.location.href='/'">
               Back to Home
        </button>
    </main>
</body>
</html>