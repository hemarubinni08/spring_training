<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Path Added Successfully</title>

    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #22c55e, #16a34a);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .success-card {
            background: #ffffff;
            padding: 45px;
            border-radius: 18px;
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.25);
            text-align: center;
            max-width: 420px;
            width: 90%;
        }

        .success-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }

        h2 {
            margin: 10px 0;
            color: #16a34a;
            font-size: 26px;
        }

        p {
            color: #555;
            font-size: 15px;
            margin-bottom: 30px;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 14px;
        }

        .btn {
            display: inline-block;
            padding: 12px 22px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            color: #ffffff;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #2563eb;
        }

        .btn-primary:hover {
            background-color: #1d4ed8;
        }

        .btn-secondary {
            background-color: #16a34a;
        }

        .btn-secondary:hover {
            background-color: #15803d;
        }
    </style>
</head>

<body>

<div class="success-card">
    <div class="success-icon">✅</div>
    <h2>Path Added Successfully</h2>
    <p>The new path has been saved and is now available.</p>

    <!-- ✅ ACTION BUTTONS -->
    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/node/displayNode" class="btn btn-primary">
            Back to Paths
        </a>

        <a href="${pageContext.request.contextPath}/node/addNode" class="btn btn-secondary">
            Add Another Path
        </a>
    </div>
</div>

</body>
</html>