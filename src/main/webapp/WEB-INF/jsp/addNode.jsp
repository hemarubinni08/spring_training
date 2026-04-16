<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Node</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 380px;
            margin: 60px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 0 5px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            font-size: 14px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        select[multiple] {
            height: 90px;
        }

        .hint {
            font-size: 12px;
            color: #666;
            margin-top: -10px;
            margin-bottom: 15px;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }

        button:hover {
            background: #43a047;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 12px;
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        .success {
            color: green;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Add Node</h2>

    <!-- ✅ ✅ ✅ FIX: FORM OPEN TAG ADDED -->
    <form action="/node/addNode" method="post">

        <!-- Node Name -->
        <label>Node Name</label>
        <input type="text" name="name" placeholder="Enter node name" required>

        <!-- Path -->
        <label>Path</label>
        <input type="text" name="path" placeholder="/user/all , /role/all" required>

        <!-- Allowed Roles -->
        <label>Allowed Roles</label>
        <select name="roles" multiple required>
            <c:forEach items="${roleList}" var="role">
                <option value="${role.name}">${role.name}</option>
            </c:forEach>
        </select>

        <div class="hint">
            Hold Ctrl (Windows) or Cmd (Mac) to select multiple roles
        </div>

        <button type="submit">Add Node</button>

        <a href="/node/getAllNode" class="back-link">
            Back to Node List
        </a>

        <!-- MESSAGE SECTION -->
        <c:choose>
            <c:when test="${not empty node.message}">
                <p class="error">${node.message}</p>
            </c:when>
            <c:when test="${not empty success}">
                <p class="success">${success}</p>
            </c:when>
        </c:choose>

    </form>
    <!-- ✅ ✅ ✅ FORM CLOSE TAG (already existed) -->

</div>

</body>
</html>