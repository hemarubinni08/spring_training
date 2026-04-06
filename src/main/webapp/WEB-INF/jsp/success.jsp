<html>
<head>
    <title>Success</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #000000, #1c1c1c);
            margin: 0;
            padding: 0;
        }

        .success-box {
            width: 380px;
            margin: 120px auto;
            padding: 30px 25px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .success-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 14px 35px rgba(0, 0, 0, 0.4);
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            letter-spacing: 1px;
        }

        /* Success message */
        .success {
            color: #2ecc71;
        }

        /* Error / warning message */
        .error {
            color: #e74c3c;
            background: #fdecea;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #f5b7b1;
        }

        p {
            color: #2c3e50;
            font-size: 16px;
            margin: 10px 0;
            padding: 10px;
            background: #f4f8fb;
            border-radius: 8px;
            text-align: left;
        }

        p strong {
            color: #34495e;
        }
    </style>
</head>
<body>

<div class="success-box">
    <!-- Use 'success' or 'error' class -->
    <h2 class="error">${message}</h2>

    <p><strong>Name:</strong> ${userDto.name}</p>
    <p><strong>Email:</strong> ${userDto.email}</p>
</div>

</body>
</html>