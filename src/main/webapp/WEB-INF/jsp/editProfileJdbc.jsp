<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ust.pos.dto.UserDto, java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User Profile</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #283c86, #45a247);
            font-family: 'Segoe UI', Tahoma, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }

        .edit-card {
            width: 460px;
            background: #ffffff;
            border-radius: 18px;
            padding: 30px;
            box-shadow: 0 18px 40px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        .field {
            margin-bottom: 14px;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #555;
            margin-bottom: 6px;
        }

        input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .actions {
            margin-top: 25px;
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .btn {
            flex: 1;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            color: #fff;
        }

        .save-btn {
            background: #2e7d32;
        }

        .cancel-btn {
            background: #9e9e9e;
            text-align: center;
            line-height: 38px;
            text-decoration: none;
        }
    </style>
</head>

<body>

<%
    UserDto user = (UserDto) request.getAttribute("user");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<div class="edit-card">

    <h2>Edit Profile</h2>

<% if (user != null) { %>

    <!-- ✅✅✅ THIS FORM TAG IS WHAT YOU WERE MISSING -->
    <form action="<%= request.getContextPath() %>/user/saveProfileJdbc" method="post">

        <input type="hidden" name="id" value="<%= user.getId() %>" />

        <div class="field">
            <label>Name</label>
            <input type="text" name="name" value="<%= user.getName() %>" required />
        </div>

        <div class="field">
            <label>Email</label>
            <input type="email" name="email" value="<%= user.getEmail() %>" required />
        </div>

        <div class="field">
            <label>Phone</label>
            <input type="text" name="phoneNo" value="<%= user.getPhoneNo() %>" />
        </div>

        <div class="field">
            <label>Username</label>
            <input type="text" name="userName" value="<%= user.getUserName() %>" />
        </div>

        <div class="field">
            <label>Password</label>
            <input type="password" name="password" value="<%= user.getPassword() %>" />
        </div>

        <div class="field">
            <label>Age</label>
            <input type="number" name="age" value="<%= user.getAge() %>" />
        </div>

        <div class="field">
            <label>Date of Birth</label>
            <input type="date" name="dateOfBirth"
                   value="<%= user.getDateOfBirth() != null ? sdf.format(user.getDateOfBirth()) : "" %>" />
        </div>

        <div class="actions">
            <a class="btn cancel-btn"
               href="<%= request.getContextPath() %>/user/getProfileId?id=<%= user.getId() %>">
                Cancel
            </a>

            <button type="submit" class="btn save-btn">
                Save
            </button>
        </div>

    </form>

<% } else { %>
    <p>User not found</p>
<% } %>

</div>

</body>
</html>