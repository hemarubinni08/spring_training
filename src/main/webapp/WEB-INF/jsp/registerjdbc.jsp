<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #9face6 100%);
            margin: 0;
            padding: 0;
        }
        .box {
            width: 500px;
            margin: 60px auto;
            padding: 40px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }
        .box h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            font-size: 24px;
            font-weight: bold;
        }
        .error-box {
            background: #ffe0e0;
            color: #c0392b;
            border: 1px solid #e74c3c;
            border-radius: 8px;
            padding: 10px 15px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
        }
        .error-box i {
            margin-right: 8px;
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 8px 12px;
            background: #f9f9f9;
        }
        .form-group i {
            margin-right: 12px;
            color: #4CAF50;
            font-size: 18px;
        }
        .form-group input {
            flex: 1;
            border: none;
            background: transparent;
            font-size: 14px;
            padding: 8px;
        }
        .form-group input:focus {
            outline: none;
        }
        .box button {
            width: 100%;
            padding: 14px;
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
            margin-top: 15px;
            font-weight: bold;
        }
        .box button:hover {
            background: #45a049;
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }
        .login-link a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>User Registration</h2>

<%-- ✅ Already correct in your JSP — just verify this block exists --%>
<c:if test="${not empty errorMessage}">
    <div class="error-box">
        <i class="fa fa-exclamation-circle"></i> ${errorMessage}
    </div>
</c:if>

    <form:form modelAttribute="userDto" method="post" action="/user/registerjdbc">

        <div class="form-group">
            <i class="fa fa-user"></i>
            <form:input path="name" placeholder="Full Name"/>
        </div>

        <div class="form-group">
            <i class="fa fa-envelope"></i>
            <form:input path="email" placeholder="Email"/>
        </div>

        <div class="form-group">
            <i class="fa fa-phone"></i>
            <form:input path="phoneNo" placeholder="Phone Number"/>
        </div>

        <div class="form-group">
            <i class="fa fa-user-circle"></i>
            <form:input path="userName" placeholder="Username"/>
        </div>

        <div class="form-group">
            <i class="fa fa-lock"></i>
            <form:password path="password" placeholder="Password"/>
        </div>

        <div class="form-group">
            <i class="fa fa-hashtag"></i>
            <form:input path="age" type="number" placeholder="Age"/>
        </div>

        <button type="submit">
            <i class="fa fa-user-plus"></i> Register
        </button>

    </form:form>

    <div class="login-link">
        Already have an account? <a href="/login">Login here</a>
    </div>
</div>
</body>
</html>