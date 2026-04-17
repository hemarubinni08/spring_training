<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
body {
    margin: 0;
    height: 100vh;
    font-family: 'Segoe UI', Tahoma, sans-serif;
    background: linear-gradient(135deg, #020617, #1e3a8a);
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-container {
    background: rgba(15, 23, 42, 0.9);
    padding: 35px 40px;
    width: 350px;
    border-radius: 16px;
    box-shadow: 0 20px 45px rgba(0,0,0,0.6);
    color: #e2e8f0;
}

.login-container h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #ffffff;
}

.form-group {
    margin-bottom: 18px;
}

.form-group label {
    display: block;
    margin-bottom: 6px;
    font-size: 14px;
    color: #cbd5e1;
}

.form-group input {
    width: 100%;
    padding: 10px;
    border-radius: 8px;
    border: none;
    outline: none;
    font-size: 14px;
}

.login-btn {
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg, #3b82f6, #2563eb);
    border: none;
    border-radius: 10px;
    color: white;
    font-size: 16px;
    cursor: pointer;
    margin-top: 10px;
}

.login-btn:hover {
    background: linear-gradient(135deg, #60a5fa, #3b82f6);
}

.error {
    margin-top: 15px;
    text-align: center;
    color: #f87171;
    font-size: 14px;
}
</style>
</head>

<body>

<div class="login-container">
    <h2>POS Login</h2>

    <form action="${pageContext.request.contextPath}/login" method="post">

        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" required />
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required />
        </div>

        <button type="submit" class="login-btn">Login</button>
    </form>

    <c:if test="${param.error != null}">
        <div class="error">Invalid username or password</div>
    </c:if>

</div>

</body>
</html>