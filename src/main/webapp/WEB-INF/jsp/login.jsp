<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Login</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #ffffff;
            font-size: 32px;
            letter-spacing: 1px;
        }

        form {
            background: #ffffff;
            padding: 35px 45px;
            width: 360px;
            border-radius: 12px;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
        }

        div {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px;
            font-size: 18px;
            border-radius: 6px;
            border: 1px solid #ccc;
            outline: none;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #667eea;
            box-shadow: 0 0 6px rgba(102, 126, 234, 0.5);
        }

        button {
            width: 100%;
            padding: 14px;
            background: #667eea;
            color: #ffffff;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }

        button:hover {
            background: #5a67d8;
            transform: translateY(-2px);
        }
    </style>
</head>

<body>

<h2>Login</h2>

<form th:action="/login" method="post">
        <label>Username:</label>
        <input type="text" name="username"/>
    </div>

    <div>
        <label>Password:</label>
        <input type="password" name="password"/>
    </div>

    <button type="submit">Login</button>
</form>

</body>
</html>
