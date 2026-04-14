<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Role Management</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 30px;
            color: #1f2937;
        }

        .back-arrow {
            position: fixed;
            top: 18px;
            left: 18px;
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
            text-decoration: none;
            font-size: 20px;
            color: #4f46e5;
            transition: 0.2s;
        }

        .back-arrow:hover {
            transform: translateX(-3px);
            background: #eef2ff;
        }

        .container {
            max-width: 1100px;
            margin: 60px auto 0;
        }

        .card {
            background: #ffffff;
            padding: 20px;
            margin-bottom: 25px;
            border-radius: 14px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        h2 {
            margin-bottom: 15px;
            color: #111827;
            font-weight: 600;
        }

        input {
            width: 260px;
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #e5e7eb;
            margin-right: 10px;
            outline: none;
            transition: 0.2s;
        }

        input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,0.2);
        }

        button {
            padding: 10px 14px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: 0.2s;
        }

        .btn-primary {
            background: linear-gradient(90deg, #4f46e5, #6366f1);
            color: white;
        }

        .btn-primary:hover {
            transform: scale(1.03);
        }

        .btn-edit {
            background: #3b82f6;
            color: white;
            padding: 6px 10px;
            border-radius: 6px;
        }

        .btn-edit:hover {
            background: #2563eb;
        }

        .btn-delete {
            background: #ef4444;
            color: white;
            padding: 6px 10px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
        }

        .btn-delete:hover {
            background: #dc2626;
        }

        .message-success {
            background: #dcfce7;
            color: #166534;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .message-error {
            background: #fee2e2;
            color: #991b1b;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 12px;
        }

        th {
            background: linear-gradient(90deg, #4f46e5, #6366f1);
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background: #f9fafb;
        }

        .actions {
            display: flex;
            gap: 8px;
        }
    </style>

    <script>
        function editRole(id, name) {
            document.getElementById("roleId").value = id;
            document.getElementById("roleName").value = name;
            document.getElementById("submitBtn").innerText = "Update Role";

            window.scrollTo({ top: 0, behavior: "smooth" });
        }

        function confirmDelete() {
            return confirm("Are you sure you want to delete this role?");
        }
    </script>
</head>

<body>

<a class="back-arrow" href="${pageContext.request.contextPath}/">
    ←
</a>

<div class="container">

    <div class="card">
        <h2>Add / Update Role</h2>

        <c:if test="${not empty errorMessage}">
            <div class="message-error">${errorMessage}</div>
        </c:if>

        <c:if test="${not empty successMessage}">
            <div class="message-success">${successMessage}</div>
        </c:if>

        <form method="post" action="${pageContext.request.contextPath}/role/addroles">

            <input type="hidden" id="roleId" name="id" value="${role.id}" />

            <input type="text"
                   id="roleName"
                   name="name"
                   value="${role.name}"
                   placeholder="Enter role name"
                   required />

            <button id="submitBtn" type="submit" class="btn-primary">
                Save Role
            </button>
        </form>
    </div>

    <div class="card">
        <h2>All Roles</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Role Name</th>
                <th>Actions</th>
            </tr>

            <c:forEach var="r" items="${roles}">
                <tr>
                    <td>${r.id}</td>
                    <td>${r.name}</td>
                    <td class="actions">
                        <button class="btn-edit"
                                onclick="editRole('${r.id}','${r.name}')">
                            Edit
                        </button>

                        <a class="btn-delete"
                           href="${pageContext.request.contextPath}/role/delete/${r.id}"
                           onclick="return confirmDelete()">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>

</body>
</html>