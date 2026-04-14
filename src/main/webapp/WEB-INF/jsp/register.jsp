<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #f4f6f9;
            color: #1f2937;
        }

        .container {
            width: 420px;
            margin: 60px auto;
            background: #ffffff;
            padding: 28px;
            border-radius: 14px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        h2 {
            text-align: center;
            margin-bottom: 22px;
            font-weight: 700;
            color: #111827;
        }

        .form-group {
            margin-bottom: 14px;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 6px;
        }

        input {
            width: 100%;
            padding: 10px 12px;
            border-radius: 10px;
            border: 1px solid #e5e7eb;
            font-size: 14px;
            outline: none;
            transition: 0.2s;
        }

        input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,0.15);
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: #6366f1;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
            margin-top: 8px;
        }

        .btn:hover {
            background: #4f46e5;
            transform: translateY(-1px);
        }

        .error {
            background: #fef2f2;
            color: #b91c1c;
            padding: 10px;
            border-radius: 10px;
            margin-bottom: 14px;
            font-size: 13px;
        }
    </style>

    <script>
        function validateForm() {
            let email = document.getElementById("email").value;
            let age = document.getElementById("age").value;
            let phone = document.getElementById("phoneNo").value;

            if (!email.includes("@")) {
                alert("Please enter a valid email");
                return false;
            }

            if (age <= 0) {
                alert("Age must be greater than 0");
                return false;
            }

            if (phone.length < 10) {
                alert("Phone number must be at least 10 digits");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>

<div class="container">

    <h2>Create Account</h2>

    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <form:form action="${pageContext.request.contextPath}/user/register"
               method="post"
               modelAttribute="user"
               onsubmit="return validateForm();">

        <div class="form-group">
            <label>Name</label>
            <form:input path="name" placeholder="Enter full name"/>
        </div>

        <div class="form-group">
            <label>Email</label>
            <form:input path="email" id="email" placeholder="Enter email"/>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <form:input path="phoneNo" id="phoneNo" placeholder="Enter phone number"/>
        </div>

        <div class="form-group">
            <label>Username</label>
            <form:input path="userName" placeholder="Choose username"/>
        </div>

        <div class="form-group">
            <label>Age</label>
            <form:input path="age" id="age" placeholder="Enter age"/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <form:password path="password" id="password" placeholder="Enter password"/>
        </div>

        <button type="submit" class="btn">Register</button>

    </form:form>

</div>

</body>
</html>