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
    <table border=1>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Age</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td><a href="/user/getprofilebyid?id=${user.id}"</a>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</a></td>
                    <td>${user.age}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>