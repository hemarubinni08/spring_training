<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Role Registration</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f4f7;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 350px;
            margin: 80px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            position: relative;
        }

        /* ✅ CLEAN BACK BUTTON */
        .back-btn {
            position: absolute;
            top: 12px;
            left: 12px;
            padding: 6px 12px;
            background-color: #f3f4f6;
            color: #374151;
            text-decoration: none;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 600;
            border: 1px solid #d1d5db;
        }

        .back-btn:hover {
            background-color: #e5e7eb;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            margin-top: 20px;
            color: #1f2937;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
            color: #374151;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #2563eb;
            color: white;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #1d4ed8;
        }
    </style>
</head>

<body>

<div class="container">

    <!-- ✅ BACK TO ROLE DISPLAY (NO LEAKING) -->
    <a href="${pageContext.request.contextPath}/role/display" class="back-btn">
        ← Roles
    </a>

    <h2>Role Registration</h2>

    <!-- ✅ FORM -->
    <form action="${pageContext.request.contextPath}/role/addRole" method="POST">

        <label>Role Name</label>
        <input
            type="text"
            name="name"
            placeholder="ADMIN / USER / MANAGER"
            required
        />

        <button type="submit">Submit</button>
    </form>

</div>

</body>
</html>