<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>

    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            min-height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-container {
            background-color: #ffffff;
            width: 420px;
            padding: 30px 35px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-size: 14px;
            margin-bottom: 6px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.2);
        }

        .row {
            display: flex;
            gap: 10px;
        }

        .row .form-group {
            flex: 1;
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            background-color: #667eea;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #5a67d8;
        }

        .footer-text {
            margin-top: 15px;
            text-align: center;
            font-size: 13px;
            color: #777;
        }
    </style>
</head>

<body>

<div class="register-container">
    <h2>Create Account</h2>

    <form action="registerJdbc" method="post">

        <div class="form-group">
            <label for="name">Username</label>
            <input type="text" id="name" name="name" autocomplete="off" placeholder="Enter username" required>
        </div>

        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Enter email" required>
        </div>

        <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phoneNo" placeholder="Enter phone number">
        </div>

        <div class="form-group">
            <label for="userName">Login Username</label>
            <input type="text" id="userName" name="userName" placeholder="Login username" required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Create password" required>
        </div>

        <div class="row">
            <div class="form-group">
                <label for="age">Age</label>
                <input type="number" id="age" name="age" min="1">
            </div>

            <div class="form-group">
                <label for="date">Date of Birth</label>
                <input type="date" id="date" name="date">
            </div>
        </div>

        <button type="submit">Register</button>

    </form>

    <div class="footer-text">
        Already have an account? Log in instead
    </div>
</div>

</body>
</html>