<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .success-card {
            width: 420px;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.25);
            padding: 40px 30px;
            text-align: center;
        }

        .success-title {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 10px;
            color: ${Colour};
        }

        .success-msg {
            font-size: 14px;
            color: #374151;
            margin-bottom: 25px;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 12px;
        }

        .btn {
            padding: 10px 18px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            text-decoration: none;
            color: white;
            transition: background 0.3s ease;
        }

        .btn-primary {
            background: #2563eb;
        }

        .btn-primary:hover {
            background: #1d4ed8;
        }

        .btn-success {
            background: #16a34a;
        }

        .btn-success:hover {
            background: #15803d;
        }
    </style>
</head>

<body>

<div class="success-card">

    <div class="success-title">
        ${status}
    </div>

    <div class="success-msg">
        ${status2}
    </div>

    <!-- ✅ ACTION BUTTONS -->
    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/user/register"
           class="btn btn-success">
            ➕ Register Another User
        </a>

        <a href="${pageContext.request.contextPath}/user/display"
           class="btn btn-primary">
            👤 Back to User List
        </a>
    </div>

</div>

</body>
</html>