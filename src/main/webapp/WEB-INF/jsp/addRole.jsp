<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Role Management</title>

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 30px;
        }

        h2 {
            margin-bottom: 15px;
            color: #333;
        }

        .card {
            background: #fff;
            padding: 20px;
            margin-bottom: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        .message-success {
            color: #155724;
            background: #d4edda;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 15px;
        }

        .message-error {
            color: #721c24;
            background: #f8d7da;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 15px;
        }

        form input[type="text"] {
            width: 250px;
            padding: 8px 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-right: 8px;
        }

        button {
            padding: 8px 14px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-edit {
            background-color: #17a2b8;
            color: white;
        }

        .btn-edit:hover {
            background-color: #117a8b;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
            text-decoration: none;
            padding: 7px 12px;
            border-radius: 5px;
        }

        .btn-delete:hover {
            background-color: #b52a37;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #eee;
            text-align: left;
        }

        th {
            background-color: #f1f1f1;
        }

        tr:hover {
            background-color: #fafafa;
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
        }

        function confirmDelete() {
            return confirm("Are you sure you want to delete this role?");
        }
    </script>
</head>

<body>

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
        <input type="text" id="roleName" name="name"
               placeholder="Enter role name"
               value="${role.name}" required />
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

</body>
</html>