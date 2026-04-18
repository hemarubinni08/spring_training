<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Path Added Successfully</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
            background-color: #f6f7f9;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1f2937;
        }

        .success-card {
            background-color: #ffffff;
            padding: 36px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            text-align: center;
            max-width: 420px;
            width: 90%;
        }

        h2 {
            margin: 10px 0;
            color: #16a34a;
            font-size: 22px;
            font-weight: 600;
        }

        p {
            color: #4b5563;
            font-size: 14px;
            margin-bottom: 26px;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 12px;
        }

        .btn {
            display: inline-block;
            padding: 9px 22px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            color: #ffffff;
        }

        .btn-primary {
            background-color: #2563eb;
        }

        .btn-primary:hover {
            background-color: #1d4ed8;
        }

        .btn-secondary {
            background-color: #eef0f3;
            color: #374151;
            border: 1px solid #d1d5db;
        }

        .btn-secondary:hover {
            background-color: #e5e7eb;
        }
    </style>
</head>

<body>

<div class="success-card">
    <h2>Path Added Successfully</h2>

    <p>
        The new path has been saved and is now available in the system.
    </p>

    <!-- ✅ ACTION BUTTONS -->
    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/node/displayNode"
           class="btn btn-primary">
            Back to Paths
        </a>

        <a href="${pageContext.request.contextPath}/node/addNode"
           class="btn btn-secondary">
            Add Another Path
        </a>
    </div>
</div>

</body>
</html>