<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Node Profile</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f4f7;
        }

        .container {
            width: 380px;
            margin: 80px auto;
            padding: 25px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 12px rgba(0,0,0,0.15);
            position: relative;
        }

        /* ✅ BACK BUTTON */
        .back-btn {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 6px 14px;
            background-color: #6b7280;
            color: #ffffff;
            text-decoration: none;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .back-btn:hover {
            background-color: #4b5563;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 12px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 6px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        input[readonly] {
            background-color: #e5e7eb;
            cursor: not-allowed;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-weight: 600;
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
    <a href="${pageContext.request.contextPath}/node/displayNode"
       class="back-btn">
        ← Back
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