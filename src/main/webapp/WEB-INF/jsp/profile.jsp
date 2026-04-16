<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>

    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>

    <style>
       body {
           margin: 0;
           font-family: Arial, Helvetica, sans-serif;
           background-color: #eef2f7;
       }

       form {
           width: 90%;
           margin: 40px auto;
       }

       table {
           width: 100%;
           border-collapse: collapse;
           background-color: #ffffff;
           box-shadow: 0 3px 8px rgba(0,0,0,0.08);
           border-radius: 6px;
           overflow: hidden;
       }

       thead {
           background-color: #2c3e50;
           color: white;
       }

       th, td {
           padding: 12px 15px;
           text-align: center;
       }

       th {
           font-size: 13px;
           text-transform: uppercase;
       }

       tbody tr:nth-child(even) {
           background-color: #f5f7fa;
       }

       tbody tr:hover {
           background-color: #e8f8f5;
       }

       input[type="text"],
       input[type="email"],
       input[type="password"],
       select {
           width: 90%;
           padding: 7px;
           border: 1px solid #ccc;
           border-radius: 4px;
           outline: none;
       }

       input:focus,
       select:focus {
           border-color: #1abc9c;
           box-shadow: 0 0 4px rgba(26,188,156,0.4);
       }

       input[type="submit"] {
           background-color: #1abc9c;
           color: white;
           border: none;
           padding: 9px 18px;
           border-radius: 5px;
           cursor: pointer;
           font-weight: bold;
           transition: 0.2s;
       }

       input[type="submit"]:hover {
           background-color: #16a085;
       }

       .select2-container--default .select2-selection--multiple {
           border: 1px solid #ccc;
           border-radius: 4px;
           min-height: 38px;
       }

       .select2-container--default.select2-container--focus .select2-selection--multiple {
           border-color: #1abc9c;
           box-shadow: 0 0 4px rgba(26,188,156,0.4);
       }

       /* Home button */
       .home-btn {
           display:inline-block;
           margin: 20px auto;
           padding:10px 18px;
           background-color:#2c3e50;
           color:white;
           text-decoration:none;
           border-radius:5px;
           font-weight:bold;
       }

       .home-container {
           text-align:center;
       }
    </style>
</head>

<body>

<form action="/user/updateJpa" method="post">

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Name</th>
                <th>Password</th>
                <th>Role</th>
                <th>Roles (Multi)</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <tr>
                <td>
                    ${user.id}
                    <input type="hidden" name="id" value="${user.id}" />
                </td>

                <td>
                    <input type="email" name="email" value="${user.email}" />
                </td>

                <td>
                    <input type="text" name="name" value="${user.name}" />
                </td>

                <td>
                    <input type="password" name="password" value="${user.password}" />
                </td>

                <!-- SINGLE ROLE -->
                <td>
                    <select name="role">
                        <option value="">-- Select Role --</option>
                        <c:forEach var="r" items="${role}">
                            <option value="${r.name}"
                                <c:if test="${r.name == user.role}">selected</c:if>>
                                ${r.name}
                            </option>
                        </c:forEach>
                    </select>
                </td>

                <!-- MULTIPLE ROLES -->
                <td>
                    <select name="roles" id="rolesSelect" multiple="multiple">
                        <c:forEach var="r" items="${role}">
                            <option value="${r.name}"
                                <c:if test="${user.roles.contains(r.name)}">selected</c:if>>
                                ${r.name}
                            </option>
                        </c:forEach>
                    </select>
                </td>

                <td>
                    <input type="submit" value="Update" />
                </td>
            </tr>
        </tbody>
    </table>

</form>

<!-- HOME BUTTON -->
<div class="home-container">
    <a class="home-btn" href="${pageContext.request.contextPath}/user/userJpa">
        Back
    </a>
</div>

</body>
</html>