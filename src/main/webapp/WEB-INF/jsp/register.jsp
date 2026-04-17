<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Register</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');

            body {
                font-family: 'Inter', Arial, sans-serif;
                background: linear-gradient(135deg, #eef2f7, #dde6f1);
                margin: 0;
                padding: 40px;
            }

            h2 {
                text-align: center;
                margin-bottom: 25px;
                color: #1f2937;
                font-weight: 600;
            }

            form {
                width: 420px;
                margin: auto;
                background: #ffffff;
                padding: 30px;
                border-radius: 14px;
                box-shadow: 0 14px 35px rgba(0, 0, 0, 0.08);
            }

            form label,
            form {
                font-size: 14px;
                color: #374151;
                font-weight: 500;
            }

            form input[type="text"],
            form input[type="password"],
            form input[type="number"],
            form select {
                width: 100%;
                padding: 10px 12px;
                margin-top: 6px;
                margin-bottom: 14px;
                border: 1px solid #d1d5db;
                border-radius: 8px;
                font-size: 14px;
                transition: border-color 0.2s, box-shadow 0.2s;
                box-sizing: border-box;
            }

            form input:focus,
            form select:focus {
                outline: none;
                border-color: #2563eb;
                box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
            }

            form select[multiple] {
                height: 120px;
            }

            form input[type="submit"] {
                width: 100%;
                margin-top: 20px;
                padding: 12px;
                background: linear-gradient(135deg, #2563eb, #1d4ed8);
                border: none;
                color: #ffffff;
                font-size: 15px;
                font-weight: 600;
                border-radius: 10px;
                cursor: pointer;
                box-shadow: 0 8px 20px rgba(37, 99, 235, 0.35);
                transition: transform 0.15s ease, box-shadow 0.15s ease;
            }

            form input[type="submit"]:hover {
                transform: translateY(-1px);
                box-shadow: 0 12px 28px rgba(37, 99, 235, 0.45);
            }

            body > a {
                display: inline-block;
                margin-top: 25px;
                padding: 10px 18px;
                background: #64748b;
                color: #ffffff;
                border-radius: 8px;
                font-weight: 500;
                text-decoration: none;
                box-shadow: 0 6px 14px rgba(100, 116, 139, 0.3);
            }

            body > a:hover {
                background: #475569;
            }

        </style>
</head>
<body>

<h2>User Registration</h2>

<form:form method="post" modelAttribute="userDto" action="/user/register">

    Name: <form:input path="name"/><br/><br/>
    Email: <form:input path="email"/><br/><br/>
    Phone: <form:input path="phoneNo"/><br/><br/>
    Username: <form:input path="userName"/><br/><br/>
    Password: <form:password path="password"/><br/><br/>
    Age: <form:input path="age"/><br/><br/>

    Role:
    <form:select path="roleId">
        <form:option value="" label="-- Select Role --"/>
        <c:forEach var="role" items="${roleDtoList}">
            <form:option value="${role.id}" label="${role.name}"/>
        </c:forEach>
    </form:select> <br/><br/>

    Additional Roles:
    <form:select path="roleIds" multiple="true">
        <form:option value="" label="-- Select Role --"/>
        <c:forEach var="role" items="${roleDtoList}">
            <form:option value="${role.id}" label="${role.name}"/>
        </c:forEach>
    </form:select>

    <input type="submit" value="Register"/>
</form:form>
<a href="/user/getAllUsers">Back</a>
</body>
</html>