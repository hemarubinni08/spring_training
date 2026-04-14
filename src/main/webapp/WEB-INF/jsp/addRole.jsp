<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Role Management</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f4f6f9;
            margin: 0;
            color: #1f2937;
        }

        .back-arrow {
            position: fixed;
            top: 18px;
            left: 18px;
            width: 44px;
            height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: white;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.12);
            text-decoration: none;
            font-size: 20px;
            color: #4f46e5;
            transition: 0.2s;
            z-index: 1000;
        }

        .back-arrow:hover {
            transform: translateX(-3px);
            background: #eef2ff;
        }

        .container {
            max-width: 1100px;
            margin: 70px auto;
            padding: 0 20px;
        }

        .card {
            background: white;
            padding: 22px;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }

        h2 {
            margin-bottom: 15px;
            font-weight: 700;
            color: #111827;
        }

        .form-row {
            display: flex;
            gap: 12px;
            align-items: center;
            flex-wrap: wrap;
        }

        input {
            flex: 1;
            min-width: 260px;
            padding: 12px 14px;
            border-radius: 10px;
            border: 1px solid #e5e7eb;
            outline: none;
            transition: 0.2s;
            font-size: 14px;
        }

        input:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79,70,229,0.15);
        }

        button {
            padding: 12px 16px;
            border: none;
            border-radius: 10px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
        }

        th {
            background: #eef2ff;
            padding: 14px;
            text-align: left;
            color: #3730a3;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background: #f9fafb;
        }

        .btn-edit {
            background: #3b82f6;
            color: white;
            padding: 6px 10px;
            border-radius: 8px;
            font-size: 13px;
        }

        .btn-edit:hover {
            background: #2563eb;
        }

        .btn-delete {
            background: #ef4444;
            color: white;
            padding: 6px 10px;
            border-radius: 8px;
            font-size: 13px;
            border: none;
        }

        .btn-delete:hover {
            background: #dc2626;
        }

        .actions {
            display: flex;
            gap: 8px;
        }

        /* TOAST */
        .toast {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: #111827;
            color: white;
            padding: 12px 16px;
            border-radius: 10px;
            opacity: 0;
            transform: translateY(20px);
            transition: 0.3s;
            z-index: 2000;
        }

        .toast.show {
            opacity: 1;
            transform: translateY(0);
        }

        /* MODAL */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.4);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 1500;
        }

        .modal {
            background: white;
            padding: 20px;
            border-radius: 12px;
            width: 320px;
            text-align: center;
        }

        .modal button {
            margin: 8px;
        }

        .btn-danger {
            background: #ef4444;
            color: white;
        }

        .btn-secondary {
            background: #e5e7eb;
        }
    </style>
</head>

<body>

<a class="back-arrow" href="${pageContext.request.contextPath}/">
    ←
</a>

<div class="container">

    <div class="card">
        <h2>Role Management</h2>

        <c:if test="${not empty errorMessage}">
            <script>window.onload = () => showToast("${errorMessage}");</script>
        </c:if>

        <c:if test="${not empty successMessage}">
            <script>window.onload = () => showToast("${successMessage}");</script>
        </c:if>

        <form method="post" action="${pageContext.request.contextPath}/role/addroles">
            <div class="form-row">
                <input type="hidden" id="roleId" name="id" value="${role.id}" />

                <input type="text"
                       id="roleName"
                       name="name"
                       value="${role.name}"
                       placeholder="Enter role name"
                       required />

                <button id="submitBtn" class="btn-primary" type="submit">
                    Save Role
                </button>
            </div>
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

                        <button class="btn-delete"
                                onclick="openDeleteModal('${r.id}')">
                            Delete
                        </button>

                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>

<!-- TOAST -->
<div id="toast" class="toast"></div>

<!-- MODAL -->
<div id="modal" class="modal-overlay">
    <div class="modal">
        <p>Are you sure you want to delete this role?</p>
        <button class="btn-danger" id="confirmDeleteBtn">Yes</button>
        <button class="btn-secondary" onclick="closeModal()">Cancel</button>
    </div>
</div>

<script>
    let deleteId = null;

    function editRole(id, name) {
        document.getElementById("roleId").value = id;
        document.getElementById("roleName").value = name;
        document.getElementById("submitBtn").innerText = "Update Role";
        window.scrollTo({ top: 0, behavior: "smooth" });
    }

    function openDeleteModal(id) {
        deleteId = id;
        document.getElementById("modal").style.display = "flex";
    }

    function closeModal() {
        document.getElementById("modal").style.display = "none";
    }

    document.getElementById("confirmDeleteBtn").onclick = function () {
        window.location.href = "${pageContext.request.contextPath}/role/delete/" + deleteId;
    };

    function showToast(msg) {
        const toast = document.getElementById("toast");
        toast.innerText = msg;
        toast.classList.add("show");

        setTimeout(() => {
            toast.classList.remove("show");
        }, 3000);
    }
</script>

</body>
</html>