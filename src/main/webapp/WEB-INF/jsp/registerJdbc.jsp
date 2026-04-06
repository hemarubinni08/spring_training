<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #9face6);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .container {
            background: #ffffff;
            width: 350px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        input:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.4);
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>

    <div class="container">
        <h2>User Registration</h2>

        <form method="post" modelAttribute="userDto">

            <label>Name</label>
            <input type="text" name="name" placeholder="Enter your name">

            <label>Email</label>
            <input type="email" name="email" placeholder="Enter your email">

            <label>Age</label>
            <input type="text" name="age" placeholder="Enter your age">

            <label>Password</label>
            <input type="text" name="password" placeholder="Enter your password">

            <label>PhoneNo</label>
            <input type="text" name="PhoneNo" placeholder="Enter your Mobile number">

            <button type="submit">SUBMIT</button>
        </form>
    </div>

</body>
</html>