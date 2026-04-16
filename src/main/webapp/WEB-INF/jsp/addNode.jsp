<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Node</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
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

        .form-group { margin-bottom: 20px; }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            font-size: 13px;
            color: #555;
            text-transform: uppercase;
        }

        .input-field {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 15px;
            font-family: Arial, sans-serif;
        }

        /* Specialized styling for the Path input to look technical */
        .path-input {
            font-family: 'Courier New', monospace;
            background-color: #fcfcfc;
            color: #2980b9;
        }

        /* Scrollable box for multi-role selection */
        .role-selector {
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 10px;
            max-height: 120px;
            overflow-y: auto;
            background: #fafafa;
        }

        .role-option {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            cursor: pointer;
        }

        .role-option input { margin-right: 10px; }

        .btn-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 25px;
        }

        .btn {
            padding: 12px;
            border-radius: 4px;
            font-size: 15px;
            font-weight: bold;
            text-decoration: none;
            text-align: center;
            border: none;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-add { background-color: #2ecc71; color: white; }
        .btn-add:hover { background-color: #27ae60; }

        .btn-cancel {
            background-color: #f8f9fa;
            color: #7f8c8d;
            border: 1px solid #ccc;
        }
        .btn-cancel:hover { background-color: #eeeeee; }
    </style>
</head>
<body>


<div class="container">
    <div class="header">
        <h2>Register System Node</h2>
        <p class="subtitle">Define a new entry in the JPA architecture</p>
    </div>

    <form action="/node/addNode" method="POST">
        <div class="form-group">
            <label>Node Identity (Name)</label>
            <input type="text" name="name" class="input-field" placeholder="e.g. Data_Server_01" required autofocus>
        </div>

        <div class="form-group">
            <label>System Directory (Path)</label>
            <input type="text" name="path" class="input-field path-input" placeholder="/srv/nodes/data" required>
        </div>

        <div class="form-group">
            <label>Access Roles</label>
            <div class="role-selector">
                <c:forEach var="r" items="${roles}">
                    <label class="role-option">
                        <input type="checkbox" name="roles" value="${r.name}">
                        ${r.name}
                    </label>
                </c:forEach>
                <c:if test="${empty roles}">
                    <span style="color: #999; font-size: 12px;">No roles available. Create roles first.</span>
                </c:if>
            </div>
        </div>

        <div class="btn-container">
            <button type="submit" class="btn btn-add">Initialize Node</button>
            <a href="/node/getAllNodes" class="btn btn-cancel">Cancel and Return</a>
        </div>
    </form>
</div>

</body>
</html>