<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #ff8fab;
            padding: 25px 30px;
            border-radius: 8px;
            width: 300px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            font-size: 14px;
        }

        input[type="text"],
        input[type="text"],
        input[type="password"]
        input[type="text"]
        input[type="date"]{
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #007bff;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            font-size: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <form action="/user/registerJdbc" method="POST" modelAttribute="userDto">
        <h2>Register</h2>

        <label for="name">Name</label><br>
        <input type="text" id="name" name="name" placeholder ="Enter your name" required><br><br>

        <label for="email">Email</label><br>
        <input type="text" id="email" name="email" placeholder = "Enter your E-mail" required><br><br>

        <label for="password">Password</label><br>
        <input type ="password" id="password" name="password" placeholder = "Enter your password" required<br><br>
        <br>
        <label for="age">Age</label><br>
        <input type="text" id="age" name="age"  placeholder ="Enter your age" required<br><br>
        <br>
        <label for="phoneNo">Phone No</label>
        <input type="text" id="phoneNo" name="phoneNo" placeholder="Enter your phone no" required><br><br>
        <br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
