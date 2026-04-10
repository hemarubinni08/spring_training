<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <title>Show All Users</title>
    <style>
        body {
                    margin: 0;
                    padding: 0;
                    font-family: "Segoe UI", Arial, sans-serif;
                    height: 100vh;
                    background: radial-gradient(
                                    circle,
                                    #ffffff 0%,
                                    #b8b4ff 35%,
                                    #1900c1 100%
                                );
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }
        .register-card {
                    background: #ffffff;
                    width: 420px;
                    padding: 30px 35px;
                    border-radius: 12px;
                    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
                }
    </style>
</head>

<body>
<div class="table">
<h2> Registered Roles </h2>
    <table border=1>
        <thead>
            <tr>
                <th>ID </th>
                <th>Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${roles}" var="role">
                <tr>
                    <td><a href="/role/updaterole?id=${role.id}"</a>${role.id}</td>
                    <td>${role.name}</td>
                    <td><a href="/role/deleterole?id=${role.id}"onclick="return confirm('Are you sure you want to delete this profile?');">Delete</a></td
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<a class="button-style" href="/role/addrole">Add Role</a>
<style>
        .button-style {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .button-style:hover {
            background-color: #0056b3;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
</style>
<c:if test="${not empty msg}">
    <script type="text/javascript">
        alert("${msg}");
    </script>
</c:if>
</body>
</html>