<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-container {
            background: #fff;
            padding: 30px 35px;
            width: 380px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            font-weight: 600;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #667eea;
        }

        .register-btn {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            background: #667eea;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }

        .register-btn:hover {
            background: #5a67d8;
        }

        .error-message {
            background: #ffe6e6;
            color: #d8000c;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 14px;
            text-align: center;
        }
    </style>
</head>

<body>

<div class="register-container">
    <h2>User Registration</h2>

    <!-- Optional error message -->
    <!--
    <div class="error-message">
        Email already exists
    </div>
    -->

    <form action="/user/register_jdbc" method="post">

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" required>
        </div>

        <div class="form-group">
            <label>Username</label>
            <input type="text" name="userName">
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>

        <div class="form-group">
            <label>Phone No</label>
            <input type="text" name="phoneNo">
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <div class="form-group">
            <label>Age</label>
            <input type="number" name="age">
        </div>

        <div class="form-group">
            <label>Date of Birth</label>
            <input type="date" name="dateOfBirth">
        </div>

        <button type="submit" class="register-btn">Register</button>
    </form>
</div>

</body>
</html>