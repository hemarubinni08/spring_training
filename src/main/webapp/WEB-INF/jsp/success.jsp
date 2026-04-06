<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Successful</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
    body {
        background: linear-gradient(120deg, #ff0760, rgba(0, 0, 0, 0.075));
        height: 100vh;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .success-card {
        background: #fff;
        padding: 40px;
        border-radius: 16px;
        text-align: center;
        max-width: 500px;
        width: 100%;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        animation: fadeIn 0.6s ease-in-out;
    }

    .success-icon {
        font-size: 70px;
        color: #28a745;
        margin-bottom: 20px;
    }

    h3 {
        font-weight: 600;
        color: #333;
        margin-bottom: 10px;
    }

    p {
        color: #555;
        font-size: 16px;
        margin-bottom: 25px;
    }

    .btn-primary {
        background: linear-gradient(to right, #667eea, #764ba2);
        border: none;
        border-radius: 12px;
        padding: 12px 25px;
        font-size: 16px;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 18px rgba(118, 75, 162, 0.4);
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(15px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
</head>

<body>

<div class="success-card">


    <h3>${message}</h3>

    <p>
        ${message}
    </p>

    <a href="login" class="btn btn-primary">
        Go to Login
    </a>
</div>

</body>
</html>