<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Role Dashboard</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .page-title {
            text-align: center;
            padding: 30px 0;
            color: #ffffff;
            font-size: 32px;
            font-weight: 600;
        }

        .card {
            width: 95%;
            max-width: 700px;
            margin: 0 auto 40px;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
            padding: 25px;
        }

        /* ✅ TOP ACTION BAR */
        .top-actions {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .home-btn {
            display: inline-block;
            padding: 10px 18px;
            background: #374151;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }

        .home-btn:hover {
            background: #1f2937;
        }

        .add-role-btn {
            display: inline-block;
            padding: 10px 18px;
            background: #16a34a;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }

        .add-role-btn:hover {
            background: #15803d;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: linear-gradient(90deg, #4CAF50, #43A047);
            color: white;
        }

        th, td {
            padding: 14px;
            text-align: center;
        }

        tbody tr:nth-child(even) {
            background-color: #f9fafb;
        }

        tbody tr:hover {
            background-color: #eef2ff;
        }

        .edit-link {
            display: inline-block;
            padding: 6px 14px;
            background-color: #2563eb;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
        }

        .edit-link:hover {
            background-color: #1d4ed8;
        }

        .delete-link {
            display: inline-block;
            padding: 6px 14px;
            background-color: #dc2626;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            margin-left: 6px;
        }

        .delete-link:hover {
            background-color: #b91c1c;
        }

        .footer {
            text-align: right;
            margin-top: 10px;
            color: #555;
            font-size: 14px;
        }
    </style>
</head>

<body>

<div class="page-title">🔐 Role Dashboard</div>

<div class="card">

    <!-- ✅ HOME + ADD ROLE -->
    <div class="top-actions">
        <a href="/" class="home-btn">🏠 Home</a>

        <a class="add-role-btn"
           href="${pageContext.request.contextPath}/role/addRole">
            ➕ Add Role
        </a>
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Role Name</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="r" items="${role}">
            <tr>
                <td>${r.id}</td>
                <td>${r.name}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/role/editProfile/${r.id}"
                       class="edit-link">
                        Edit
                    </a>

                    <a href="${pageContext.request.contextPath}/role/delete/${r.id}"
                       class="delete-link"
                       onclick="return confirm('Are you sure you want to delete this role?');">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="footer">
        Total Roles: ${role.size()}
    </div>

</div>

</body>
</html>