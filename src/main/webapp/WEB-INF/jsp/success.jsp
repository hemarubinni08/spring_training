<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Status</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 480px;
            background: #ffffff;
            padding: 35px;
            border-radius: 40px;
            text-align: center;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .icon {
            font-size: 70px;
        }

        h2 {
            margin-top: 15px;
        }

        p {
            color: #555;
            margin-top: 10px;
        }

        .btn {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 30px;
            background: #1d2b64;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }

        .btn:hover {
            background: #5a67d8;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="icon">
        ${userDto.colour == 'green' ? '✅' : '❌'}
    </div>

    <h2 style="color:${userDto.colour}">
        ${userDto.message}
    </h2>

    <p>${userDto.message2}</p>

    <a class="btn" href="${pageContext.request.contextPath}/user/registerJdbc">
        Back to Registration
    </a>

</div>

</body>
</html>