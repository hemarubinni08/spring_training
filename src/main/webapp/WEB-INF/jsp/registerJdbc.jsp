<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>User Registration</title>

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

        .register-card {
            background: #ffffff;
            width: 420px;
            padding: 30px 35px;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
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

        input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
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

<div class="register-card">
    <h2>User Registration</h2>

    <form:form action="registerJdbc" method="post" modelAttribute="userDto">

        <div class="form-group">
            <label>Name</label>
            <form:input path="name"/>
        </div>

        <div class="form-group">
            <label>Email</label>
            <form:input path="email"/>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <form:input path="phoneNo"/>
        </div>

        <div class="form-group">
            <label>Username</label>
            <form:input path="userName"/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <form:password path="password"/>
        </div>

        <div class="form-group">
            <label>Age</label>
            <form:input path="age"/>
        </div>

        <input type="submit" value="Register" class="btn-submit"/>

    </form:form>

</div>

</body>
</html>