<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ust.pos.dto.UserDto, java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile (JDBC)</title>

<style>
    body {
        margin: 0;
        min-height: 100vh;
        background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
        font-family: 'Segoe UI', Tahoma, Verdana, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 30px;
    }

    .profile-card {
        width: 430px;
        background: #ffffff;
        border-radius: 18px;
        padding: 30px;
        box-shadow: 0 18px 40px rgba(0,0,0,0.3);
        animation: fadeIn 0.6s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 25px;
        letter-spacing: 1px;
    }

    .field {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px solid #eee;
        font-size: 14px;
    }

    .label {
        color: #555;
        font-weight: 600;
    }

    .value {
        color: #333;
        text-align: right;
        max-width: 60%;
        word-wrap: break-word;
    }

    .password {
        letter-spacing: 2px;
        color: #999;
        font-style: italic;
    }

    .footer {
        margin-top: 25px;
        text-align: center;
    }

    .btn {
        display: inline-block;
        padding: 12px 28px;
        background: #2c5364;
        color: #fff;
        text-decoration: none;
        border-radius: 8px;
        font-weight: 600;
    }

    .btn:hover {
        background: #1b3a4b;
    }
</style>
</head>

<body>

<%
    UserDto user = (UserDto) request.getAttribute("user");
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
%>

<div class="profile-card">

    <h2>User Profile (JDBC)</h2>

<%
    if (user == null) {
%>
        <p style="color:#d32f2f; text-align:center; font-weight:600;">
            User details not available
        </p>
<%
    } else {
%>

    <div class="field">
        <div class="label">ID</div>
        <div class="value"><%= user.getId() %></div>
    </div>

    <div class="field">
        <div class="label">Name</div>
        <div class="value"><%= user.getName() %></div>
    </div>

    <div class="field">
        <div class="label">Email</div>
        <div class="value"><%= user.getEmail() %></div>
    </div>

    <div class="field">
        <div class="label">Phone No</div>
        <div class="value"><%= user.getPhoneNo() %></div>
    </div>

    <div class="field">
        <div class="label">Username</div>
        <div class="value"><%= user.getUserName() %></div>
    </div>

    <div class="field">
        <div class="label">Password</div>
        <div class="value password">••••••</div>
    </div>

    <div class="field">
        <div class="label">Age</div>
        <div class="value"><%= user.getAge() %></div>
    </div>

    <div class="field">
        <div class="label">Date of Birth</div>
        <div class="value">
            <%
                if (user.getDateOfBirth() != null) {
            %>
                <%= sdf.format(user.getDateOfBirth()) %>
            <%
                } else {
            %>
                <span style="color:#999;">Not Provided</span>
            <%
                }
            %>
        </div>
    </div>

<%
    }
%>

    <div class="footer">
        <a class="btn" href="<%= request.getContextPath() %>/user/showAllUsersJdbc">
            Back to Users (JDBC)
        </a>

         <% if (user != null) { %>
                    <a class="btn" href="<%= request.getContextPath() %>/user/editProfileJdbc?id=<%= user.getId() %>">
                        Edit Profile
                    </a>
                <% } %>
    </div>

</div>

</body>
</html>