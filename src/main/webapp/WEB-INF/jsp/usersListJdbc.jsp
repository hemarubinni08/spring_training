<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>

 <style>
     body {
         font-family: "Segoe UI", Arial, sans-serif;
         background-color: #f0f4f8; /* light blue-grey */
         margin: 0;
         padding: 0;
     }

     h2 {
         text-align: center;
         margin: 30px 0;
         color: #0d47a1; /* dark blue */
     }

     table {
         width: 85%;
         margin: auto;
         border-collapse: collapse;
         background-color: #ffffff;
         border-radius: 10px;
         overflow: hidden;
         box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
     }

     thead {
         background-color: #1e88e5; /* primary blue */
         color: #ffffff;
     }

     th, td {
         padding: 12px 15px;
         text-align: center;
         border-bottom: 1px solid #dce3ea;
     }

     th {
         text-transform: uppercase;
         font-size: 14px;
         letter-spacing: 0.5px;
     }

     tbody tr:nth-child(even) {
         background-color: #f5f9ff; /* very light blue */
     }

     tbody tr:hover {
         background-color: #e3f2fd; /* hover blue */
     }

     td {
         font-size: 14px;
         color: #333;
     }
 </style>

</head>

<body>

<h2>All Registered Users</h2>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Username</th>
            <th>Phone No</th>
            <th>Delete</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td><a href="/user/profileUsersByIdJdbc/${user.id}"> ${user.id}</td>
                <td>${user.name}</td>
                <td><a href="/user/profileUsersJdbc/${user.email}">${user.email}</a></td>
                <td>${user.userName}</td>
                <td>${user.phoneNo}</td>
                <td><a href = "/user/deleteemailJdbc?email=${user.email}">Delete</a></td>
                </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>