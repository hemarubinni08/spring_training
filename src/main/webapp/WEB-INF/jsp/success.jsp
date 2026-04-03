<html>
<head>
    <title>Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f6fc;
        }

        .success-box {
            width: 350px;
            margin: 100px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #27ae60;
            margin-bottom: 15px;
        }

        p {
            color: #34495e;
            font-size: 16px;
            margin: 6px 0;
        }
    </style>
</head>

<body>

<div class="success-box">
    <h2>${message}</h2>

    <p><strong>Name:</strong> ${userDto.name}</p>
    <p><strong>Email:</strong> ${userDto.email}</p>
</div>

</body>
</html>