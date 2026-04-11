<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Role Status</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 120px auto;
            background: #ffffff;
            padding: 30px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            border-radius: 8px;
        }

        .message {
            font-size: 18px;
            margin-bottom: 25px;
        }

        /* Success message */
        .success {
            color: #28a745;
            font-weight: bold;
        }

        /* Error message */
        .error {
            color: #dc3545;
            font-weight: bold;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>

</head>

<body>

<div class="container">

    <!-- ✅ Message -->

        <h3>${message}</h3>

    <!-- ✅ Action -->
    <a href="/role/addRoleJdbc" class="btn">Add Another Role</a>

</div>

</body>
</html>