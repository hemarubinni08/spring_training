<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f4f7;
        }

        .container {
            width: 350px;
            margin: 80px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 8px;
            margin: 6px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #2e86de;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1b4f72;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>User Registration</h2>

    <form action="/user/registerJdbc" method="POST">
        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Phone Number</label>
        <input type="text" name="phoneNo" required>

        <label>Username</label>
        <input type="text" name="userName" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <label>Age</label>
        <input type="number" name="age" required>

        <label>Date of Birth</label>
        <input type="date" name="dateOfBirth" required>

        <button type="submit">Register</button>
    </form>
</div>

</body>
</html>