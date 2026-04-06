<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 350px;
            margin: 80px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            outline: none;
            transition: border 0.3s;
        }

        input:focus {
            border-color: #4facfe;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: #4facfe;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }

        input[type="submit"]:hover {
            background: #007bff;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Registration Form</h2>

    <form action="/user/registerJdbc" method="post" @ModelAttribute UserDto userDto>
        <label>Name:</label>
        <input type="text" name="name" required>

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <input type="submit" value="Register">
    </form>
</div>

</body>
</html>