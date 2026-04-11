<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Success</title>

    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2); /* ✅ changed */
            font-family: Arial, sans-serif;
            text-align: center;
        }

        .box {
            margin-top: 150px;
            background: white;
            display: inline-block;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
        }

        h2 {
            color: #4a3aff; /* ✅ changed */
        }

        p {
            margin-top: 10px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: linear-gradient(135deg, #4a3aff, #6a5cff); /* ✅ changed */
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        a:hover {
            background: linear-gradient(135deg, #372bdb, #5749ff); /* ✅ changed */
        }
    </style>
</head>

<body>

<div class="box">
    <h2> Registration Successful!</h2>
    <p>Your account has been created successfully.</p>
</div>

</body>
</html>