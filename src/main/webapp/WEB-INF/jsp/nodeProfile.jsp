<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Node Profile</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
            background-color: #f6f7f9;
            color: #1f2937;
        }

        .container {
            width: 380px;
            padding: 24px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            position: relative;
        }

        /* ✅ BACK BUTTON (LEFT, CONSISTENT) */
        .back-btn {
            position: absolute;
            top: 18px;
            left: 18px;
            padding: 6px 14px;
            background-color: #eef0f3;
            color: #374151;
            text-decoration: none;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            border: 1px solid #d1d5db;
        }

        .back-btn:hover {
            background-color: #e5e7eb;
        }

        h2 {
            text-align: center;
            margin: 12px 0 22px;
            font-size: 22px;
            font-weight: 600;
        }

        label {
            display: block;
            margin-top: 14px;
            font-size: 12px;
            font-weight: 600;
            color: #475569;
        }

        input, select {
            width: 100%;
            padding: 9px 11px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
            font-size: 14px;
            color: #1f2937;
        }

        input[readonly] {
            background-color: #f9fafb;
            cursor: not-allowed;
        }

        button {
            margin-top: 22px;
            width: 100%;
            padding: 10px;
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1d4ed8;
        }
    </style>
</head>

<body>

<div class="container">

    <!-- ✅ BACK TO NODE DISPLAY -->
    <a href="${pageContext.request.contextPath}/node/displayNode" class="back-btn">
        Back
    </a>

    <h2>Edit Node</h2>

    <form action="${pageContext.request.contextPath}/node/editNode" method="post">

        <!-- SHOW ID -->
        <label>Node ID</label>
        <input type="text" value="${nodeDto.id}" readonly />

        <!-- SUBMIT ID -->
        <input type="hidden" name="id" value="${nodeDto.id}" />

        <!-- NAME -->
        <label>Name</label>
        <input type="text" name="name" value="${nodeDto.name}" required />

        <!-- PATH -->
        <label>Path</label>
        <input type="text" name="path" value="${nodeDto.path}" required />

        <!-- ROLES -->
        <label>Roles</label>
        <select name="roleNames" multiple required>
            <c:forEach var="role" items="${roles}">
                <option value="${role.name}"
                    <c:forEach var="assignedRole" items="${nodeDto.roleNames}">
                        <c:if test="${assignedRole eq role.name}">
                            selected
                        </c:if>
                    </c:forEach>>
                    ${role.name}
                </option>
            </c:forEach>
        </select>

        <button type="submit">Update Node</button>
    </form>

</div>

</body>
</html>