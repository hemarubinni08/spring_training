<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Role</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f5f5f5;
            padding: 40px;
        }

        .form-container {
            max-width: 400px;
            margin: auto;
            background-color: #ffffff;
            padding: 25px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        h2 {
            margin-top: 0;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #444;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        button {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

<div class="form-container">
    <h2>Update Role</h2>


    <form action="/userrole/update" method="post">

        <input type="hidden" name="id" value="${role.id}" />

        <label>Name</label>
        <input type="text" name="name" value="${role.name}" required />

        <button type="submit">Update</button>
    </form>
</div>

</body>
</html>
