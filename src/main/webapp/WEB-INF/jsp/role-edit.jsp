<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Edit Role</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #eef2f7;

            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            width: 320px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        input:focus {
            border-color: #2c3e50;
        }

        button {
            padding: 10px;
            width: 100%;
            background: #2c3e50;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #34495e;
        }

        /* HOME BUTTON */
        .home-btn {
            display: block;
            margin-top: 10px;
            padding: 10px;
            background: #34495e;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .home-btn:hover {
            background: #2c3e50;
        }
    </style>
</head>

<body>

<div class="box">

    <h2>Edit Role</h2>

    <form action="/role/update" method="post">

        <!-- Hidden ID -->
        <input type="hidden" name="id" value="${role.id}" />

        <input type="text" name="name" value="${role.name}" required />

        <button type="submit">Update</button>

    </form>

    <!-- HOME BUTTON -->
    <a href="${pageContext.request.contextPath}/role/list" class="home-btn">
        Back
    </a>

</div>

</body>
</html>