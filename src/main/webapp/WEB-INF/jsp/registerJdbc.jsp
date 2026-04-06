<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

body {
    height: 100vh;
    display: flex;
}

.left-panel {
    width: 50%;
    background: linear-gradient(135deg, #5f2c82, #49a09d);
    color: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 40px;
}

.left-panel h1 {
    font-size: 36px;
    margin-bottom: 15px;
}

.left-panel p {
    font-size: 16px;
    opacity: 0.9;
}

.right-panel {
    width: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #f4f6f9;
}

.form-box {
    width: 420px;
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.15);
}

.form-box h2 {
    text-align: center;
    margin-bottom: 20px;
}

.input-group {
    position: relative;
    margin-bottom: 18px;
}

.input-group input {
    width: 100%;
    padding: 12px 10px;
    border: 1px solid #ccc;
    border-radius: 6px;
    outline: none;
    font-size: 14px;
}

.input-group label {
    position: absolute;
    top: 50%;
    left: 10px;
    transform: translateY(-50%);
    background: white;
    padding: 0 5px;
    color: #777;
    font-size: 13px;
    transition: 0.3s;
    pointer-events: none;
}

.input-group input:focus + label,
.input-group input:valid + label {
    top: -8px;
    font-size: 11px;
    color: #5f2c82;
}

button {
    width: 100%;
    padding: 12px;
    border: none;
    background: #5f2c82;
    color: white;
    font-weight: bold;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    background: #4a2168;
}

/* ERROR */
.error {
    color: red;
    text-align: center;
    margin-top: 10px;
}

.footer {
    text-align: center;
    margin-top: 15px;
    font-size: 13px;
}

.footer a {
    color: #5f2c82;
    text-decoration: none;
    font-weight: bold;
}

</style>
</head>

<body>

<div class="left-panel">
    <h1>Welcome!</h1>
    <p>Create your account and get started</p>
</div>

<div class="right-panel">
    <div class="form-box">
        <h2>Register</h2>

        <form action="/user/registerJdbc" method="post">

            <div class="input-group">
                <input type="text" name="firstName" required>
                <label>First Name</label>
            </div>

            <div class="input-group">
                <input type="text" name="lastName" required>
                <label>Last Name</label>
            </div>

            <div class="input-group">
                <input type="text" name="username" required>
                <label>Username</label>
            </div>

            <div class="input-group">
                <input type="email" name="email" required>
                <label>Email</label>
            </div>

            <div class="input-group">
                <input type="tel" name="phoneNumber" pattern="[0-9]{10}" required>
                <label>Phone Number</label>
            </div>

            <div class="input-group">
                <input type="date" name="dateOfBirth" required>
                <label>Date of Birth</label>
            </div>

            <div class="input-group">
                <input type="number" name="age" min="18" required>
                <label>Age</label>
            </div>

            <div class="input-group">
                <input type="password" name="password" required>
                <label>Password</label>
            </div>

            <button type="submit">Create Account</button>
        </form>

        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <div class="footer">
            Already registered? <a href="/user/login">Login</a>
        </div>
    </div>
</div>

</body>
</html>