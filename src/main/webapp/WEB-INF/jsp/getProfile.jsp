<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ust.pos.dto.UserDto, java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #eef2ff, #f8fafc);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    color: #1e293b;
}

/* Card */
.profile-card {
    width: 450px;
    background: #ffffff;
    border-radius: 12px;
    padding: 28px;
    border: 1px solid #e2e8f0;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
}

/* Title */
h2 {
    text-align: center;
    margin-bottom: 22px;
    color: #0f172a;
    font-weight: 600;
}

/* Fields */
.field {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
    border-bottom: 1px solid #e5e7eb;
    font-size: 14px;
}

/* Labels */
.label {
    color: #475569;
    font-weight: 500;
}

/* Values */
.value {
    text-align: right;
    max-width: 60%;
    word-wrap: break-word;
    color: #1e293b;
}

/* Role tags */
.role-tag {
    display: inline-block;
    background: #e0e7ff;
    color: #3730a3;
    padding: 4px 8px;
    margin: 2px;
    border-radius: 6px;
    font-size: 12px;
}

/* Footer */
.footer {
    margin-top: 25px;
    text-align: center;
}

/* Buttons */
.btn {
    display: inline-block;
    padding: 10px 20px;
    margin: 8px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 14px;
    color: white;
    transition: 0.2s;
}

/* Button colors */
.btn:first-child {
    background: #6366f1;
}

.btn:first-child:hover {
    background: #4f46e5;
}

.btn:last-child {
    background: #0ea5e9;
}

.btn:last-child:hover {
    background: #0284c7;
}

/* Error */
.error {
    text-align: center;
    color: #ef4444;
    font-weight: 600;
}

</style>
</head>

<body>

<%
    UserDto user = (UserDto) request.getAttribute("user");
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
%>

<div class="profile-card">

    <h2>User Profile</h2>

<%
    if (user == null) {
%>
        <p class="error">User details not available</p>
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
                <span style="color:#94a3b8;">Not Provided</span>
            <%
                }
            %>
        </div>
    </div>

    <div class="field">
        <div class="label">Primary Role</div>
        <div class="value">
            <%
                if (user.getRole() != null) {
            %>
                <span class="role-tag"><%= user.getRole() %></span>
            <%
                } else {
            %>
                <span style="color:#94a3b8;">N/A</span>
            <%
                }
            %>
        </div>
    </div>

    <div class="field">
        <div class="label">Additional Roles</div>
        <div class="value">
            <%
                if (user.getRoles() != null && !user.getRoles().isEmpty()) {
                    for (String role : user.getRoles()) {
            %>
                <span class="role-tag"><%= role %></span>
            <%
                    }
                } else {
            %>
                <span style="color:#94a3b8;">None</span>
            <%
                }
            %>
        </div>
    </div>

<%
    }
%>

    <div class="footer">

        <a class="btn" href="<%= request.getContextPath() %>/user/showAllUsers">
            Back to Users
        </a>

        <% if (user != null) { %>
            <a class="btn" href="<%= request.getContextPath() %>/user/editProfile?id=<%= user.getId() %>">
                Edit Profile
            </a>
        <% } %>

    </div>

</div>

</body>
</html>