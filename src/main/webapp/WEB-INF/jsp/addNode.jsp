<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Node - POS</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f9;
        }

        /* Sidebar */
        .sidebar {
            width: 220px;
            height: 100vh;
            background-color: #2c3e50;
            position: fixed;
            padding-top: 20px;
        }

        .sidebar h2 {
            color: #ecf0f1;
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #bdc3c7;
            text-decoration: none;
            font-size: 15px;
        }

        .sidebar a:hover {
            background-color: #34495e;
            color: #ffffff;
        }

        /* Main Content */
        .content {
            margin-left: 240px;
            padding: 30px;
        }

        .card {
            background: #ffffff;
            padding: 25px;
            width: 400px;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .card h3 {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }

        button {
            margin-top: 20px;
            padding: 10px;
            width: 100%;
            background-color: #27ae60;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 15px;
        }

        button:hover {
            background-color: #2ecc71;
        }

        .success {
            margin-top: 15px;
            color: green;
            font-weight: bold;
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>POS Menu</h2>
    dashboard
    addNode
    viewNodesView Nodes</a>
    logout
</div>

<!-- Main Content -->
<div class="content">
    <div class="card">
        <h3>Add Node</h3>
        <form method="post"
                   action="/node/addNode"
                   modelAttribute="nodeDto">

        addNode
            <label>Node Name</label>
            <input type="text" name="name" value="${nodeDto.name}" required/>

            <label>Node Path</label>
            <input type="text" name="path" value="${nodeDto.path}" required/>

             <select name="role">
                 <option value="">--Select role--</option>
                 <c:forEach var="role" items="${roles}">
                     <option value="${role.name}">${role.name}</option>
                 </c:forEach>
             </select>

<select name="roleIds" multiple size="6">
    <c:forEach var="role" items="${roles}">
        <option value="${role.name}">
            ${role.name}
        </option>
    </c:forEach>
</select>

 <button type="submit">Add Node</button>
        </form>

        <c:if test="${not empty node}">
            <div class="success">${node}</div>
        </c:if>
    </div>
</div>

</body>
</html>