<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Deletion Result</title>
    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #1f4037, #99f2c8);
            font-family: 'Segoe UI', Tahoma, sans-serif;
        }

        .card {
            background: #ffffff;
            padding: 30px;
            border-radius: 18px;
            width: 450px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #2e7d32;
        }

        .row {
            display: flex;
            justify-content: space-between;
            margin: 8px 0;
        }

        .error {
            text-align: center;
            color: #d32f2f;
            font-weight: 600;
        }

        .actions {
            text-align: center;
            margin-top: 20px;
        }

        a {
            background: #2e7d32;
            color: white;
            text-decoration: none;
            padding: 10px 22px;
            border-radius: 25px;
            display: inline-block;
        }
    </style>
</head>

<body>

<c:choose>
    <c:when test="${not empty userDto}">
        <div class="card">
            <h2>User Deleted Successfully</h2>

            <div class="row"><span>ID</span><strong>${userDto.id}</strong></div>
            <div class="row"><span>Name</span><strong>${userDto.name}</strong></div>
            <div class="row"><span>Email</span><strong>${userDto.email}</strong></div>
            <div class="row"><span>Username</span><strong>${userDto.userName}</strong></div>
            <div class="row"><span>Phone</span><strong>${userDto.phoneNo}</strong></div>
            <div class="row"><span>Age</span><strong>${userDto.age}</strong></div>
            <div class="row">
                <span>DOB</span>
                <strong>
                    <fmt:formatDate value="${userDto.dateOfBirth}" pattern="dd MMM yyyy"/>
                </strong>
            </div>

            <div class="actions">
                <a href="${pageContext.request.contextPath}/user/showAllUsers">
                    Back to User List
                </a>
            </div>
        </div>
    </c:when>

    <c:otherwise>
        <div class="card">
            <h2>Deletion Failed</h2>
            <p class="error">User not found</p>
            <div class="actions">
                <a href="${pageContext.request.contextPath}/user/showAllUsers">
                    Back
                </a>
            </div>
        </div>
    </c:otherwise>
</c:choose>

</body>
</html>