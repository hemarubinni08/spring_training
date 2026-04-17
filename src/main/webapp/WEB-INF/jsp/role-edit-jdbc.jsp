<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Edit Role (JDBC)</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #f0f4f8;
            font-family: Arial;
        }
        .box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            width: 300px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #28a745;
            color: white;
            border: none;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Edit Role (JDBC)</h2>
    <form action="/role/update-jdbc" method="post">
        <input type="hidden" name="id" value="${role.id}" />
        <input type="text" name="name" value="${role.name}" required />
        <button type="submit">Update</button>
    </form>
</div>
</body>
</html>