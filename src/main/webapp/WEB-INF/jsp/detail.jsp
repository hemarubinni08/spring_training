<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Details</title>

    <style>
        body {
            font-family: "Inter", "Segoe UI", Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .user-card {
            background-color: #ffffff;
            max-width: 720px;
            margin: auto;
            padding: 32px;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px 24px;
        }

        label {
            font-size: 13px;
            color: #6c757d;
            margin-bottom: 6px;
            display: block;
            font-weight: 600;
        }

        input,
        select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #dcdfe3;
            border-radius: 8px;
            font-size: 14px;
        }

        input[readonly] {
            background-color: #f1f3f5;
            color: #6c757d;
        }

        select[multiple] {
            height: 120px;
        }

        .button-group {
            grid-column: span 2;
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .save-button {
            padding: 10px 26px;
            background-color: #198754;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }

        .back-button {
            padding: 10px 26px;
            background-color: #6c757d;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }
    </style>
</head>

<body>

<h2>User Details</h2>

<form action="/user/updateJpa" method="post">
    <div class="user-card">

        <div class="form-grid">

            <!-- Readonly ID -->
            <div>
                <label>User ID</label>
                <input type="text" name="id" value="${user.id}" readonly />
            </div>

            <div>
                <label>Age</label>
                <input type="text" name="age" value="${user.age}" />
            </div>

            <div>
                <label>Name</label>
                <input type="text" name="name" value="${user.name}" />
            </div>

            <div>
                <label>Email</label>
                <input type="text" name="email" value="${user.email}" />
            </div>

            <div>
                <label>Phone No</label>
                <input type="text" name="phoneNo" value="${user.phoneNo}" />
            </div>

            <div>
                <label>Username</label>
                <input type="text" name="userName" value="${user.userName}" />
            </div>

            <!-- ✅ SINGLE ROLE DROPDOWN -->
            <div>
                <label>Role</label>
                <select name="role">
                    <c:forEach var="r" items="${roles}">
                        <option value="${r.name}"
                            <c:if test="${r.name == user.role}">selected</c:if>>
                            ${r.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!-- ✅ MULTI ROLE DROPDOWN -->
            <div>
                <label>Roles</label>
                <select name="roles" multiple>
                    <c:forEach var="r" items="${roles}">
                        <option value="${r.name}"
                            <c:if test="${user.roles.contains(r.name)}">selected</c:if>>
                            ${r.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="button-group">
                <button class="save-button" type="submit">Save Changes</button>
                <button class="back-button" type="button" onclick="history.back()">Back</button>
            </div>

        </div>
    </div>
</form>

</body>
</html>