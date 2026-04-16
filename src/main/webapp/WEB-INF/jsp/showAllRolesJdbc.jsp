<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Show All Roles (JDBC)</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            padding: 40px;
        }

        .card {
            max-width: 900px;
            margin: auto;
            background: white;
            border-radius: 22px;
            padding: 36px;
            box-shadow: 0 30px 70px rgba(0,0,0,0.35);
        }

        .title {
            text-align: center;
            font-size: 32px;
            font-weight: 800;
            margin-bottom: 35px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 15px;
            overflow: hidden;
        }

        thead {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        th, td {
            padding: 16px;
            text-align: center;
            font-size: 15px;
        }

        tbody tr:nth-child(even) {
            background: #f3f3f3;
        }

        tbody tr:hover {
            background: #e8edff;
        }

        /* ✅ Added */
        .edit-btn {
            padding: 8px 18px;
            border-radius: 12px;
            background: linear-gradient(135deg, #ff9966, #ff5e62);
            color: white;
            font-weight: 600;
            text-decoration: none;
            font-size: 14px;
        }

        .delete-btn {
            padding: 8px 18px;
            border-radius: 12px;
            background: linear-gradient(135deg, #ff416c, #ff4b2b); /* red */
            color: white;
            font-weight: 600;
            text-decoration: none;
            font-size: 14px;
            margin-left: 10px; /* ✅ space between buttons */
        }

        .footer {
            margin-top: 40px;
            display: flex;
            justify-content: center;
        }

        .add-btn {
            padding: 14px 32px;
            border-radius: 16px;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            color: white;
            font-size: 16px;
            font-weight: 700;
            text-decoration: none;
        }

        .empty {
            text-align: center;
            font-size: 16px;
            color: #777;
            padding: 30px;
        }
    </style>
</head>

<body>

<div class="card">

    <div class="title">📋 Role Management (JDBC)</div>

    <c:choose>
        <c:when test="${not empty roles}">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Role Name</th>
                    <!-- ✅ Added -->
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="role" items="${roles}">
                    <tr>
                        <td>${role.id}</td>
                        <td>${role.name}</td>

                        <!-- ✅ Edit Button and Delete Button -->
                        <td>
                            <a
                               href="${pageContext.request.contextPath}/role/editRoleJdbc?id=${role.id}"
                               class="edit-btn">
                               ✏️ Edit
                            </a>

                            <a
                               href="${pageContext.request.contextPath}/role/deleteRoleJdbc?id=${role.id}"
                               class="delete-btn"
                               onclick="return confirm('Are you sure you want to delete this role?');">
                               🗑️ Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>

        <c:otherwise>
            <div class="empty">
                No roles found. Add one below.
            </div>
        </c:otherwise>
    </c:choose>

    <div class="footer">
        <a href="${pageContext.request.contextPath}/role/addRoleJdbc" class="add-btn">
            ➕ Add Another Role
        </a>
    </div>

</div>

</body>
</html>