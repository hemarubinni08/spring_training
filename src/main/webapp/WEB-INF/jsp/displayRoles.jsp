<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
<title>Display</title>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
        font-family: Arial, sans-serif;
        background: #fff;
    }

    th {
        background: #34495e;
        color: white;
        padding: 10px;
    }

    td {
        padding: 8px;
        border-bottom: 1px solid #ddd;
    }

    tr:nth-child(even) {
        background: #f2f2f2;
    }

    tr:hover {
        background: #e6f0ff;
    }

    a {
        color: #007bff;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    a[href*="delete"] {
        color: red;
        font-weight: bold;
    }
</style>
</head>
<body>
<table border="1">
      <tr>
        <th>Role Id</th>
        <th>Role Name</th>
        <th>DELETE</th>

    </tr>
    <c:forEach var="role" items="${roleDtoList}">
         <tr>
            <td><a href = "/role/getRoleDetails/${role.id}">${role.id}</a></td>
            <td>${role.name}</td>
            <td><a href = "/role/deleteRoleByIdJdbc/${role.id}">DELETE</a></td>
         </tr>
    </c:forEach>

</Table>
</body>
</html>


