<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

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
            margin: 60px auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            color: #111827;
        }

        .search-box {
            margin-bottom: 15px;
        }

        .search-box input {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            outline: none;
            font-size: 14px;
            transition: 0.2s;
        }

        .search-box input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
        }

        thead {
            background: linear-gradient(90deg, #4f46e5, #6366f1);
            color: white;
        }

        th, td {
            padding: 12px 14px;
            text-align: center;
        }

        tbody tr {
            transition: 0.2s;
        }

        tbody tr:hover {
            background: #f9fafb;
        }

        a {
            color: #4f46e5;
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        .btn-delete {
            background: #ef4444;
            border: none;
            color: white;
            padding: 6px 10px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-delete:hover {
            background: #dc2626;
            transform: scale(1.05);
        }

        .btn-edit {
            background: #3b82f6;
            color: white;
            padding: 6px 10px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13px;
            transition: 0.2s;
            margin-right: 6px;
        }

        .btn-edit:hover {
            background: #2563eb;
            transform: scale(1.05);
        }

        .badge {
            padding: 4px 8px;
            border-radius: 6px;
            background: #e0e7ff;
            color: #3730a3;
            font-size: 12px;
        }
    </style>
</head>

<body>

<a class="back-arrow" href="${pageContext.request.contextPath}/">
    ←
</a>

<div class="container">

    <h2>User Management Dashboard</h2>

    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Search users by name, email, username...">
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
                <td>
                    <a href="${pageContext.request.contextPath}/user/profileJdbc/id/${user.id}">
                        ${user.id}
                    </a>
                </td>

                <td>${user.name}</td>

                <td>
                    <a href="${pageContext.request.contextPath}/user/profileJdbc/id/${user.id}">
                        ${user.email}
                    </a>
                </td>

                <td>${user.phoneNo}</td>

                <td>
                    <span class="badge">${user.userName}</span>
                </td>

                <td>
                    <a class="btn-edit"
                       href="${pageContext.request.contextPath}/user/profileid/${user.id}">
                        Edit
                    </a>

                    <c:url var="deleteUrl" value="/user/delete/${user.email}" />
                    <form action="${deleteUrl}" method="post"
                          style="display:inline;"
                          onsubmit="return confirmDelete();">

                        <button class="btn-delete" type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<script>
    document.getElementById("searchInput").addEventListener("keyup", function () {
        let filter = this.value.toLowerCase();
        let rows = document.querySelectorAll("#userTable tbody tr");

        rows.forEach(row => {
            row.style.display = row.innerText.toLowerCase().includes(filter) ? "" : "none";
        });
    });

    function confirmDelete() {
        return confirm("Are you sure you want to delete this user?");
    }
</script>

</body>
</html>