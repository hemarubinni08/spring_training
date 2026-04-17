<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Update Profile</title>

    <style>
        body {
            margin: 0;
            padding: 40px 20px;
            font-family: "Segoe UI", Arial, sans-serif;
            min-height: 100vh;
            background: radial-gradient(
                circle,
                #ffffff 0%,
                #b8b4ff 35%,
                #1900c1 100%
            );

            display: flex;
            justify-content: center;
            align-items: flex-start; /* ✅ FIXED */
        }

        .role-card {
            background: #ffffff;
            padding: 30px 35px;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            width: 420px;
        }

        h2 {
            margin-bottom: 25px;
            color: #1900c1;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
            outline: none;
        }

        input:focus {
            border-color: #0078D4;
            box-shadow: 0 0 5px rgba(0, 120, 212, 0.3);
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background: #1900c1;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background: #005A9E;
        }

        /* ✅ TOGGLE BUTTON GROUP */
        .role-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 8px;
        }

        .role-buttons div {
            position: relative;
        }

        .role-buttons input[type="checkbox"] {
            display: none;
        }

        .role-buttons label {
            padding: 8px 14px;
            border: 1px solid #1900c1;
            border-radius: 20px;
            cursor: pointer;
            font-size: 13px;
            color: #1900c1;
            transition: all 0.2s ease;
        }

        .role-buttons input[type="checkbox"]:checked + label {
            background: #1900c1;
            color: #fff;
        }
    </style>
</head>

<body>

<div class="role-card">
    <h2>Update Profile</h2>

    <form:form action="updateprofileJpa" method="post" modelAttribute="userDto">

        <form:hidden path="id"/>

        <div class="form-group">
            <label>Name</label>
            <form:input path="name" />
        </div>

        <div class="form-group">
            <label>Email</label>
            <form:input path="email" />
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <form:input path="phoneNo" />
        </div>

        <div class="form-group">
            <label>Username</label>
            <form:input path="userName" />
        </div>

        <div class="form-group">
            <label>Password</label>
            <form:password path="password" />
        </div>

        <div class="form-group">
            <label>Age</label>
            <form:input path="age" />
        </div>

        <div class="form-group">
            <label>Roles</label>
            <div class="role-buttons">
                <form:checkboxes
                        path="roles"
                        items="${roles}"
                        itemValue="name"
                        itemLabel="name"
                        element="div"/>
            </div>
        </div>

        <input type="submit" value="Update" class="btn-submit"/>

    </form:form>
</div>

</body>
</html>