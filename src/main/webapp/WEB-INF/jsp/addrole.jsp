<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Role</title>

    <style>
        body {
            margin: 0;
            padding: 30px;
            font-family: Arial, Helvetica, sans-serif;
            color: #e0e0e0;
            background:
                radial-gradient(circle at top left,
                    rgba(255,255,255,0.08),
                    rgba(0,0,0,0.9) 60%),
                linear-gradient(120deg,#0f2027,#203a43,#2c5364);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            width: 420px;
            padding: 30px 34px;
            background: rgba(25,25,25,0.95);
            border-radius: 14px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.6);
        }

        h2 {
            text-align: center;
            margin-bottom: 22px;
            font-weight: 600;
            color: #ffffff;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-size: 13px;
            letter-spacing: .4px;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border-radius: 8px;
            border: 1px solid #333;
            background: #1c1c1c;
            color: #e0e0e0;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg,#4da6ff,#80c1ff);
            color: #111;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            opacity: .9;
        }

        .msg {
            margin-top: 14px;
            text-align: center;
            font-size: 14px;
            color: #80c1ff;
        }

        .back {
            margin-top: 18px;
            display: block;
            text-align: center;
            color: #4da6ff;
            text-decoration: none;
            font-size: 14px;
        }

        .back:hover {
            color: #80c1ff;
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="card">
    <h2>Add Role</h2>

    <form action="${pageContext.request.contextPath}/role/addRole" method="post">
        <label>Role Name</label>
        <input type="text" name="name" required>

        <button type="submit">Create Role</button>
    </form>

    <div class="msg">${msg}</div>

    <a class="back" href="${pageContext.request.contextPath}/role/roles">
        View Roles
    </a>
</div>

</body>
</html>
