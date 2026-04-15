<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Role Management</title>

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
            width: 900px;
            background: #ffffff;
            padding: 30px;
            border-radius: 28px;
            box-shadow: 0 18px 35px rgba(0,0,0,0.15);
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        /* Add Role */
        .add-role {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 25px;
        }

        .add-role input {
            width: 260px;
            padding: 9px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .btn-add {
            padding: 9px 22px;
            border-radius: 20px;
            border: none;
            font-weight: 600;
            background: linear-gradient(120deg, #36d1dc, #5b86e5);
            color: white;
            cursor: pointer;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        thead {
            background: linear-gradient(120deg, #1d2b64, #6dd5ed);
            color: white;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }

        tbody tr:nth-child(even) {
            background: #f6f9ff;
        }

        tbody tr:hover {
            background: linear-gradient(120deg, #eef2ff, #dbeafe);
        }

        /* Buttons */
        .btn-view {
            padding: 6px 16px;
            border-radius: 18px;
            text-decoration: none;
            font-weight: 600;
            font-size: 12px;
            color: white;
            margin-right: 6px;
            background: linear-gradient(120deg, #36d1dc, #5b86e5);
            display: inline-block;
        }

        .btn-delete {
            background: linear-gradient(120deg, #ff416c, #ff4b2b);
        }

        .toast {
            position: fixed;
            top: 20px;
            right: -400px;
            min-width: 260px;
            max-width: 320px;
            padding: 14px 20px;
            border-radius: 12px;
            color: #fff;
            font-size: 14px;
            font-weight: 600;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            z-index: 9999;
            opacity: 0;
            transition: all 0.5s ease;
        }

        .toast-success {
            background: linear-gradient(120deg, #22c55e, #16a34a);
        }


        .toast-error {
            background: linear-gradient(120deg, #ef4444, #dc2626);
        }


        .toast.show {
            right: 20px;
            opacity: 1;
        }
    </style>
</head>

<body>

<c:set var="toastClass"
       value="${colour eq 'red' ? 'toast-error' : 'toast-success'}" />

<c:if test="${not empty message}">
    <div id="toast" class="toast ${toastClass}">
        ${message}
    </div>
</c:if>


<div class="container">
    <h1>Role Management</h1>

    <form action="/role/add"
          method="post"
          class="add-role">
        <input type="text" name="name" placeholder="Enter role name" required />
        <button type="submit" class="btn-add">Add Role</button>
    </form>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Role Name</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="role" items="${rolesList}">
            <tr>
                <td>${role.id}</td>
                <td>${role.name}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/role/profile/${role.id}"
                       class="btn-view">
                        View / Edit
                    </a>

                    <a href="${pageContext.request.contextPath}/role/delete/${role.id}"
                       class="btn-view btn-delete"
                       onclick="return confirm('Are you sure you want to delete this role?')">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="action-cell">
            <a href="${pageContext.request.contextPath}/"
                style="display:inline-block; margin-top:15px; font-weight:600; color:#2563eb; text-decoration:none;">
                    ← Back to Homepage
            </a>
        </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const toast = document.getElementById("toast");

        if (toast) {
            setTimeout(() => toast.classList.add("show"), 200);
            setTimeout(() => toast.classList.remove("show"), 3200);
            setTimeout(() => toast.remove(), 3800);
        }
    });
</script>

</body>
</html>
