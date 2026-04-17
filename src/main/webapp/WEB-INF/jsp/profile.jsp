<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }
        .box {
            width: 400px;
            margin: 80px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #4a3aff;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Edit User</h2>
    <c:if test="${not empty error}">
        <p style="color:red; text-align:center; font-weight:bold;">
            ${error}
        </p>
    </c:if>
    <form action="${pageContext.request.contextPath}/user/update" method="post">
        <input type="hidden" name="id" value="${user.id}" />
        <input type="text" name="name" value="${user.name}" placeholder="Name" />
        <input type="email" name="email" value="${user.email}" placeholder="Email" />
        <input type="text" name="phoneNo" value="${user.phoneNo}" placeholder="Phone" />
        <input type="text" name="userName" value="${user.userName}" placeholder="Username" />
        <input type="number" name="age" value="${user.age}" placeholder="Age">
        <input type="password" name="password" value="${user.password}" placeholder="Password">
        <select name="role" required>
            <option value="">-- Select Role --</option>
            <c:forEach var="r" items="${roles}">
                <option value="${r.name}" ${r.name == user.role ? 'selected' : ''}>
                    ${r.name}
                </option>
            </c:forEach>
        </select>
    <label>Roles:</label>
    <select name="roles" multiple required
             style="width:100%; padding:8px; border-radius:5px; border:1px solid #ccc; height:120px;">
    <c:forEach var="role" items="${roles}">
        <option value="${role.name}">
            ${role.name}
        </option>
    </c:forEach>
        </select>
        <button type="submit">Update</button>
    </form>
</div>
</body>
</html>