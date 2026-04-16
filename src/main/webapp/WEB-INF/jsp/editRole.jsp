<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Role</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
        }
        .container {
            max-width: 400px;
            margin: 80px auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[readonly] {
            background-color: #eee;
            cursor: not-allowed;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background: #45a049;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Edit Role</h2>

        <c:if test="${error != null}">
            <div class="alert alert-error">${error}</div>
        </c:if>

        <c:if test="${success != null}">
            <div class="alert alert-success">${success}</div>
        </c:if>


    <form action="/Role/editRole" method="post">

        <!--  ID (NOT EDITABLE) -->
        <label>Role ID</label>
        <input type="text" name="id" value="${role.id}" readonly>

        <!--  ROLE NAME (EDITABLE) -->
        <label>Role Name</label>
        <input type="text" name="name" value="${role.name}" required>

        <button type="submit">Update Role</button>
    </form>
</div>

</body>
</html>