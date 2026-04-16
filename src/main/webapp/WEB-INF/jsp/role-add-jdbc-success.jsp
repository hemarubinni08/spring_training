<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Role Added</title>

    <style>
        body {
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: Arial;
        }

        .box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            width: 400px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        h2 {
            color: #4a3aff;
        }

        p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 16px;
            background: #4a3aff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: 0.2s;
        }

        .btn:hover {
            background: #372bdb;
        }
    </style>
</head>

<body>

<div class="box">
    <h2>Role Added Successfully!</h2>
    <p>The role has been created successfully.</p>

    <!-- BACK BUTTON -->
    <a href="${pageContext.request.contextPath}/role/addRoleJdbc" class="btn">
        Back
    </a>
</div>

</body>
</html>