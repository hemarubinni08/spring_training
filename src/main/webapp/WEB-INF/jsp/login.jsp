<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f2f4f7;
            font-family: Arial, sans-serif;
        }

        .login-box {
            width: 350px;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .login-box label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .login-box input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .login-box input:focus {
            outline: none;
            border-color: #007bff;
        }

        .login-box button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-box button:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    <div class="login-box">
        <h2>Login</h2>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <label>Email</label>
            <input type="text" name="username" required />

            <label>Password</label>
            <input type="password" name="password" required />

            <button type="submit">Login</button>
        </form>

        <c:if test="${param.error != null}">
            <div class="error">Invalid username or password</div>
        </c:if>
    </div>
</body>
</html>