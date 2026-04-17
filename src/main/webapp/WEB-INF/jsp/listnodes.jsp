<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>List Nodes</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f8;
            padding: 30px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background-color: #ffffff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 10px;
            text-align: left;
        }

        th {
            background-color: #1976d2;
            color: #ffffff;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #eef3f8;
        }

        td a {
            color: #1976d2;
            text-decoration: none;
            margin-right: 10px;
            font-weight: 500;
        }

        td a:hover {
            text-decoration: underline;
        }
         .addButton {
             display: flex;
             justify-content: center;
             margin-top: 30px;
         }

         .btn-blue {
             background-color: #007bff;
             color: white;
             padding: 10px 24px;
             text-decoration: none;
             font-size: 15px;
             border-radius: 4px;
             border: none;
         }

         .btn-blue:hover {
             background-color: #0056b3;
         }
    </style>
</head>
<body>

<h2>All Nodes Using JPA</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Path</th>
        <th>Role</th>
        <th>Roles</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>

<c:forEach var="node" items="${nodes}">
    <tr>
        <td><a href=>${node.id}</a></td>
        <td>${node.name}</td>
        <td>${node.path}</td>
        <td>${node.role}</td>
      <td>
    <c:forEach var="r" items="${node.roles}" varStatus="s">
        ${r}<c:if test="${!s.last}">, </c:if>
    </c:forEach>
</td>
<td><a href ="/node/updatenode/${node.id}" >
                            <button>Update</button></a></td>
                            <td><a href ="/node/deletenode/${node.id}" >
                            <button>Delete</button></a>
                            </td>
    </tr>
</c:forEach>
</table>
<div class="addButton">
   <a href="/node/addnode" class="btn-blue">Add Node</a>
</div>

</body>
</html>