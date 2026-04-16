<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Node</title>

    <style>
        * {
            box-sizing: border-box;
        }

        /* BODY */
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background-color: #eef2f7;
            font-family: Arial, Helvetica, sans-serif;
            display: flex;
            flex-direction: column;
        }

        /* HEADER (same as dashboard) */
        .header {
            height: 55px;
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #2c3e50;
            font-weight: bold;
            position: relative;
        }

        /* HOME BUTTON */
        .home-btn {
            position: absolute;
            left: 20px;
            padding: 8px 14px;
            background-color: #2c3e50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .home-btn:hover {
            opacity: 0.9;
        }

        /* CONTAINER */
        .container {
            width: 380px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            margin: auto;
        }

        /* TITLE */
        h2 {
            margin-bottom: 20px;
            color: #2c3e50;
            text-align: center;
        }

        /* INPUTS */
        input,
        select {
            width: 100%;
            padding: 10px 12px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus,
        select:focus {
            border-color: #2c3e50;
            outline: none;
        }

        /* BUTTON */
        button {
            width: 100%;
            padding: 12px;
            margin-top: 18px;
            background-color: #34495e;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            opacity: 0.9;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <a href="${pageContext.request.contextPath}/" class="home-btn">Home</a>
    Node
</div>

<!-- FORM CARD -->
<div class="container">
    <h2>Add Node</h2>

    <form action="${pageContext.request.contextPath}/node/save" method="post">
        <input type="text" name="name" placeholder="Enter Node Name" required />
        <input type="text" name="path" placeholder="Enter path Name" required />

        <select name="role">
            <option value="">--Select Role--</option>
            <c:forEach var="role" items="${roles}">
                <option value="${role.name}">${role.name}</option>
            </c:forEach>
        </select>

        <select name="roles[]" multiple size="5">
            <option value="">--Select Roles--</option>
            <c:forEach var="roles" items="${roles}">
                <option value="${roles.name}">${roles.name}</option>
            </c:forEach>
        </select>

        <button type="submit">Add Node</button>
    </form>
</div>

</body>
</html>