<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Status</title>

<style>
    body {
        margin: 0;
        height: 100vh;
        background: linear-gradient(135deg, #e3f2fd, #f5f5f5);
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: 'Segoe UI', Tahoma, Verdana, sans-serif;
    }

    .card {
        width: 420px;
        padding: 35px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        text-align: center;
    }

    h2 {
        color: #2c3e50;
        margin-bottom: 22px;
    }

    /* SUCCESS MESSAGE */
    .success {
        color: #1565c0;
        font-size: 22px;
        font-weight: 700;
        letter-spacing: 1px;
        margin-bottom: 28px;
        text-transform: uppercase;
    }

    /* ERROR MESSAGE */
    .error {
        color: #d32f2f;
        font-size: 16px;
        font-weight: 600;
        margin-bottom: 28px;
    }

    .btn {
        padding: 12px 24px;
        background: #1976d2;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-weight: 600;
        display: inline-block;
    }

    .btn:hover {
        background: #125aa2;
    }
</style>
</head>

<body>

<div class="card">
    <h2>Registration Status</h2>

    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <!-- ERROR CASE -->
        <p class="error"><%= message %></p>
    <%
        } else {
    %>
        <!-- SUCCESS CASE -->
        <p class="success">USER SUCCESSFULLY REGISTERED ✅</p>
    <%
        }
    %>

    <!-- ✅ GOES TO register.jsp VIA CONTROLLER -->
    <a class="btn" href="<%= request.getContextPath() %>/user/register">Go back to Login</a>
</div>

</body>
</html>