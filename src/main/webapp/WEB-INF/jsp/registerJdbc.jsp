<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
    <title>User Registration</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;

            background: url('${pageContext.request.contextPath}/images/bg.jpg') no-repeat center center/cover;

            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            width: 320px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.4);
        }

        h2 {
            text-align: center;
            margin-bottom: 15px;
        }

        label {
            font-size: 13px;
        }

        input {
            width: 100%;
            padding: 7px;
            margin: 4px 0 8px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 13px;
        }

        input:focus {
            border-color: #007bff;
            outline: none;
        }

        button {
            width: 100%;
            padding: 8px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            font-size: 11px;
        }
    </style>
</head>

<body>

<div class="card">
    <h2>Register</h2>

    <form:form method="post" modelAttribute="userDto">

        <label>Name</label>
        <form:input path="name"/>
        <form:errors path="name" cssClass="error"/>

        <label>Email</label>
        <form:input path="email"/>
        <form:errors path="email" cssClass="error"/>

        <label>Username</label>
        <form:input path="userName"/>
        <form:errors path="userName" cssClass="error"/>

        <label>Password</label>
        <form:password path="password"/>
        <form:errors path="password" cssClass="error"/>

        <label>Age</label>
        <form:input path="age"/>
        <form:errors path="age" cssClass="error"/>

        <label>Date of Birth</label>
        <form:input path="dateOfBirth"/>
        <form:errors path="dateOfBirth" cssClass="error"/>

        <button type="submit">Register</button>

    </form:form>
</div>

</body>
</html>
