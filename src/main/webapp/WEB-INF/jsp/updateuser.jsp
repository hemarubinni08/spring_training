<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 40px;
        }

        .form-container {
            max-width: 500px;
            margin: auto;
            background-color: #ffffff;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-container h2 {
            margin-top: 0;
            margin-bottom: 25px;
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #444;
        }

        input, select {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[readonly] {
            background-color: #f0f0f0;
        }

        select[multiple] {
            height: 100px;
        }

        .register-btn {
            width: 100%;
            margin-top: 20px;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 15px;
            border-radius: 4px;
            cursor: pointer;
        }

        .register-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

<div class="form-container">
    <h2>Update User</h2>

    <form action="/user/update" method="post">

        <div class="form-group">
            <label>Id</label>
            <input type="text" name="id" value="${user.id}" readonly>
        </div>

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" value="${user.name}" required>
        </div>

        <div class="form-group">
            <label>Username</label>
            <input type="text" name="userName" value="${user.userName}" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" value="${user.email}" required>
        </div>

        <div class="form-group">
            <label>Phone No</label>
            <input type="text" name="phoneNo" value="${user.phoneNo}">
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" value="${user.password}" required>
        </div>

        <div class="form-group">
            <label>Age</label>
            <input type="number" name="age" value="${user.age}">
        </div>

        <div class="form-group">
            <label>Date of Birth</label>
            <input type="date" name="dateOfBirth" value="${user.dateOfBirth}">
        </div>

        <div class="form-group">
            <label>Roles</label>
            <select name="roles" multiple required>
                <c:forEach items="${roles}" var="role">
                    <option value="${role.name}"
                        <c:if test="${not empty user.roles and fn:contains(user.roles, role.name)}">
                            selected
                        </c:if>>
                        ${role.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="register-btn">Save</button>
    </form>
</div>

</body>
</html>