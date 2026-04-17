<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Add a Role</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            height: 100vh;
            background: radial-gradient(
                circle,
                #ffffff 0%,
                #b8b4ff 35%,
                #1900c1 100%
            );
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .role-card {
            background: #ffffff;
            width: 420px;
            padding: 30px 35px;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        .top-actions {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .home-btn {
            padding: 8px 16px;
            background-color: #1900c1;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
        }

        .home-btn:hover {
            background-color: #12008f;
        }

        .back-btn {
            padding: 8px 16px;
            background-color: #fbc02d;
            color: #000000;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
        }

        .back-btn:hover {
            background-color: #f9a825;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #1900c1;
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

        .form-input,
        .btn-submit {
            width: 100%;
            padding: 12px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form-input {
            border: 1px solid #ccc;
            border-radius: 6px;
            outline: none;
        }

        .form-input:focus {
            border-color: #0078D4;
            box-shadow: 0 0 5px rgba(0, 120, 212, 0.3);
        }

        .btn-submit {
            background: #1900c1;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s ease;
        }

        .btn-submit:hover {
            background: #005A9E;
        }

        .footer-text {
            text-align: center;
            font-size: 13px;
            color: #777;
            margin-top: 15px;
        }
    </style>

</head>
<body>

<div class="role-card">

    <div class="top-actions">
        <a href="/" class="home-btn">Home</a>
        <a href="/role/allrolesjdbc" class="back-btn">Back to Roles List</a>
    </div>

    <h2>Add a Role</h2>

    <form:form action="/role/addrolejdbc" method="post" modelAttribute="roleDto">
        <form:hidden path="id"/>

        <div class="form-group">
            <label>Role Name</label>
            <form:input path="name" type="text" cssClass="form-input"/>
        </div>

        <input type="submit" value="Add" class="btn-submit"/>

    </form:form>

</div>

</body>
</html>