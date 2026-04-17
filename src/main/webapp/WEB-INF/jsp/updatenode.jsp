<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Node</title>
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
            border: 1px solid #cccccc;
            border-radius: 4px;
            width: 400px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            margin-top: 0;
            text-align: center;
            color: #333333;
            border-bottom: 1px solid #eeeeee;
            padding-bottom: 10px;
        }

        .error-message {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 3px;
            font-size: 13px;
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
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .role-section {
            border: 1px solid #dddddd;
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

        .button-group {
            display: flex;
            gap: 10px;
        }

        .btn {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            text-align: center;
            font-weight: bold;
        }

        .btn-update {
            background-color: #007bff;
            color: white;
        }

        .btn-cancel {
            background-color: #6c757d;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Update Node</h2>

    <c:if test="${not empty errorMessage}">
        <div class="error-message">
            ${errorMessage}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/nodes/updatenode" method="post">

        <input type="hidden" name="id" value="${node.id}" />

        <label for="nodeName">Node Name</label>
        <input type="text" id="nodeName" name="name" value="${node.name}" required />

        <label for="nodePath">Node Path</label>
        <input type="text" id="nodePath" name="path" value="${node.path}" required />

        <label>Assign Roles</label>
        <div class="role-section">
            <c:forEach var="role" items="${roles}">
                <label class="role-option">
                    <input type="checkbox" name="roles" value="${role.name}"
                        <c:if test="${node.roles != null && node.roles.contains(role.name)}">
                            checked
                        </c:if> />
                    ${role.name}
                </label>
            </c:forEach>
        </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

        <div class="button-group">
            <button type="submit" class="btn btn-update">Update Node</button>
            <a href="${pageContext.request.contextPath}/nodes/displaynodes" class="btn btn-cancel">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>