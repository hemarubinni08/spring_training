<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>List Users</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f6f8;
            padding: 40px;
            text-align: center;
        }

        h2 {
            color: #2e7d32;
            background-color: #e8f5e9;
            display: inline-block;
            padding: 15px 25px;
            border-radius: 6px;
            margin-bottom: 30px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
        }

        .register-btn {
            background-color: #1976d2;
            color: #ffffff;
            border: none;
            padding: 10px 18px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);
        }

        .register-btn:hover {
            background-color: #1565c0;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body>

<h2>"Deleted Successfully" ${email}</h2>

<br/>
<a href="/user/listusers">
    <button type="submit" class="register-btn">go back to users list</button>
</a>

</body>
</html>