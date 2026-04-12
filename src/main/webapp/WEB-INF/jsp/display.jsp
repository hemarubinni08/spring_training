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
        <th>Id jpa</th>
         <th>Id jdbc</th>
        <th>Age</th>
        <th>Date of birth</th>
        <th>Email - Request Params JDBC</th>
        <th>Email - Path variable JDBC</th>
        <th>Email - Request Params JPA</th>
        <th>Email - Path variable JPA</th>
        <th>Name</th>
        <th>Password</th>
        <th>Phone no</th>
        <th>User Name</th>
        <th>DELETE by jpa</th>
        <th>DELETE by jdbc</th>

    </tr>
    <c:forEach var="user" items="${UserDtoList}">
         <tr>
            <td><a href="/user/getUserByIdJpa/${user.id}">${user.id}</a></td>
            <td><a href="/user/getUserByIdJdbc/${user.id}">${user.id}</a></td>
            <td>${user.age}</td>
            <td>${user.dateOfBirth}</td>
            <td><a href="/user/getUserByEmailJdbc?email=${user.email}">${user.email}</a></td>
            <td><a href="/user/getUserByEmailJdbc/${user.email}">${user.email}</a></td>
            <td><a href="/user/getUserByEmailJpa?email=${user.email}">${user.email}</a></td>
            <td><a href="/user/getUserByEmailJpa/${user.email}">${user.email}</a></td>
            <td>${user.name}</td>
            <td>${user.password}</td>
            <td>${user.phoneNo}</td>
            <td>${user.userName}</td>
            <td><a href="/user/deleteByEmail/${user.email}">DELETE</a></td>
            <td><a href="/user/deleteByEmailJdbc/${user.email}">DELETE</a></td>
         </tr>
    </c:forEach>

</Table>
</body>
</html>


