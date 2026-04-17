<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>

    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-card {
            background: #ffffff;
            width: 420px;
            padding: 30px 35px;
            border-radius: 10px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.2);
        }

        .register-card h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2c3e50;
        }

        .form-group {
            margin-bottom: 14px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #555;
        }

        input, select {
            width: 100%;
            padding: 9px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
            outline: none;
        }

        input:focus, select:focus {
            border-color: #2575fc;
        }

        .gender-group {
            display: flex;
            gap: 12px;
            margin-top: 4px;
        }

        .gender-group label {
            font-weight: normal;
        }

        .gender-group input {
            width: auto;
            margin-right: 4px;
        }

        button {
            width: 100%;
            padding: 11px;
            margin-top: 18px;
            background-color: #2575fc;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #1a5ed8;
        }
    </style>
</head>

<body>

<div class="register-card">
    <h2>User Registration</h2>

    <form action="register" method="post">

        <div class="form-group">
            <label>User Name</label>
            <input type="text" name="userName" required>
        </div>

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>

        <div class="form-group">
            <label>phoneNo</label>
            <input type="text" name="phoneNo" required>
        </div>

        <div class="form-group">
            <label>Role</label>
            <select name="role" required>
                <option value="">-- Select Role --</option>
                <c:forEach var="role" items="${roles}">
                    <option value="${role.name}">
                        ${role.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Additional Roles</label>
            <select name="roles" multiple size="3">
                <c:forEach var="role" items="${roles}">
                    <option value="${role.name}">
                        ${role.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <div class="form-group">
            <label>Gender</label>
            <div class="gender-group">
                <label><input type="radio" name="gender" value="Male" required> Male</label>
                <label><input type="radio" name="gender" value="Female"> Female</label>
                <label><input type="radio" name="gender" value="Other"> Other</label>
            </div>
        </div>

        <div class="form-group">
            <label>Date of Birth</label>
            <input type="date" name="dob" required>
        </div>

        <button type="submit">Register</button>

    </form>
</div>

</body>
</html>