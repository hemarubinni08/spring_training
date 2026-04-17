<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Role Registration (JDBC)</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #667eea, #764ba2);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container-box {
            width: 320px;
            background: #ffffff;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #28a745;
            font-size: 22px;
        }
        label {
            font-weight: 600;
            color: #333;
            margin-bottom: 4px;
            display: block;
            font-size: 14px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 13px;
        }
        .form-control:focus {
            border-color: #28a745;
            box-shadow: 0 0 5px rgba(40, 167, 69, 0.3);
            outline: none;
        }
        .btn-register {
            width: 100%;
            padding: 11px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }
        .btn-register:hover {
            background: #218838;
        }
        .success {
            background: #e6ffed;
            color: #006600;
            padding: 8px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 12px;
        }
        .error {
            background: #ffe6e6;
            color: #cc0000;
            padding: 8px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 12px;
        }
    </style>
</head>
<body>
<div class="container-box">
    <h2>Add Role (JDBC)</h2>
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    <c:if test="${not empty success}">
        <p class="success">${success}</p>
    </c:if>
    <form action="/role/add-jdbc" method="post">
        <label>Role Name</label>
        <input type="text"
               name="name"
               value="${role.name}"
               class="form-control"
               required>
        <button type="submit" class="btn-register">
            Add Role (JDBC)
        </button>
    </form>
</div>
</body>
</html>