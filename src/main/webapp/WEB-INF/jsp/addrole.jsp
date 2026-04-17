<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Role</title>
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
            width: 350px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        h2 {
            margin-top: 0;
            text-align: center;
            color: #333;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }

        .error-msg {
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
            margin-bottom: 8px;
            font-weight: bold;
            font-size: 14px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box; /* Crucial for width alignment */
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        .btn {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            text-align: center;
            font-weight: bold;
        }

        .btn-save {
            background-color: #28a745;
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
    <h2>Add New Role</h2>

    <c:if test="${not empty errorMessage}">
        <div class="error-msg">${errorMessage}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/roles/addroles" method="post">

        <label for="roleName">Role Name</label>
        <input type="text"
               id="roleName"
               name="name"
               value="${roleDto.name}"
               placeholder="e.g. ADMIN_USER"
               required />

        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}" />

        <div class="actions">
            <button type="submit" class="btn btn-save">Save Role</button>
            <a href="${pageContext.request.contextPath}/roles/displayroles" class="btn btn-cancel">Cancel</a>
        </div>

    </form>
</div>

</body>
</html>