<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Role Profile</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
            background-color: #f6f7f9;
            color: #1f2937;
        }

        .container {
            width: 360px;
            padding: 24px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            position: relative;
        }

        /* ✅ BACK BUTTON (LEFT, CONSISTENT) */
        .back-btn {
            position: absolute;
            top: 18px;
            left: 18px;
            padding: 6px 14px;
            background-color: #eef0f3;
            color: #374151;
            text-decoration: none;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            border: 1px solid #d1d5db;
        }

        .back-btn:hover {
            background-color: #e5e7eb;
        }

        h2 {
            text-align: center;
            margin: 12px 0 22px;
            font-size: 22px;
            font-weight: 600;
        }

        label {
            display: block;
            margin-top: 14px;
            font-size: 12px;
            font-weight: 600;
            color: #475569;
        }

        input {
            width: 100%;
            padding: 9px 11px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
            font-size: 14px;
            color: #1f2937;
        }

        input[readonly] {
            background-color: #f9fafb;
            cursor: not-allowed;
        }

        button {
            margin-top: 22px;
            width: 100%;
            padding: 10px;
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
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
        Back
    </a>

    <h2>Edit Role</h2>

    <form action="${pageContext.request.contextPath}/role/editProfile"
          method="post">

        <!-- ID (READ-ONLY) -->
        <label>Role ID</label>
        <input type="text"
               name="id"
               value="${roleDto.id}"
               readonly />

        <!-- ROLE NAME -->
        <label>Role Name</label>
        <input type="text"
               name="name"
               value="${roleDto.name}"
               required />

        <button type="submit">Update Role</button>

    </form>
</div>

</body>
</html>