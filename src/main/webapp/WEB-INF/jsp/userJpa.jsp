<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Users</title>

    <style>/* ===== PAGE BASE ===== */
           /* ===== PAGE BASE ===== */
           body {
               margin: 0;
               font-family: Arial, Helvetica, sans-serif;
               background-color: #eef2f7;
               padding: 30px 0;
           }

           h2 {
               text-align: center;
               color: #2c3e50;
               margin-bottom: 20px;
           }

           /* ===== TABLE ===== */
           table {
               width: 75%;
               margin: 0 auto;
               border-collapse: collapse;
               background-color: #ffffff;
               border: 1px solid #ddd;
           }

           /* Header */
           th {
               background-color: #2c3e50;
               color: white;
               padding: 12px;
               font-size: 14px;
           }

           /* Body */
           td {
               padding: 12px;
               text-align: center;
               color: #333;
           }

           /* Rows */
           tr:nth-child(even) {
               background-color: #f2f2f2;
           }

           tr:hover {
               background-color: #e6edf5;
           }

           /* ===== LINKS ===== */
           a {
               color: #2c3e50;
               font-weight: bold;
               text-decoration: none;
           }

           a:hover {
               color: #34495e;
               text-decoration: underline;
           }

           .delete-link {
               color: #dc3545;
           }

           .delete-link:hover {
               color: #a71d2a;
           }

           /* ===== FOOTER BUTTONS ===== */
           .footer-buttons {
               width: 75%;
               margin: 30px auto 0 auto;
               display: flex;
               justify-content: center;
               gap: 20px;
           }

           .footer-buttons a {
               padding: 12px 24px;
               border-radius: 5px;
               color: white;
               font-weight: bold;
               text-decoration: none;
           }

           /* Match sidebar colors */
           .home-btn {
               background-color: #2c3e50;
           }

           .register-btn {
               background-color: #34495e;
           }

           .footer-buttons a:hover {
               opacity: 0.9;
           }

    </style>
</head>

<body>
<h2>User List</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>role</th>
        <th>roles</th>
        <th>Action</th>
    </tr>

    <c:forEach var="user" items="${users}">
        <tr>
            <td>
                <a href="/user/profileJpaId?id=${user.id}">
                    ${user.id}
                </a>
            </td>

            <td>${user.name}</td>

            <td>
                <a href="/user/profileJpaEmail?email=${user.email}">
                    ${user.email}
                </a>
            </td>
            <td>${user.role}</td>
            <td>${user.roles}</td>
            <td>
                <a class="delete-link" href="/user/deleteJpa?email=${user.email}">
                    Delete
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="footer-buttons">
<a href="/" class="home-btn">Home</a>
<a href = "/user/register" class="register-btn">New Register</a>
    </div>
</div>
</body>
</html>