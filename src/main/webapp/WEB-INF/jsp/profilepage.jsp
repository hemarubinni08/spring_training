<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 40px;
        }

        .profile-container {
            max-width: 600px;
            margin: auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .profile-title {
            margin-top: 0;
            margin-bottom: 25px;
            color: #333;
        }

        .profile-row {
            margin-bottom: 15px;
        }

        .profile-label {
            font-weight: bold;
            color: #444;
            margin-bottom: 4px;
            display: block;
        }

        .profile-value {
            color: #555;
        }

        .roles-list {
            padding-left: 18px;
            margin: 5px 0 0;
        }

        .roles-list li {
            color: #555;
        }
    </style>
</head>

<body>

<div class="profile-container">
    <h2 class="profile-title">User Profile</h2>

    <div class="profile-row">
        <span class="profile-label">Id</span>
        <span class="profile-value">${user.id}</span>
    </div>

    <div class="profile-row">
        <span class="profile-label">Name</span>
        <span class="profile-value">${user.name}</span>
    </div>

    <div class="profile-row">
        <span class="profile-label">Username</span>
        <span class="profile-value">${user.userName}</span>
    </div>

    <div class="profile-row">
        <span class="profile-label">Email</span>
        <span class="profile-value">${user.email}</span>
    </div>

    <div class="profile-row">
        <span class="profile-label">Phone No</span>
        <span class="profile-value">${user.phoneNo}</span>
    </div>

    <div class="profile-row">
        <span class="profile-label">Age</span>
        <span class="profile-value">${user.age}</span>
    </div>

    <div class="profile-row">
        <span class="profile-label">Date of Birth</span>
        <span class="profile-value">${user.dateOfBirth}</span>
    </div>

    <div class="profile-row">
        <span class="profile-label">Roles</span>
         <ul class="roles-list">

               <c:forEach items="${roles}" var="role">
                       <c:if test="${not empty user.roles and fn:contains(user.roles, role.name)}">
                           ${role.name}
                       </c:if>>
               </c:forEach>
        </ul>
    </div>
</div>

</body>
</html>