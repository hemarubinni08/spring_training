<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-top: 10px;
        }

        input, button {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .gender-group {
            margin-top: 8px;
        }

        .gender-group input {
            width: auto;
            margin-right: 5px;
        }

        button {
            margin-top: 20px;
            background: #4CAF50;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background: #43a047;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>User Registration</h2>

    ✅ Method & action added here
    <form action="registerJdbc" method="post">

        <label>User Name</label>
        <input type="text" name="userName" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <label>Gender</label>
        <div class="gender-group">
            <input type="radio" name="gender" value="Male" required> Male
            <input type="radio" name="gender" value="Female"> Female
            <input type="radio" name="gender" value="Other"> Other
        </div>

        <label>Date of Birth</label>
        <input type="date" name="dob" required>

        <button type="submit">Register</button>
    </form>
</div>

</body>
</html>