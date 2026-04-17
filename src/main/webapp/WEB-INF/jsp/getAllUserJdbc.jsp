<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 70%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #dddddd;
        }
    </style>
</head>
<body>
<h2>Users</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Action</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
          <td><a href="/user/getUserByIdJdbc?id=${user.id}">${user.id}</a></td>
            <td>${user.name}</td>
            <td><a href="/user/profile?email=${user.email}">${user.email}</a></td>
            <td>
                          <a href="/user/deleteByEmailJdbc/${user.email}"
                             onclick="return confirm('Are you sure?');">
                              Delete
                          </a>
                      </td

        </tr>
    </c:forEach>
</table>
<c:if test="${empty users}">
    <p>No users found.</p>
</c:if>
<div class="back">
        <a href="${pageContext.request.contextPath}/user/registerJdbc">← Back to Register</a>
    </div>
</body>
</html>
       </table>
       </body>
       </html>