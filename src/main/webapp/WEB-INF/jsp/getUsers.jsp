<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        *{box-sizing:border-box;}

        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            background: #f4f6f9;
            color: #1f2937;
        }

        /* BACK BUTTON */
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
        }

        .back-arrow:hover {
            transform: translateX(-3px);
            background: #eef2ff;
        }

        /* LAYOUT */
        .container {
            max-width: 1100px;
            margin: 70px auto;
            padding: 0 20px;
        }

        .card {
            background: white;
            padding: 24px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        }

        h2 {
            margin-bottom: 10px;
            font-weight: 700;
            color: #111827;
        }

        /* HEADER ACTIONS */
        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        /* ADD BUTTON */
        .btn-add {
            background: #10b981;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-add:hover {
            background: #059669;
            transform: translateY(-1px);
        }

        /* SEARCH */
        .search-box {
            margin-bottom: 18px;
        }

        .search-box input {
            width: 100%;
            padding: 12px 14px;
            border-radius: 10px;
            border: 1px solid #e5e7eb;
            outline: none;
            transition: 0.2s;
            font-size: 14px;
        }

        .search-box input:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79,70,229,0.15);
        }

        /* TABLE */
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
        }

        th {
            background: #eef2ff;
            color: #3730a3;
            padding: 14px;
            text-align: left;
            font-size: 13px;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #e5e7eb;
            vertical-align: middle;
        }

        tr:hover {
            background: #f9fafb;
        }

        /* BADGES */
        .badge {
            background: #e0e7ff;
            color: #3730a3;
            padding: 4px 10px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 500;
        }

        /* ACTION BUTTONS */
        .actions {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .actions a,
        .actions button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            height: 34px;
            min-width: 70px;
            padding: 0 12px;
            font-size: 13px;
            font-weight: 500;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-edit {
            background: #3b82f6;
            color: white;
            text-decoration: none;
        }

        .btn-edit:hover {
            background: #2563eb;
        }

        .btn-delete {
            background: #ef4444;
            color: white;
        }

        .btn-delete:hover {
            background: #dc2626;
        }

        /* MODAL */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.45);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 2000;
        }

        .modal {
            background: white;
            padding: 24px;
            border-radius: 14px;
            width: 340px;
            text-align: center;
        }
    </style>
</head>

<body>

<a class="back-arrow" href="${pageContext.request.contextPath}/">←</a>

<div class="container">
    <div class="card">

        <!-- HEADER -->
        <div class="header-actions">
            <h2>User Management</h2>
            <button class="btn-add" onclick="goToRegister()">+ Add User</button>
        </div>

        <!-- SEARCH -->
        <div class="search-box">
            <input type="text" id="searchInput" placeholder="Search users...">
        </div>

        <!-- TABLE -->
        <table id="userTable">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Username</th>
                <th>Role</th>
                <th>Roles</th>
                <th>Action</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="user" items="${getUsers}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.phoneNo}</td>
                    <td><span class="badge">${user.userName}</span></td>

                    <td>
                        <span class="badge">
                            <c:choose>
                                <c:when test="${not empty user.role}">
                                    ${user.role}
                                </c:when>
                                <c:otherwise>No Role</c:otherwise>
                            </c:choose>
                        </span>
                    </td>

                    <td>
                        <span class="badge">
                            <c:choose>
                                <c:when test="${not empty user.roles}">
                                    ${user.roles}
                                </c:when>
                                <c:otherwise>No Role</c:otherwise>
                            </c:choose>
                        </span>
                    </td>

                    <td>
                        <div class="actions">
                            <a class="btn-edit"
                               href="${pageContext.request.contextPath}/user/profileid/${user.id}">
                                Edit
                            </a>

                            <button class="btn-delete"
                                    onclick="openModal('${user.email}')">
                                Delete
                            </button>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>

<!-- MODAL -->
<div id="modal" class="modal-overlay">
    <div class="modal">
        <h3>Confirm Delete</h3>
        <p>This action cannot be undone.</p>

        <form id="deleteForm" method="post">
            <button type="submit" class="btn-delete">Yes, Delete</button>
            <button type="button" onclick="closeModal()">Cancel</button>
        </form>
    </div>
</div>

<script>
    function goToRegister() {
        window.location.href = "${pageContext.request.contextPath}/user/register";
    }

    function openModal(email) {
        document.getElementById("deleteForm").action =
            "${pageContext.request.contextPath}/user/delete/" + email;

        document.getElementById("modal").style.display = "flex";
    }

    function closeModal() {
        document.getElementById("modal").style.display = "none";
    }

    document.getElementById("searchInput").addEventListener("keyup", function () {
        let filter = this.value.toLowerCase();
        document.querySelectorAll("#userTable tbody tr").forEach(row => {
            row.style.display = row.innerText.toLowerCase().includes(filter) ? "" : "none";
        });
    });
</script>

</body>
</html>