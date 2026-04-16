<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background-color: #eef2f7;
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Card */
        .container {
            width: 380px;
            padding: 32px 28px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            text-align: center;
        }

        /* Title */
        h2 {
            margin-bottom: 25px;
            color: #2c3e50;
            font-weight: bold;
        }

        /* Labels */
        label {
            display: block;
            text-align: left;
            font-weight: 600;
            margin-bottom: 6px;
            color: #2c3e50;
            font-size: 14px;
        }

        /* Inputs */
        input,
        select {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus,
        select:focus {
            border-color: #2c3e50;
            outline: none;
        }

        /* Button group */
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        /* Home button */
        .home-btn {
            flex: 1;
            padding: 12px;
            background-color: #2c3e50;
            color: white;
            text-decoration: none;
            text-align: center;
            border-radius: 5px;
            font-weight: bold;
        }

        /* Register button */
        .register-btn {
            flex: 1;
            padding: 12px;
            background-color: #34495e;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        /* Hover */
        .home-btn:hover,
        .register-btn:hover {
            opacity: 0.9;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>User Register</h2>

    <!-- FORM -->
    <form id="regForm" action="${pageContext.request.contextPath}/user/register" method="post" modelAttribute="userDto">

        <label>Name:</label>
        <input type="text" name="name" required/>

        <label>Email:</label>
        <input type="email" name="email" required/>

        <label>Password:</label>
        <input type="password" name="password" required/>

        <label>Role:</label>
        <select name="role">
            <option value="">--Select Role--</option>
            <c:forEach var="role" items="${roles}">
                <option value="${role.name}">${role.name}</option>
            </c:forEach>
        </select>

        <label>Roles (Multiple):</label>
        <select name="roles[]" multiple size="5">
            <c:forEach var="role" items="${roles}">
                <option value="${role.name}">${role.name}</option>
            </c:forEach>
        </select>

    </form>

    <!-- BUTTONS -->
    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/" class="home-btn">Home</a>

        <button type="submit" form="regForm" class="register-btn">
            Register
        </button>
    </div>

</div>

</body>
</html>