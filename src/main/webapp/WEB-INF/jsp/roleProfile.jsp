<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Role Profile</title>

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

        .profile-container {
            width: 420px;
            background: #ffffff;
            padding: 30px;
            border-radius: 28px;
            box-shadow: 0 18px 35px rgba(0,0,0,0.15);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 25px;
        }

        .avatar {
            width: 80px;
            height: 80px;
            background: linear-gradient(120deg, #1d2b64, #6dd5ed);
            color: #fff;
            border-radius: 50%;
            line-height: 80px;
            font-size: 34px;
            font-weight: 600;
            margin: 0 auto 10px auto;
        }

        h2 {
            margin: 8px 0;
            color: #333;
        }

        .profile-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }

        .label {
            font-weight: 600;
            color: #555;
            width: 40%;
        }

        .value {
            color: #333;
            width: 60%;
            text-align: right;
        }

        input[type="text"] {
            width: 60%;
            padding: 7px 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 13px;
            display: none;
        }

        .actions {
            text-align: center;
            margin-top: 25px;
        }

        button {
            padding: 9px 22px;
            border-radius: 20px;
            border: none;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            margin: 5px;
        }

        .edit-btn {
            background: linear-gradient(120deg, #36d1dc, #5b86e5);
            color: white;
        }

        .save-btn {
            background: linear-gradient(120deg, #22c55e, #16a34a);
            color: white;
            display: none;
        }

        .back-btn {
            background: #e5e7eb;
            color: #111827;
        }

        /* ✅ Toast Notification */
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

        .toast-Error {
                    background: linear-gradient(120deg, #22c55e, #16a34a);
        }

        .toast.show {
            right: 20px;
            opacity: 1;
        }
    </style>
</head>

<body>

<!-- ✅ Toast Message -->
<c:if test="${not empty message}">
    <div id="toast" class="toast toast-success">
        ${message}
    </div>
</c:if>

<div class="profile-container">

    <form action="${pageContext.request.contextPath}/role/updateRoleJdbc" method="post">

        <!-- Hidden ID -->
        <input type="hidden" name="id" value="${roleDto.id}" />

        <div class="profile-header">
            <div class="avatar">
                ${roleDto.name.substring(0,1)}
            </div>
            <h2>Role Profile</h2>
        </div>

        <!-- Role Name -->
        <div class="profile-row">
            <span class="label">Role Name</span>
            <span class="value">${roleDto.name}</span>
            <input type="text" name="name" value="${roleDto.name}" />
        </div>

        <!-- Actions -->
        <div class="actions">
            <button type="button" class="edit-btn" onclick="enableEdit()">Edit Role</button>
            <button type="submit" class="save-btn">Save Changes</button>

            <a href="${pageContext.request.contextPath}/role/showRolesListJdbc">
                <button type="button" class="back-btn">← Back to List</button>
            </a>
        </div>

    </form>

</div>

<script>
    function enableEdit() {
        document.querySelectorAll('.value')
            .forEach(v => v.style.display = 'none');

        document.querySelectorAll('input[type="text"]')
            .forEach(i => i.style.display = 'inline-block');

        document.querySelector('.edit-btn').style.display = 'none';
        document.querySelector('.save-btn').style.display = 'inline-block';
    }

    // ✅ Toast Animation
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