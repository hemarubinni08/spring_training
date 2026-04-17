<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Add Role</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-size: 28px;
        }

        form {
            background-color: #ffffff;
            padding: 35px 45px;
            width: 360px;
            border-radius: 10px;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
        }

        label {
            display: block;
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
            outline: none;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus {
            border-color: #667eea;
            box-shadow: 0 0 6px rgba(102, 126, 234, 0.5);
        }

        input[type="submit"] {
            width: 100%;
            margin-top: 15px;
            padding: 12px;
            background-color: #667eea;
            color: #ffffff;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #5a67d8;
            transform: translateY(-1px);
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 15px;
            font-weight: bold;
            color: #ffffff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div>
    <h2>Add Role</h2>

    <form:form action="${pageContext.request.contextPath}/role/addrolejpa"
               method="post"
               modelAttribute="roleDto">

        <label>Name:</label>
        <form:input path="name" />
        <br><br>

        <input type="submit" value="Save Role" />

    </form:form>

    <a href="${pageContext.request.contextPath}/role/displayjpa">
        View Roles
    </a>
</div>

</body>
</html>
