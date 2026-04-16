<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background-color: #eef2f7;
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Card */
        .container {
            width: 360px;
            padding: 32px 28px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            text-align: center;
        }

        /* Title */
        h2 {
            color: #2c3e50;
            margin-bottom: 10px;
            font-weight: bold;
        }

        /* Message */
        p {
            color: #555;
            margin-bottom: 25px;
            font-size: 14px;
        }

        /* Button group */
        .btn-group {
            display: flex;
            gap: 10px;
        }

        /* Buttons */
        a {
            flex: 1;
            display: inline-block;
            padding: 12px;
            background-color: #2c3e50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            text-align: center;
            transition: 0.2s;
        }

        a:hover {
            background-color: #34495e;
        }
    </style>
</head>

<body>

<div class="container">

    <!-- MESSAGE -->
    <h2>${message != null ? message : "Registration Completed"}</h2>
    <p>Operation completed successfully.</p>

    <!-- BUTTONS -->
    <div class="btn-group">

        <!-- HOME -->
        <a href="${pageContext.request.contextPath}/user/registerJdbc">
            Home
        </a>

        <!-- REGISTER AGAIN -->
        <a href="${pageContext.request.contextPath}/user/registerJdbc">
            Register Again
        </a>
    </div>

</div>

</body>
</html>