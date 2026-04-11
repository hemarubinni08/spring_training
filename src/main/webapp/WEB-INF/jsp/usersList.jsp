<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>

 <style>
     body {
         font-family: "Segoe UI", Arial, sans-serif;
         background-color: #f0f4f8;
         margin: 0;
         padding: 0;
     }

     h2 {
         text-align: center;
         margin: 30px 0;
         color: #0d47a1;
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
         background-color: #1e88e5;
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
         background-color: #f5f9ff;
     }

     tbody tr:hover {
         background-color: #e3f2fd;
     }

     td {
         font-size: 14px;
         color: #333;
     }

     a {
         text-decoration: none;
         font-weight: 500;
     }

     /* 🔴 Delete */
     .btn-delete {
         color: white;
         background-color: red;
         padding: 5px 10px;
         border-radius: 5px;
     }

     .btn-delete:hover {
         background-color: darkred;
     }

     /* 🟣 Edit */
     .btn-edit {
         color: white;
         background-color: #4a3aff;
         padding: 5px 10px;
         border-radius: 5px;
     }

     .btn-edit:hover {
         background-color: #372bdb;
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
            <th>Edit</th> <!-- ✅ Added -->
        </tr>
    </thead>

    <tbody>
        <c:forEach var="user" items="${users}">
            <tr>

                <!-- ✅ Fixed closing tag -->
                <td>
                    <a href="/user/profileUsersById?id=${user.id}">
                        ${user.id}
                    </a>
                </td>

                <td>${user.name}</td>

                <td>
                    <a href="/user/profileUsers?email=${user.email}">
                        ${user.email}
                    </a>
                </td>

                <td>${user.userName}</td>
                <td>${user.phoneNo}</td>

                <!-- 🔴 DELETE -->
                <td>
                    <a href="/user/deleteemail?email=${user.email}" class="btn-delete">
                        Delete
                    </a>
                </td>

                <!-- 🟣 EDIT -->
                <td>
                    <a href="/user/edit/${user.id}" class="btn-edit">
                        Edit
                    </a>
                </td>

            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>