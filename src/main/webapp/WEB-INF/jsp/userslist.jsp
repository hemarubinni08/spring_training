<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Users</title>

    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>

<body style="background-color:#EDE9E6;">
<div class="container-fluid mt-4">

    <h3 class="mb-3">Users List</h3>
    <div class="d-flex justify-content-end mb-3">
        <a href="/user/register" class="btn btn-success shadow-sm">
            + Add User
        </a>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover">
            <thead style="background-color: #C9996B">
            <tr>
                <th>ID (JPA)</th>
                <th>ID (JDBC)</th>
                <th>Name</th>
                <th>Age</th>
                <th>Email (Param)</th>
                <th>Email (Path)</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Roles</th>
                <th>Delete (JPA)</th>
                <th>Delete (JDBC)</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${usersList}" var="user">
                <tr>
                    <td>
                        <a href="/user/getprofilebyidjpa?id=${user.id}">
                            ${user.id}
                        </a>
                    </td>

                    <td>
                        <a href="/user/getprofilebyidjdbc/${user.id}">
                            ${user.id}
                        </a>
                    </td>

                    <td>${user.name}</td>
                    <td>${user.age}</td>

                    <td>
                        <a href="/user/getprofilejpa?email=${user.email}">
                            ${user.email}
                        </a>
                    </td>

                    <td>
                        <a href="/user/getprofilejdbc/${user.email}">
                            ${user.email}
                        </a>
                    </td>

                    <td>${user.phoneNo}</td>
                    <td>${user.role}</td>
                    <td>${user.roles}</td>

                    <td>
                        <a class="btn btn-sm btn-danger"
                           href="/user/deleteUserJpa?email=${user.email}"
                           onclick="return confirm('Delete this user?')">
                            Delete
                        </a>
                    </td>

                    <td>
                        <a class="btn btn-sm btn-danger"
                           href="/user/deleteUserJdbc?email=${user.email}"
                           onclick="return confirm('Delete this user?')">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>