<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Node</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            background: #ffffff;
            width: 360px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .hint {
            font-size: 12px;
            color: #666;
            margin-bottom: 15px;
        }


    </style>
    </head>
    <body>

    <div class="card">
    <h2>Edit Node</h2>


    <form action="/node/editNode?id=${node.id}" method="POST">

        <input type="hidden" name="id" value="${node.id}" />

        <label>Node Name</label>
        <input type="text" name="name" value="${node.name}" required />

        <label>Path</label>
        <input type="text" name="path" value="${node.path}" required />

        <label>Allowed Roles</label>
        <select name="roles" multiple size="4" required>
            <c:forEach items="${roleList}" var="role">
                <option value="${role.name}">
                    ${role.name}
                </option>
            </c:forEach>
        </select>

        <div class="hint">
            Hold Ctrl (Windows) or Cmd (Mac) to select multiple roles
        </div>

        <button type="submit">Update Node</button>

        <c:if test="${error != null}">
                       <div class="alert alert-error">${error}</div>
                   </c:if>

                   <c:if test="${success != null}">
                       <div class="alert alert-success">${success}</div>
                   </c:if>

    </form>

    <a class="back-link" href="/node/getAllNode">
        Back to Node List
    </a>
</div>

</body>
</html>