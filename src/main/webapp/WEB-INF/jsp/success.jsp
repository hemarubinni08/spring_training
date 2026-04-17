<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Result</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .box {
            background: white;
            padding: 30px 35px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            width: 300px;
        }
        .success {
            color: green;
            font-size: 20px;
            margin-bottom: 15px;
        }
        .error {
            color: red;
            font-size: 20px;
            margin-bottom: 15px;
        }
        a {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            background: #185a9d;
            color: white;
            padding: 8px 18px;
            border-radius: 5px;
            font-size: 14px;
        }
        a:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
<div class="box">
    <c:choose>
        <c:when test="${message eq 'success'}">
            <div class="success">✅ Registration Successful</div>
        </c:when>
        <c:otherwise>
            <div class="error">${message}</div>
        </c:otherwise>
    </c:choose>

</div>
</body>
</html>
``