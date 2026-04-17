<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <!-- ✅ Font (Clean, Professional) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .login-card {
            background: #ffffff;
            width: 360px;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
        }

        .login-card h2 {
            text-align: center;
            margin-bottom: 24px;
            color: #1f2937;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            font-weight: 600;
            color: #374151;
        }

        .form-group input {
            width: 100%;
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #6366f1;
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            background: #4f46e5;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .login-btn:hover {
            background: #4338ca;
        }
    </style>
</head>

<body>

<div class="login-card">
    <h2>Login</h2>

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
</div>

</body>
</html>