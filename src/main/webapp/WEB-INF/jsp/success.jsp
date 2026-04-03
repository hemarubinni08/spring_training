<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(to right, #a1ffce, #faffd1);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 450px;
            margin: 70px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #2e7d32;
            margin-bottom: 25px;
        }

        .field {
            margin-bottom: 14px;
        }

        .label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 3px;
        }

        .value {
            background: #f4f4f4;
            padding: 8px 10px;
            border-radius: 5px;
            color: #000;
        }

        .btn {
            display: block;
            text-align: center;
            margin-top: 25px;
            text-decoration: none;
            padding: 10px;
            background: #4CAF50;
            color: white;
            border-radius: 6px;
            font-weight: bold;
        }

        .btn:hover {
            background: #45a049;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="field">
        <span class="label">Name</span>
        <div class="value">${user.name}</div>
    </div>

    <div class="field">
        <span class="label">Email</span>
        <div class="value">${user.email}</div>
    </div>

    <a class="btn" href="${pageContext.request.contextPath}/user/register">
        Register Another User
    </a>
</div>

</body>
</html>