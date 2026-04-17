<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>List Users</title>

    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #999;
            padding: 8px;
        }
        th {
            background-color: #f4f6f8;
        }
    </style>
</head>
<body>

<h2>All Users Using JDBC</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Username</th>
        <th>Age</th>
        <th>Date of Birth</th>
    </tr>

<c:forEach var="user" items="${users}">
    <tr>
        <td><a href="/user/profilebyidusingjdbc/${user.id}">${user.id}</a></td>
        <td>${user.name}</td>
         <td>
                <a href = "/user/getuserprofile?email=${user.email}">${user.email}</a>
                "     "
                <a href = "/user/getuserprofile/${user.email}">${user.email}</a>
         </td>
        <td>${user.phoneNo}</td>
        <td>${user.userName}</td>
        <td>${user.age}</td>
        <td>${user.dateOfBirth}</td>
    </tr>
</c:forEach>
</table>
</body>
</html>