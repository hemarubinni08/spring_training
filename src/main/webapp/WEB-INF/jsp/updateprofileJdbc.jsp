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

        /* Card container */
        .role-card {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            max-width: 450px;
            width: 90%;
        }

        h2 {
            margin-bottom: 20px;
            color: #1900c1;
            text-align: center;
        }

        label {
            font-weight: 600;
            color: #333;
        }

        input[type="text"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            margin-top: 6px;
            margin-bottom: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #1900c1;
            box-shadow: 0 0 6px rgba(25, 0, 193, 0.25);
        }

        input[type="submit"] {
            width: 100%;
            margin-top: 10px;
            padding: 12px;
            background-color: #1900c1;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #12008f;
        }
    </style>
</head>

<body>

    <div class="role-card">
        <h2>User Registration</h2>

        <form:form action="updateprofileJdbc" method="post" modelAttribute="userDto">

            <form:hidden path="id"/>

            <label>Name</label>
            <form:input path="name" />

            <label>Email</label>
            <form:input path="email" />

            <label>Phone Number</label>
            <form:input path="phoneNo" />

            <label>Username</label>
            <form:input path="userName" />

            <label>Password</label>
            <form:password path="password" />

            <label>Age</label>
            <form:input path="age" />

            <input type="submit" value="Update" />

        </form:form>
    </div>

</body>
</html>