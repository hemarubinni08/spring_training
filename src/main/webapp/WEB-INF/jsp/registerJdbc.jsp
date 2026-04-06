<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
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
        }

        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input:focus {
            border-color: #4facfe;
            outline: none;
        }

        .btn-group {
            margin-top: 20px;
            text-align: center;
        }

        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
            font-weight: bold;
        }

        .submit-btn {
            background-color: #28a745;
            color: white;
        }

        .submit-btn:hover {
            background-color: #218838;
        }

        .reset-btn {
            background-color: #dc3545;
            color: white;
        }

        .reset-btn:hover {
            background-color: #c82333;
        }
    </style>

</head>
<body>

    <div class="container">
        <h2>Registration Form</h2>

        <form action="/user/registerJdbc" method="post" modelAttribute="userDto">

            <label>Name:</label>
            <input type="text" name="name">

            <label>Username:</label>
            <input type="text" name="userName">

            <label>Email:</label>
            <input type="email" name="email">

            <label>Phone No:</label>
            <input type="text" name="phoneNo">

            <label>Password:</label>
            <input type="password" name="password">

            <label>Age:</label>
            <input type="number" name="age">

            <div class="btn-group">
                <input type="submit" value="Register" class="btn submit-btn">
                <input type="reset" value="Clear" class="btn reset-btn">
            </div>

        </form>
    </div>

</body>
</html>