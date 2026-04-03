<html>
<head>
    <title>Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f6fc;
        }

        .container {
            width: 350px;
            margin: 80px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #34495e;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>User Registration</h2>

    <form action="register" method="post" modelAttribute="userDto">
        <label>Name</label>
        <input type="text" name="name" />

        <label>Email</label>
        <input type="email" name="email" />

        <label>Password</label>
        <input type="password" name="password" />

        <input type="submit" value="Register" />
    </form>
</div>

</body>
</html>