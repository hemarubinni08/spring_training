<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Status</title>

    <style>
        html, body {
            margin: 0;
            height: 100%;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background: #0b1620;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #ffffff;
        }

        .status-box {
            padding: 30px 40px;
            border-radius: 12px;
            text-align: center;
            min-width: 360px;
            border: 1px solid rgba(255,255,255,0.15);
            background: rgba(255,255,255,0.05);
        }

        /* Status types */
        .success {
            border-left: 6px solid #28ff9a;
        }

        .error {
            border-left: 6px solid #ff3b3b;
        }

        .warning {
            border-left: 6px solid #ffd84e;
        }

        .info {
            border-left: 6px solid #3bc9ff;
        }

        .status-text {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 22px;
            text-transform: capitalize;
        }

        .back-btn {
            display: inline-block;
            padding: 10px 22px;
            background: #ffffff;
            color: #000000;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 600;
        }

        .back-btn:hover {
            background: #e6e6e6;
        }
    </style>
</head>

<body>

<div class="status-box ${state}">
    <div class="status-text">${state}</div>
    <a href="${linkPage}" class="back-btn">⬅ Back</a>
</div>

</body>
</html>