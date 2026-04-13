<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Node</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f9;
        }

        .container {
            width: 420px;
            margin: 80px auto;
            padding: 25px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        label {
            font-weight: 600;
            margin-top: 12px;
            display: block;
            color: #34495e;
        }

        input,
        select,
        button {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        select[multiple] {
            height: auto;
        }

        button {
            margin-top: 20px;
            background-color: #28a745;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        small {
            display: block;
            margin-top: 6px;
            color: #6c757d;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Add Node</h2>

    <form:form action="/node/addNode" method="post" modelAttribute="nodeDto">

        <label>Node Name</label>
        <form:input path="name" placeholder="Enter node name" />

        <label>Path</label>
        <form:input path="path" placeholder="Enter path" />

        <!-- ✅ PRIMARY ROLE -->
        <label>Primary Role</label>
        <form:select path="role">
            <form:option value="">-- Select Role --</form:option>
            <c:forEach var="r" items="${role}">
                <form:option value="${r.name}">
                    ${r.name}
                </form:option>
            </c:forEach>
        </form:select>

        <!-- ✅ MULTIPLE ROLES -->
        <label>Multiple Roles</label>
        <form:select path="roles" multiple="true">
            <c:forEach var="r" items="${role}">
                <form:option value="${r.name}">
                    ${r.name}
                </form:option>
            </c:forEach>
        </form:select>

        <small>
            Hold Ctrl (Windows) or Cmd (Mac) to select multiple roles
        </small>

        <button type="submit">Add Node</button>

    </form:form>
</div>

</body>
</html>