<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Node Profile | ${nodeDto.name}</title>

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
            width: 450px;
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
            text-transform: uppercase;
        }

        .profile-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }

        .label {
            font-weight: 600;
            color: #4b5563;
            width: 35%;
        }

        .value {
            width: 60%;
            text-align: right;
            color: #1f2937;
        }

        /* Hide edit fields by default */
        .edit-field {
            display: none;
            width: 60%;
            padding: 8px 12px;
            border-radius: 8px;
            border: 1px solid #cbd5e1;
            box-sizing: border-box;
        }

        .actions {
            text-align: center;
            margin-top: 30px;
        }

        button {
            padding: 10px 24px;
            border-radius: 25px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: transform 0.2s;
        }

        button:active { transform: scale(0.95); }

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
            background: #f3f4f6;
            color: #374151;
            text-decoration: none;
            display: inline-block;
        }

        /* Toast Notifications */
        .toast {
            position: fixed;
            top: 25px;
            right: -400px;
            min-width: 280px;
            padding: 16px 20px;
            border-radius: 12px;
            color: #fff;
            font-weight: 600;
            box-shadow: 0 10px 15px rgba(0,0,0,0.1);
            transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            z-index: 1000;
        }

        .toast-success { background: #10b981; }
        .toast-error { background: #ef4444; }
        .toast.show { right: 25px; }
    </style>
</head>

<body>

<c:if test="${not empty message}">
    <div id="toast" class="toast ${colour eq 'red' ? 'toast-error' : 'toast-success'}">
        ${message}
    </div>
</c:if>

<div class="profile-container">
    <form action="${pageContext.request.contextPath}/node/update" method="post">

        <input type="hidden" name="id" value="${nodeDto.id}" />

        <div class="profile-header">
            <div class="avatar">
                ${not empty nodeDto.name ? nodeDto.name.substring(0,1) : '?'}
            </div>
            <h2>Node Details</h2>
        </div>

        <div class="profile-row">
            <span class="label">Node Name</span>
            <span class="value display-mode">${nodeDto.name}</span>
            <input type="text" name="name" class="edit-field" value="${nodeDto.name}" required />
        </div>

        <div class="profile-row">
            <span class="label">Path</span>
            <span class="value display-mode">${nodeDto.path}</span>
            <input type="text" name="path" class="edit-field" value="${nodeDto.path}" required />
        </div>

        <div class="profile-row">
            <span class="label">Assigned Roles</span>
            <span class="value display-mode">
                <c:choose>
                    <c:when test="${not empty nodeDto.roles}">
                        <c:forEach var="r" items="${nodeDto.roles}" varStatus="s">
                            ${r}<c:if test="${!s.last}">, </c:if>
                        </c:forEach>
                    </c:when>
                    <c:otherwise><i style="color: #9ca3af;">No roles assigned</i></c:otherwise>
                </c:choose>
            </span>

            <select name="roles" class="edit-field" multiple style="height: 100px;">
                <c:forEach var="role" items="${rolesList}">
                    <option value="${role}"
                        <c:if test="${nodeDto.roles != null && nodeDto.roles.contains(role)}">selected</c:if>>
                        ${role}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="actions">
            <button type="button" class="edit-btn" onclick="enableEdit()">Edit Node</button>
            <button type="submit" class="save-btn">Save Changes</button>

            <a href="${pageContext.request.contextPath}/node/list" class="back-btn">
                <button type="button" style="background:none; color:inherit; padding:0;">← Back</button>
            </a>
        </div>
    </form>
</div>

<script>
    function enableEdit() {
        // Hide display spans
        document.querySelectorAll('.display-mode').forEach(el => el.style.display = 'none');

        // Show input and select fields
        document.querySelectorAll('.edit-field').forEach(el => el.style.display = 'inline-block');

        // Toggle buttons
        document.querySelector('.edit-btn').style.display = 'none';
        document.querySelector('.save-btn').style.display = 'inline-block';
    }

    // Toast Handling
    document.addEventListener("DOMContentLoaded", function () {
        const toast = document.getElementById("toast");
        if (toast) {
            setTimeout(() => toast.classList.add("show"), 100);
            setTimeout(() => {
                toast.classList.remove("show");
                setTimeout(() => toast.remove(), 500);
            }, 4000);
        }
    });
</script>

</body>
</html>