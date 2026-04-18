<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
            background-color: #f6f7f9;
            color: #1f2937;
        }

        .topbar {
            height: 56px;
            background-color: #020617;
            display: flex;
            align-items: center;
            padding: 0 20px;
            border-bottom: 1px solid #1e293b;
            color: #e5e7eb;
        }

        .top-title {
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 0.4px;
        }

        .page-wrapper {
            min-height: calc(100vh - 56px);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background-color: #ffffff;
            width: 360px;
            padding: 28px 26px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        }

        .login-card h2 {
            text-align: center;
            margin-bottom: 24px;
            font-size: 22px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 4px;
            font-size: 12px;
            font-weight: 600;
            color: #475569;
        }

        .form-group input {
            width: 100%;
            padding: 9px 11px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
            font-size: 14px;
            color: #1f2937;
        }

        .login-btn {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }

        .register-btn {
            width: 100%;
            padding: 10px;
            margin-top: 12px;
            background-color: #eef0f3;
            color: #374151;
            border: 1px solid #d1d5db;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="topbar">
    <div class="top-title">POS Application</div>
</div>

<div class="page-wrapper">

    <div class="login-card">
        <h2>Login</h2>

        <form action="${pageContext.request.contextPath}/login" method="post">

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="username" required />
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required />
            </div>

            <button type="submit" class="login-btn">Login</button>
        </form>

        <form action="${pageContext.request.contextPath}/user/register" method="get">
            <button type="submit" class="register-btn">Register</button>
        </form>
    </div>

</div>

<!-- ✅ LOGIN ERROR POPUP -->
<c:if test="${not empty param.error}">
    <script>
        alert("Invalid credentials. User does not exist or password is incorrect.");
    </script>
</c:if>

</body>
</html>