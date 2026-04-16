<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Role (JDBC)</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            width: 420px;
            background: white;
            border-radius: 22px;
            padding: 36px;
            box-shadow: 0 30px 70px rgba(0,0,0,0.35);
        }

        .title {
            text-align: center;
            font-size: 26px;
            font-weight: 800;
            margin-bottom: 30px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 15px;
            margin-bottom: 25px;
        }

        .btn {
            width: 100%;
            padding: 14px;
            border-radius: 16px;
            border: none;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            color: white;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="card">
    <div class="title">✏️ Edit Role</div>

    <!-- ✅ FIXED FORM TAG -->
    <form action="${pageContext.request.contextPath}/role/saveRoleJdbc" method="post">

        <!-- Hidden ID -->
        <input type="hidden" name="id" value="${role.id}" />

        <label>Role Name</label>
        <input type="text" name="name" value="${role.name}" required />

        <button type="submit" class="btn">
            💾 Save Role
        </button>

    </form>
</div>

</body>
</html>