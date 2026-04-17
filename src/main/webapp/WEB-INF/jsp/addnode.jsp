<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Node</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 400px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            margin-top: 0;
            text-align: center;
            color: #333;
        }

        .error-message {
            color: #d9534f;
            background-color: #f2dede;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 15px;
            font-size: 14px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 14px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Ensures padding doesn't affect width */
        }

        .role-section {
            border: 1px solid #ddd;
            padding: 10px;
            max-height: 150px;
            overflow-y: auto;
            margin-bottom: 20px;
            background: #fafafa;
        }

        .role-option {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            font-weight: normal;
        }

        .actions {
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            text-align: center;
        }

        .btn-save {
            background-color: #28a745;
            color: white;
            flex-grow: 1;
            margin-right: 10px;
        }

        .btn-cancel {
            background-color: #6c757d;
            color: white;
            flex-grow: 1;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Add New Node</h2>

    <c:if test="${not empty errorMessage}">
        <div class="error-message">
            ${errorMessage}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/nodes/addnodes" method="post">

        <label>Node Name</label>
        <input type="text" name="name" value="${nodeDto.name}" placeholder="Enter node name" required />

        <label>Node Path</label>
        <input type="text" name="path" value="${nodeDto.path}" placeholder="/example/path" required />

        <label>Assign Roles</label>
        <div class="role-section">
            <c:forEach var="role" items="${roles}">
                <label class="role-option">
                    <input type="checkbox" name="roles" value="${role.name}" />
                    ${role.name}
                </label>
            </c:forEach>
        </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

        <div class="actions">
            <button type="submit" class="btn btn-save">Save Node</button>
            <a href="${pageContext.request.contextPath}/nodes/displaynodes" class="btn btn-cancel">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>