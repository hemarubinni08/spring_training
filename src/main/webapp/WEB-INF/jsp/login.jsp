<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background: #ffffff;
            padding: 30px 35px;
            width: 360px;
            border-radius: 14px;
            box-shadow: 0 18px 40px rgba(0, 0, 0, 0.25);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        form div {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
            transition: all 0.2s ease-in-out;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102,126,234,0.2);
        }

        button {
            width: 100%;
            margin-top: 10px;
            padding: 12px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            color: #ffffff;
            background: linear-gradient(135deg, #667eea, #764ba2);
            cursor: pointer;
            box-shadow: 0 10px 22px rgba(102,126,234,0.45);
            transition: all 0.25s ease-in-out;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 14px 30px rgba(102,126,234,0.55);
        }
    </style>
</head>

<body>

<div class="login-card">
    <h2>Login Page</h2>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div>
            <label>Username</label>
            <input type="text" name="username"/>
        </div>

        <div>
            <label>Password</label>
            <input type="password" name="password"/>
        </div>

        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>