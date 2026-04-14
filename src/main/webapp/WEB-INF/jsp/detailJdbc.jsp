<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Details of each user</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        .user-card {
            background-color: #ffffff;
            padding: 20px;
            margin: 15px auto;
            width: 60%;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .user-card label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            color: #2c3e50;
        }

        .user-card input {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .save-button {
            margin-top: 15px;
            padding: 8px 20px;
            background-color: #2ecc71;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
        }

        .save-button:hover {
            background-color: #27ae60;
        }

        .back-button {
            display: block;
            margin: 30px auto;
            padding: 10px 25px;
            font-size: 16px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
        }

        .back-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>

<body>

<h2>User Details</h2>


    <form action="/user/updateJdbc" method="post">

        <div class="user-card">

            <input type="hidden" name="id" value="${user.id}" />

            <label>Age</label>
            <input type="text" name="age" value="${user.age}" />

            <label>Name</label>
            <input type="text" name="name" value="${user.name}" />

            <label>Email</label>
            <input type="text" name="email" value="${user.email}" />

            <label>Phone No</label>
            <input type="text" name="phoneNo" value="${user.phoneNo}" />

             <label>Password</label>
             <input type="password" name="password" value="${user.password}" />

            <label>User Name</label>
            <input type="text" name="userName" value="${user.userName}" />

            <button class="save-button" type="submit">SUBMIT</button>
            <button class="back-button" type="button" onclick="history.back()">Back</button>

        </div>
    </form>

</body>
</html>