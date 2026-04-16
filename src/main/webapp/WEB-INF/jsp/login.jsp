<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Login</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            height: 100vh;
            background: linear-gradient(135deg, #0f172a, #1e293b, #334155);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: #ffffff;
            padding: 35px 30px;
            border-radius: 12px;
            width: 320px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 25px;
            color: #1e293b;
            font-weight: 600;
        }

        .input-group {
            text-align: left;
            margin-bottom: 18px;
        }

        .input-group label {
            display: block;
            font-size: 13px;
            margin-bottom: 5px;
            color: #475569;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            font-size: 14px;
            transition: 0.2s;
        }

        .input-group input:focus {
            border-color: #3b82f6;
            outline: none;
            box-shadow: 0 0 0 2px rgba(59,130,246,0.2);
        }

        button {
            width: 100%;
            padding: 12px;
            background: #3b82f6;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            transition: 0.2s;
        }

        button:hover {
            background: #2563eb;
        }

        .error-msg {
            background: #fee2e2;
            color: #991b1b;
            padding: 8px;
            border-radius: 6px;
            margin-bottom: 15px;
            font-size: 13px;
        }

        .success-msg {
            background: #dcfce7;
            color: #166534;
            padding: 8px;
            border-radius: 6px;
            margin-bottom: 15px;
            font-size: 13px;
        }

    </style>
</head>

<body>

<div class="login-container">

    <h2>POS Login</h2>

    <form th:action="@{/login}" method="post">

        <div class="input-group">
            <label>Email</label>
            <input type="text" name="username" required/>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" required/>
        </div>

        <button type="submit">Login</button>

    </form>

</div>

</body>
</html>