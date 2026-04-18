<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Name Already Exists</title>

    <!-- ✅ Auto redirect after 5 seconds -->
    <meta http-equiv="refresh" content="5;URL=${pageContext.request.contextPath}/node/displayNode">

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
            background-color: #f6f7f9;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1f2937;
        }

        .card {
            background-color: #ffffff;
            padding: 32px 28px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            max-width: 420px;
            width: 90%;
        }

        h2 {
            color: #dc2626;
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        p {
            color: #374151;
            font-size: 14px;
            margin-bottom: 20px;
        }

        small {
            color: #6b7280;
            font-size: 13px;
        }

        .btn {
            display: inline-block;
            margin-top: 18px;
            padding: 8px 18px;
            background-color: #2563eb;
            color: #ffffff;
            text-decoration: none;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #1d4ed8;
        }
    </style>
</head>

<body>

<div class="card">
    <h2>Name Already Exists</h2>

    <p>
        The name you are trying to add already exists in the system.
    </p>

    <small>
        You will be redirected back to the Node Dashboard in 5 seconds.
    </small>

    <br><br>

    <a href="${pageContext.request.contextPath}/node/displayNode" class="btn">
        Go Back Now
    </a>
</div>

</body>
</html>