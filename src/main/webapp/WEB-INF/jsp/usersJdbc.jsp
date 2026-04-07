<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Show All Users</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            height: 100vh;
            background: radial-gradient(
                circle,
                #ffffff 0%,
                #b8b4ff 35%,
                #1900c1 100%
            );
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Card container */
        .register-card {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            max-width: 900px;
            width: 90%;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        thead {
            background-color: #1900c1;
            color: #ffffff;
        }

        th, td {
            padding: 12px 14px;
            text-align: left;
        }

        th {
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        tbody tr {
            border-bottom: 1px solid #e0e0e0;
        }

        tbody tr:nth-child(even) {
            background-color: #f8f8ff;
        }

        tbody tr:hover {
            background-color: #e9ebff;
            transition: background-color 0.2s ease-in-out;
            cursor: pointer;
        }

        h2 {
            margin-bottom: 15px;
            color: #1900c1;
            text-align: center;
        }
    </style>
</head>

<body>

<div class="register-card">
    <h2>User List</h2>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email Path Variable</th>
            <th>Email Request Params</th>
            <th>Phone</th>
            <th>Username</th>
            <th>Age</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td><a href="/user/getprofileJdbc/${user.email}">${user.email}</a></td>
                <td><a href="/user/getprofileJdbc?email=${user.email}"> ${user.email} </a></td>
                <td>${user.phoneNo}</td>
                <td>${user.userName}</td>
                <td>${user.age}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>