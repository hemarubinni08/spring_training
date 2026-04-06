<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${message}</title>
    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;

            /* Indigo-themed gradient */
            background: radial-gradient(
                circle,
                #ffffff 0%,
                #b8b4ff 35%,
                #1900c1 100%
            );

            font-family: Arial, sans-serif;
        }

        .card {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }

        a {
            display: inline-block;
            margin-top: 16px;
            text-decoration: none;
            color: white;
            padding: 10px 18px;
            border-radius: 6px;
            background-color: #1900c1;
        }
    </style>
</head>
<body>

    <div class="card">
        <h2>${message}</h2>
        <a href="register">Register another user</a>
    </div>

</body>
</html>