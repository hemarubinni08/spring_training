<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f2f4f8;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 350px;
            margin: 100px auto;
            padding: 25px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus {
            border-color: #007bff;
            outline: none;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
<div class="container">
    <h2>User Register</h2>

    <form action="${pageContext.request.contextPath}/user/register" method="post" modelAttribute="userDto">

        <label>Name:</label>
        <input type="text" name="name" required/>

        <label>Email:</label>
        <input type="email" name="email" required/>

        <label>Phone Number:</label>
        <input type="text" name"phoneNo" required/>

        <label>Age:</label>
        <input type="number" name="age" required/>

        <label>Password:</label>
        <input type="password" name="password" required/>

        <button type="submit">Register</button>

    </form>
</div>
</body>
</html>