<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Role Profile</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f4f7;
        }

        .container {
            width: 360px;
            margin: 80px auto;
            padding: 25px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 12px rgba(0,0,0,0.15);
            position: relative;
        }

        /* ✅ BACK BUTTON */
        .back-btn {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 6px 14px;
            background-color: #6b7280;
            color: #ffffff;
            text-decoration: none;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .back-btn:hover {
            background-color: #4b5563;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 12px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-top: 6px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        input[readonly] {
            background-color: #e5e7eb;
            cursor: not-allowed;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-weight: 600;
            cursor: pointer;
        }

        button:hover {
            background-color: #1d4ed8;
        }
    </style>
</head>

<body>

<div class="container">

    <!-- ✅ BACK TO ROLE DISPLAY -->
    <a href="${pageContext.request.contextPath}/role/display"
       class="back-btn">
        ← Back
    </a>

    <h2>Edit Role</h2>

    <form action="${pageContext.request.contextPath}/role/editProfile"
          method="post">

        <!-- ID (READ-ONLY) -->
        <label>Role ID</label>
        <input type="text"
               name="id"
               value="${roleDto.id}"
               readonly>

        <!-- ROLE NAME -->
        <label>Role Name</label>
        <input type="text"
               name="name"
               value="${roleDto.name}"
               required>

        <button type="submit">Update Role</button>

    </form>
</div>

</body>
</html>