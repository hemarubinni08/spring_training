<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User - ${u.name}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            max-width: 450px;
            width: 100%;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header {
            border-bottom: 2px solid #eeeeee;
            padding-bottom: 15px;
            margin-bottom: 25px;
            text-align: center;
        }

        h2 { margin: 0; color: #2c3e50; }
        .subtitle { font-size: 14px; color: #7f8c8d; margin-top: 5px; }

        .form-group { margin-bottom: 15px; }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            font-size: 12px;
            color: #555;
            text-transform: uppercase;
        }

        .input-field {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .readonly-field {
            background-color: #f9f9f9;
            color: #999;
            cursor: not-allowed;
            border-style: dashed;
        }

        .btn-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 25px;
        }

        .btn {
            padding: 12px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            text-align: center;
            border: none;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-save { background-color: #3498db; color: white; }
        .btn-save:hover { background-color: #2980b9; }

        .btn-cancel {
            background-color: #f8f9fa;
            color: #7f8c8d;
            border: 1px solid #ccc;
        }
        .btn-cancel:hover { background-color: #eeeeee; }

        .status-msg {
            font-size: 12px;
            color: #27ae60;
            margin-bottom: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2>User Profile</h2>
        <p class="subtitle">Modify record in SQL Database</p>
    </div>

    <%-- Optional message from server --%>
    <c:if test="${not empty u.message}">
        <div class="status-msg" style="text-align: center;">${u.message}</div>
    </c:if>

    <form action="/user/updateJdbc" method="POST">

        <div class="form-group">
            <label>Database ID (PK)</label>
            <input type="text" name="id" value="${u.id}" class="input-field readonly-field" readonly>
        </div>

        <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="name" value="${u.name}" class="input-field" required>
        </div>

        <div class="form-group">
            <label>SQL Username</label>
            <input type="text" name="userName" value="${u.userName}" class="input-field" required>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <input type="email" name="email" value="${u.email}" class="input-field" required>
        </div>

        <div style="display: flex; gap: 15px;">
            <div class="form-group" style="flex: 1;">
                <label>Age</label>
                <input type="number" name="age" value="${u.age}" class="input-field" required>
            </div>
            <div class="form-group" style="flex: 2;">
                <label>Date of Birth</label>
                <input type="date" name="dateOfBirth" value="${u.dateOfBirth}" class="input-field" required>
            </div>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <input type="text" name="phoneNo" value="${u.phoneNo}" class="input-field" required>
        </div>

        <div class="btn-container">
            <button type="submit" class="btn btn-save">Execute Update</button>
            <a href="/user/getAllUsersJdbc" class="btn btn-cancel">Cancel and Return</a>
        </div>
    </form>
</div>

</body>
</html>