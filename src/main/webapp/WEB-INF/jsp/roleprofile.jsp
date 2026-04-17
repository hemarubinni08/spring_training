<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Edit Role</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #eef2f3, #dfe9f3);
        }

        .header {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            padding: 18px 25px;
            color: white;
            font-size: 22px;
            font-weight: bold;
            box-shadow: 0px 3px 8px rgba(0,0,0,0.2);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .back-btn {
            background: white;
            color: #4facfe;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 13px;
        }

        .content {
            padding: 30px;
        }

        .profile-container {
            width: 340px;
            margin: auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 15px;
            color: #333;
        }

        .profile-item {
            margin-bottom: 10px;
        }

        .label {
            font-weight: 600;
            display: block;
            margin-bottom: 4px;
            font-size: 13px;
        }

        input {
            width: 100%;
            padding: 7px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 13px;
        }

        .btn {
            width: 100%;
            margin-top: 12px;
            padding: 9px;
            background: linear-gradient(to right, #007bff, #00c6ff);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 8px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 10px;
            font-size: 13px;
        }
    </style>
</head>

<body>

<div class="header">
    Edit Role
    <button class="back-btn" onclick="window.location.href='/role/roles'">← Back</button>
</div>

<div class="content">

    <div class="profile-container">
        <h2>Update Role</h2>

        <c:if test="${not empty message}">
            <div class="message">${message}</div>
        </c:if>

        <form action="/role/updateRoleJpa" method="post">

            <input name="id" value="${role.id}" readonly />

            <div class="profile-item">
                <label class="label">Name:</label>
                <input type="text" name="name" value="${role.name}" />
            </div>

            <button type="submit" class="btn">Update Role</button>

        </form>
    </div>

</div>

</body>
</html>