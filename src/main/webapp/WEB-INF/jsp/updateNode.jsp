<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Node</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f9;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        .user-card {
            background-color: #ffffff;
            padding: 20px;
            margin: 15px auto;
            width: 60%;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 12px;
            color: #2c3e50;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        select[multiple] {
            height: 120px;
        }

        .save-button {
            margin-top: 20px;
            padding: 8px 20px;
            background-color: #2ecc71;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
        }

        .save-button:hover {
            background-color: #27ae60;
        }

        .back-button {
            margin-left: 10px;
            padding: 8px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
        }

        .back-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>

<body>

<h2>Update Node Details</h2>

<form action="/node/updateNode" method="post">

    <div class="user-card">

        <!-- ✅ ID (readonly so it submits) -->
        <label>ID</label>
        <input type="text" name="id" value="${node.id}" readonly />

        <!-- ✅ Node Name -->
        <label>Name</label>
        <input type="text" name="name" value="${node.name}" />

        <!-- ✅ Node Path -->
        <label>Path</label>
        <input type="text" name="path" value="${node.path}" />

        <!-- ✅ SINGLE ROLE -->
        <label>Role</label>
        <select name="role">
            <c:forEach var="r" items="${roles}">
                <option value="${r.name}"
                    <c:if test="${r.name == node.role}">
                        selected
                    </c:if>>
                    ${r.name}
                </option>
            </c:forEach>
        </select>

        <!-- ✅ MULTIPLE ROLES -->
        <label>Roles</label>
        <select name="roles" multiple>
            <c:forEach var="r" items="${roles}">
                <option value="${r.name}"
                    <c:if test="${node.roles != null && node.roles.contains(r.name)}">
                        selected
                    </c:if>>
                    ${r.name}
                </option>
            </c:forEach>
        </select>

        <!-- ✅ Buttons -->
        <button class="save-button" type="submit">SUBMIT</button>
        <button class="back-button" type="button" onclick="history.back()">Back</button>

    </div>
</form>

</body>
</html>