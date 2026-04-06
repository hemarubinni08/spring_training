<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
        }
        .register-container {
            width: 100%;
            max-width: 400px;
            margin: 60px auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .register-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .register-container label {
            font-weight: bold;
        }
        .register-container input {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .register-container button {
            width: 100%;
            padding: 10px;
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .register-container button:hover {
            background: #45a049;
        }
        .login-link {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<h2>Registeration Page</h2>
<a href="/user/registerJdbc">Go to Voter Search</a>
<div class="register-container" modelAttribute="userDto">


    <form : form method="post" modelAttribute="userDto" action="/user/registerJdbc">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" required>

        <label for="userName">Username</label>
        <input type="text" id="username" name="userName" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required minlength="6">

        <label for="phoneNumber">phone no</label>
        <input type="text" id="username" name="phoneNo" required>


        <button type="submit" value="Register">Create Account</button>
    </form>

</div>

</body>
</html>

For this code add phone no email  age dob