<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ust.pos.dto.UserDto" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Save Status</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
        }

        .card {
            width: 420px;
            background: #ffffff;
            border-radius: 18px;
            padding: 30px;
            box-shadow: 0 18px 40px rgba(0,0,0,0.25);
            text-align: center;
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .success-title {
            color: #2e7d32;
        }

        .error-title {
            color: #d32f2f;
        }

        .summary {
            background: #f5f5f5;
            border-radius: 10px;
            padding: 15px;
            text-align: left;
            font-size: 13px;
            margin-bottom: 25px;
        }

        .btn {
            display: inline-block;
            padding: 12px 26px;
            background: #1976d2;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
        }

        .btn:hover {
            background: #0d47a1;
        }
    </style>
</head>

<body>

<%
    UserDto user = (UserDto) request.getAttribute("savedUser");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<div class="card">

<% if (user != null) { %>

    <!-- ✅ SUCCESS -->
    <h2 class="success-title">✅ User Saved Successfully</h2>

    <div class="summary">
        <div><b>ID:</b> <%= user.getId() %></div>
        <div><b>Name:</b> <%= user.getName() %></div>
        <div><b>Email:</b> <%= user.getEmail() %></div>
        <div><b>Phone:</b> <%= user.getPhoneNo() %></div>
        <div><b>Username:</b> <%= user.getUserName() %></div>
    </div>

<% } else { %>

    <!-- ❌ ERROR -->
    <h2 class="error-title">❌ Operation Failed</h2>

    <p style="color:#d32f2f; font-weight:600;">
        <%= errorMessage != null ? errorMessage : "Unable to save user details." %>
    </p>

<% } %>

   <a class="btn" href="<%= request.getContextPath() %>/user/showAllUsersJdbc">
       Back to Users
   </a>

</div>

</body>
</html>