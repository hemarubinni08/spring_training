<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Status</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background-image: linear-gradient(-225deg, #B7F8DB 0%, #50A7C2 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .container {
        width: 480px;
        background: #ffffff;
        padding: 32px;
        border-radius: 28px;
        text-align: center;
        box-shadow: 0 18px 35px rgba(0, 0, 0, 0.15);
    }

    h2 {
        margin: 10px 0;
        letter-spacing: 0.6px;
        font-weight: 600;
        color: #333;
    }

    p {
        color: #555;
        margin-top: 10px;
        font-size: 14px;
        line-height: 1.4;
    }

    .btn-view {
        display: inline-block;
        margin-top: 25px;
        padding: 10px 28px;
        background: linear-gradient(120deg, #36d1dc, #5b86e5);
        color: white;
        text-decoration: none;
        border-radius: 22px;
        font-size: 14px;
        font-weight: 600;
        transition: all 0.25s ease;
        box-shadow: 0 4px 8px rgba(0,0,0,0.12);
    }

    .btn-view:hover {
        opacity: 0.95;
        transform: translateY(-1px);
    }

    .btn-retry {
        background: linear-gradient(120deg, #ff416c, #ff4b2b);
    }

    .btn-retry:hover {
        background: linear-gradient(120deg, #e11d48, #be123c);
    }
</style>
</head>

<body>

<div class="container">

    <c:if test="${userDto.colour == 'green'}">
        <h2>Registration Successful</h2>
        <p>Your account has been created successfully.</p>
        <a href="/login" class="btn-view">Go to Login</a>
    </c:if>

    <c:if test="${userDto.colour != 'green'}">
        <h2>Registration Failed</h2>
        <p>Something went wrong. Please try again.</p>
        <a href="/user/register" class="btn-view btn-retry">Try Again</a>
    </c:if>

</div>

</body>
</html>