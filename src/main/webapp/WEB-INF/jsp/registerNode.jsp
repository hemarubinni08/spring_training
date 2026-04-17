<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Node</title>

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

        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            font-weight: 600;
            color: #2563eb;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Add Node</h2>

    <!-- ✅ EXACT PATH YOU ALREADY USE -->
    <form action="${pageContext.request.contextPath}/node/addNode" method="post">

        <!-- ✅ NAME -->
        <label>Name</label>
        <input type="text" name="name" required />

        <!-- ✅ PATH -->
        <label>Path</label>
        <input type="text" name="path" required />

        <!-- ✅ ADDED: MULTI-SELECT DROPDOWN (DYNAMIC FROM roles) -->
        <label>Roles</label>
        <select name="roleNames" multiple required>
            <c:forEach var="role" items="${roles}">
                <option value="${role.name}">
                    ${role.name}
                </option>
            </c:forEach>
        </select>

        <button type="submit">Save Node</button>
    </form>

    <!-- ✅ BACK TO LIST PAGE -->
    <a class="back-link"
       href="${pageContext.request.contextPath}/node/displayNode">
        ← Back to Node List
    </a>

</div>

</body>
</html>