<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <style>
        body {
            margin: 0;
            padding: 40px 20px;
            font-family: "Segoe UI", Arial, sans-serif;
            min-height: 100vh;
            background: radial-gradient(
                    circle,
                    #ffffff 0%,
                    #b8b4ff 35%,
                    #1900c1 100%
            );
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .login-card {
            background: #ffffff;
            width: 420px;
            padding: 30px 35px;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #1900c1;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
        }

        input:focus {
            border-color: #0078D4;
            box-shadow: 0 0 5px rgba(0, 120, 212, 0.3);
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background: #1900c1;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background: #005A9E;
        }
        * {
            box-sizing: border-box;
        }
    </style>
</head>

<body>

<div class="login-card">
    <h2>Login</h2>

    <form action="login" method="post">

        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username"/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password"/>
        </div>

        <input type="submit" value="Login" class="btn-submit"/>

    </form>
</div>

</body>
</html>