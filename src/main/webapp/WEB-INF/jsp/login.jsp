<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Login</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #eef2f3, #dfe9f3);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 320px;
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-weight: 600;
            font-size: 13px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-top: 6px;
            margin-bottom: 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 13px;
        }

        input:focus {
            border-color: #4facfe;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .error {
            text-align: center;
            color: red;
            margin-bottom: 10px;
            font-size: 13px;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Login</h2>

    <c:if test="${param.error != null}">
        <div class="error">Invalid Username or Password</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">

        <label>Username</label>
        <input type="text" name="username" required/>

        <label>Password</label>
        <input type="password" name="password" required/>

        <button type="submit" class="btn">Login</button>

    </form>
</div>

</body>
</html>