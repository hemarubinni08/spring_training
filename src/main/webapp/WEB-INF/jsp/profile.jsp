<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>

    <style>
        body {
            background: linear-gradient(120deg,#0f2027,#203a43,#2c5364);
            font-family: Arial;
            color: #fff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            width: 400px;
            background: #1e1e1e;
            padding: 20px;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
        }

        label {
            display: block;
            margin-top: 10px;
            color: #bbb;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            background: #333;
            border: none;
            color: white;
        }

        button {
            margin-top: 15px;
            width: 100%;
            padding: 10px;
            background: #4da6ff;
            border: none;
            color: white;
            cursor: pointer;
        }

        .success {
            margin-top: 10px;
            text-align: center;
            color: lightgreen;
        }

        select {
            width: 100%;
            padding: 9px;
            margin-top: 10px;
            background: #2b2b2b;
            border: 1px solid #444;
            border-radius: 6px;
            color: white;
            font-size: 14px;
            cursor: pointer;
        }

        select:focus {
            outline: none;
            border-color: #4da6ff;
            box-shadow: 0 0 6px rgba(77,166,255,0.6);
        }

        option {
            background: #2b2b2b;
            color: white;
        }

        .dropdown {
            position: relative;
            width: 100%;
            margin-top: 6px;
        }

        .dropdown-btn {
            padding: 12px;
            background: #223743;
            border: 1px solid #34515d;
            border-radius: 8px;
            cursor: pointer;
            color: #fff;
            user-select: none;
        }

        .dropdown-btn:hover {
            background: #2b4a5b;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            top: 110%;
            left: 0;
            width: 100%;
            background: #2b2b2b;
            border: 1px solid #444;
            border-radius: 8px;
            max-height: 180px;
            overflow-y: auto;
            z-index: 1000;
            box-shadow: 0 12px 30px rgba(0,0,0,0.6);
        }

        .dropdown-content label {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 12px;
            color: #ddd;
            cursor: pointer;
        }

        .dropdown-content label:hover {
            background: #383838;
        }

        .dropdown-content input[type="checkbox"] {
            accent-color: #4da6ff;
        }

        .update-btn:hover {
            background: #66b3ff;
        }

        .back {
            display: inline-block;
            margin-bottom: 12px;
            color: #4da6ff;
            text-decoration: none;
            font-size: 14px;
        }

        .back:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="card">

    <a class="back" href="${pageContext.request.contextPath}/user/users">
        ← Back
    </a>

    <h2>User Profile</h2>

    <form action="/user/updateByEmail/${user.id}" method="post">

        <input type="hidden" name="id" value="${user.id}" />

        <label>Username</label>
        <input type="text" name="userName" value="${user.userName}" />

        <label>Email</label>
        <input type="email" name="email" value="${user.email}" />

        <label>Password</label>
        <input type="password" name="password" value="${user.password}" />

        <label>Primary Role</label>
        <div class="dropdown">
            <div class="dropdown-btn" id="primaryBtn"
                 onclick="toggleDropdown(event, 'primaryContent')">
                Select Role ▼
            </div>

            <div class="dropdown-content" id="primaryContent">
                <c:forEach var="role" items="${roles}">
                    <label>
                        <input type="checkbox"
                               name="primaryRole"
                               value="${role.name}"
                               onchange="handleSingleRoleSelection(this)">
                        ${role.name}
                    </label>
                </c:forEach>
            </div>
        </div>

        <label>Additional Roles</label>
        <div class="dropdown">
            <div class="dropdown-btn"
                 onclick="toggleDropdown(event, 'multiContent')">
                Select Additional Roles ▼
            </div>

            <div class="dropdown-content" id="multiContent">
                <c:forEach var="role" items="${roles}">
                    <label>
                        <input type="checkbox"
                               name="additionalRoles"
                               value="${role.name}">
                        ${role.name}
                    </label>
                </c:forEach>
            </div>
        </div>

        <button type="submit" class="update-btn">Update</button>

        <c:if test="${not empty msg}">
            <div class="success">${msg}</div>
        </c:if>

    </form>
</div>

<script>
function toggleDropdown(event, contentId) {
    event.stopPropagation();
    document.querySelectorAll('.dropdown-content')
        .forEach(d => d.style.display = 'none');
    const dropdown = document.getElementById(contentId);
    dropdown.style.display =
        dropdown.style.display === 'block' ? 'none' : 'block';
}

function handleSingleRoleSelection(selectedCheckbox) {
    const checkboxes = document.querySelectorAll(
        '#primaryContent input[type="checkbox"]'
    );
    checkboxes.forEach(cb => {
        if (cb !== selectedCheckbox) cb.checked = false;
    });
    const btn = document.getElementById("primaryBtn");
    btn.textContent = selectedCheckbox.checked
        ? selectedCheckbox.value + " ▼"
        : "Select Role ▼";
}

document.querySelectorAll('.dropdown-content').forEach(dc => {
    dc.addEventListener('click', e => e.stopPropagation());
});

document.addEventListener('click', () => {
    document.querySelectorAll('.dropdown-content')
        .forEach(d => d.style.display = 'none');
});
</script>

</body>
</html>
``