<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Message</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            min-height: 100vh;
            margin: 0;

            background:
                radial-gradient(circle at 20% 20%, rgba(255,255,255,0.04), transparent 40%),
                radial-gradient(circle at 80% 30%, rgba(255,255,255,0.03), transparent 45%),
                radial-gradient(circle at 50% 80%, rgba(255,255,255,0.02), transparent 50%),
                linear-gradient(135deg, #0f0f0f, #1b1b1b, #0c0c0c);

            display: flex;
            justify-content: center;
            align-items: center;
            color: #e0e0e0;
        }

        .message-container {
            background-color: rgba(30, 30, 30, 0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.8);
            border: 1px solid #2c2c2c;
            max-width: 500px;
            text-align: center;
        }

        h2 {
            margin: 0;
            font-size: 22px;
            font-weight: normal;
            color: #ffffff;
        }
    </style>

</head>
<body>

    <div class="message-container">
        <h2>${message}</h2>
    </div>

</body>
</html>