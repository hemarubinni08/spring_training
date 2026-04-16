<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<title>Success</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background: #f1f5f9;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        color: #1e293b;
    }

    .card {
        width: 380px;
        background: #ffffff;
        padding: 30px;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        font-weight: 600;
        color: #16a34a; /* success green */
        font-size: 20px;
    }

    .btn-container {
        margin-top: 20px;
    }

    .btn {
        display: block;
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border-radius: 8px;
        text-decoration: none;
        font-size: 14px;
        font-weight: 600;
        color: white;
        transition: 0.2s;
    }

    .primary-btn {
        background: #6366f1;
    }

    .primary-btn:hover {
        background: #4f46e5;
    }

    .secondary-btn {
        background: #0ea5e9;
    }

    .secondary-btn:hover {
        background: #0284c7;
    }

</style>
</head>

<body>

<div class="card">

    <h2>${message}</h2>

    <div class="btn-container">

        <a class="btn primary-btn"
           href="${pageContext.request.contextPath}/login">
            Go to Register
        </a>

        <a class="btn secondary-btn"
           href="${pageContext.request.contextPath}/user/showAllUsers">
            View All Users
        </a>

    </div>

</div>

</body>
</html>