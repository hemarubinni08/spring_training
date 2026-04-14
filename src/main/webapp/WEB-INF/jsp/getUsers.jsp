<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            background: #f4f6f9;
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
        }

        h2 {
            margin-bottom: 15px;
            font-weight: 700;
            color: #111827;
        }

        .search-box {
            margin-bottom: 15px;
        }

        .search-box input {
            width: 100%;
            padding: 12px 14px;
            border-radius: 10px;
            border: 1px solid #e5e7eb;
            outline: none;
            transition: 0.2s;
        }

        .search-box input:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79,70,229,0.15);
        }

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
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background: #f9fafb;
        }

        .badge {
            background: #e0e7ff;
            color: #3730a3;
            padding: 4px 10px;
            border-radius: 8px;
            font-size: 12px;
        }

        .btn-edit {
            background: #3b82f6;
            color: white;
            padding: 6px 10px;
            border-radius: 8px;
            font-size: 13px;
            text-decoration: none;
            margin-right: 6px;
        }

        .btn-edit:hover {
            background: #2563eb;
        }

        .btn-delete {
            background: #ef4444;
            color: white;
            padding: 6px 10px;
            border-radius: 8px;
            border: none;
            font-size: 13px;
            cursor: pointer;
        }

        .btn-delete:hover {
            background: #dc2626;
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
            z-index: 2000;
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
            padding: 10px 14px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
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

        <h2>User Management</h2>

        <div class="search-box">
            <input type="text" id="searchInput" placeholder="Search users...">
        </div>

        <table id="userTable">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Username</th>
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
                        <a class="btn-edit"
                           href="${pageContext.request.contextPath}/user/profileid/${user.id}">
                            Edit
                        </a>

                        <button class="btn-delete"
                                onclick="openModal('${user.email}')">
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>

<!-- TOAST -->
<div id="toast" class="toast"></div>

<!-- MODAL -->
<div id="modal" class="modal-overlay">
    <div class="modal">
        <p>Are you sure you want to delete this user?</p>
        <button class="btn-danger" id="confirmBtn">Yes</button>
        <button class="btn-secondary" onclick="closeModal()">Cancel</button>
    </div>
</div>

<script>
    let deleteEmail = null;

    document.getElementById("searchInput").addEventListener("keyup", function () {
        let filter = this.value.toLowerCase();
        document.querySelectorAll("#userTable tbody tr").forEach(row => {
            row.style.display = row.innerText.toLowerCase().includes(filter) ? "" : "none";
        });
    });

    function openModal(email) {
        deleteEmail = email;
        document.getElementById("modal").style.display = "flex";
    }

    function closeModal() {
        document.getElementById("modal").style.display = "none";
    }

    document.getElementById("confirmBtn").onclick = function () {
        window.location.href = "${pageContext.request.contextPath}/user/delete/" + deleteEmail;
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