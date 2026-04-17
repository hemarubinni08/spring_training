<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Name Already Exists</title>

    <meta http-equiv="refresh" content="5;URL=${pageContext.request.contextPath}/node/displayNode">

    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f97316, #ef4444);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            background: white;
            padding: 40px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 20px 45px rgba(0,0,0,0.25);
            max-width: 420px;
            width: 90%;
        }

        h2 {
            color: #dc2626;
            margin-bottom: 10px;
        }

        p {
            color: #444;
            font-size: 15px;
            margin-bottom: 25px;
        }

        small {
            color: #666;
            font-size: 13px;
        }

        .btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 18px;
            background-color: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }

        .btn:hover {
            background-color: #1d4ed8;
        }
    </style>
</head>

<body>

<div class="card">
    <h2>⚠ Name Already Exists</h2>

    <p>
        The name you are trying to add already exists in the system.
    </p>

    <small>
        You will be redirected back to the Node Dashboard in 5 seconds.
    </small>

    <br><br>