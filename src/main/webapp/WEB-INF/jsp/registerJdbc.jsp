<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #4e73df, #1cc88a);
            margin: 0;
            padding: 0;
            height: 100vh;
        }

        .container {
            width: 420px;
            margin: 70px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
            animation: fadeIn 0.7s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            font-size: 14px;
            color: #555;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #4e73df;
            box-shadow: 0 0 6px rgba(78, 115, 223, 0.4);
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: #4e73df;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #375adf;
        }

        .error {
            background: #ffe6e6;
            color: #cc0000;
            text-align: center;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .footer {
            text-align: center;
            margin-top: 15px;
            font-size: 13px;
            color: #777;
        }
    </style>

    <script>
        function validateForm() {
            let email = document.getElementById("email").value;
            let age = document.getElementById("age").value;
            let phone = document.getElementById("phoneNo").value;

            if (!email.includes("@")) {
                alert("Please enter a valid email address");
                return false;
            }

            if (age <= 0) {
                alert("Age must be greater than 0");
                return false;
            }

            if (phone.length < 10) {
                alert("Phone number should be at least 10 digits");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>

<div class="container">
    <h2>User Registration</h2>

    <c:if test="${not empty errorMessage}">
        <div class="error">
            ${errorMessage}
        </div>
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

        <input type="submit" class="btn" value="Register"/>

    </form:form>
</div>

</body>
</html>