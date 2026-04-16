<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Search User</title>

    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        .container {
            width: 400px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }

        button {
            padding: 10px 20px;
        }

        .error {
            color: #d85c5c;
            margin-top: 15px;
        }

        .user {
            margin-top: 15px;
            text-align: left;
        }
    </style>
</head>

<body>

<div class="container">
    <h3>Search User by Email</h3>

    <!-- ✅ Search form -->
    <form action="/user/searchByEmail/result" method="get">
        <input type="email"
               name="email"
               placeholder="Enter email"
               required />
        <button type="submit">Search</button>
    </form>

    <!-- ✅ If user found -->
    <c:if test="${not empty user}">
        <div class="user">
            <p><strong>ID:</strong> ${user.id}</p>
            <p><strong>Name:</strong> ${user.name}</p>
            <p><strong>Email:</strong> ${user.email}</p>
            <p><strong>Phone:</strong> ${user.phoneNo}</p>
        </div>
    </c:if>

    <!-- ✅ If user not found -->
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
</div>

</body>
</html>