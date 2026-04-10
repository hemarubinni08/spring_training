<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Role Management (JDBC)</title>

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #020617;
            color: #e5e7eb;
            padding: 30px;
        }

        .card {
            background: #020617;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            border: 1px solid #1e293b;
        }

        h2 {
            color: #38bdf8;
            margin-bottom: 15px;
        }

        input[type="text"] {
            padding: 10px;
            border-radius: 6px;
            border: none;
            width: 260px;
        }

        button {
            padding: 10px 18px;
            border-radius: 6px;
            background: #38bdf8;
            border: none;
            color: #000;
            cursor: pointer;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #1e293b;
            text-align: left;
        }

        th {
            color: #22d3ee;
        }

        .edit {
            background: #22d3ee;
            padding: 6px 12px;
            border-radius: 4px;
            color: #000;
            margin-right: 8px;
            border: none;
            cursor: pointer;
        }

        .delete {
            color: #f87171;
            text-decoration: none;
            font-weight: 600;
        }

        .success {
            color: #22c55e;
            margin-bottom: 10px;
        }

        .error {
            color: #f87171;
            margin-bottom: 10px;
        }
    </style>

    <script>
        function editRoleJdbc(id, name) {
            document.getElementById("rid").value = id;
            document.getElementById("rname").value = name;
            document.getElementById("roleForm").action =
                "${pageContext.request.contextPath}/role/updatejdbc";
        }
    </script>
</head>

<body>

<div class="card">
    <h2>Add / Update Role (JDBC)</h2>

    <c:if test="${not empty successMessage}">
        <div class="success">${successMessage}</div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <form id="roleForm"
          method="post"
          action="${pageContext.request.contextPath}/role/addjdbc">

        <input type="hidden" id="rid" name="id" />

        <input type="text"
               id="rname"
               name="name"
               placeholder="Role name"
               required />

        <button type="submit">Save</button>
    </form>
</div>

<div class="card">
    <h2>All JDBC Roles</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="r" items="${roles}">
            <tr>
                <td>${r.id}</td>
                <td>${r.name}</td>
                <td>
                    <button class="edit"
                            onclick="editRoleJdbc('${r.id}','${r.name}')">
                        Edit
                    </button>

                    <a class="delete"
                       href="${pageContext.request.contextPath}/role/deletejdbc/${r.id}"
                       onclick="return confirm('Delete this role?')">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>