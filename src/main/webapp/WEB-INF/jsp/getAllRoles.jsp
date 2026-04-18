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

        .card {
            width: 95%;
            max-width: 700px;
            margin: 10px auto 24px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.08);
            padding: 22px;
        }

        /* TOP ACTIONS */
        .top-actions {
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

        .add-role-btn {
            padding: 7px 14px;
            background-color: #2563eb;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
        }

        .add-role-btn:hover {
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

        .edit-link {
            padding: 5px 12px;
            background-color: #2563eb;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 600;
        }

        .edit-link:hover {
            background-color: #1d4ed8;
        }

        .delete-link {
            padding: 5px 12px;
            background-color: #dc2626;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 600;
            margin-left: 6px;
        }

        .delete-link:hover {
            background-color: #b91c1c;
        }

        .footer {
            margin-top: 10px;
            text-align: right;
            font-size: 13.5px;
            color: #6b7280;
        }
    </style>
</head>

<body>

<div class="page-title">Role Dashboard</div>

<div class="card">

    <div class="top-actions">
        <a href="/" class="home-btn">Home</a>

        <a class="add-role-btn"
           href="${pageContext.request.contextPath}/role/addRole">
            Add Role
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