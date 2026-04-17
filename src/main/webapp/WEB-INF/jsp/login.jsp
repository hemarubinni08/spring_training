<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background: #ffffff;
            width: 360px;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 20px 30px rgba(0,0,0,0.25);
        }

        .login-card h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group {
            margin-bottom: 16px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-weight: 600;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 6px rgba(102,126,234,0.4);
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            background-color: #667eea;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #556cd6;
        }

        .error {
            margin-top: 15px;
            text-align: center;
            color: red;
            font-size: 14px;
        }

        .logout {
            margin-top: 15px;
            text-align: center;
            color: green;
            font-size: 14px;
        }

        .footer {
            margin-top: 18px;
            text-align: center;
            font-size: 13px;
            color: #777;
        }
    </style>
</head>

<body>

<div class="login-card">
    <h2>Login</h2>

    <form action="${pageContext.request.contextPath}/login" method="post">

        <!-- ✅ CSRF token (VERY IMPORTANT) -->
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}" />

        <div class="form-group">
            <label>Email</label>
            <input type="text" name="username" placeholder="Enter email" required />
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter password" required />
        </div>

        <button type="submit">Login</button>
    </form>

</div>

</body>
</html>