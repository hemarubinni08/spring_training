<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Node Registration</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-container {
            background: #ffffff;
            padding: 30px 35px;
            width: 380px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            font-weight: 600;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #667eea;
        }

        .register-btn {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            background: #667eea;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }

        .register-btn:hover {
            background: #5a67d8;
        }

        .error-message {
            background: #ffe6e6;
            color: #d8000c;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 14px;
            text-align: center;
        }
    </style>
</head>

<body>

<div class="register-container">
    <h2>Node Registration</h2>

    <form action="/node/addnode" method="post">

        <div class="form-group">
            <label>Node Name</label>
            <input type="text" name="name" required>
        </div>
        <div class="form-group">
            <label>Node Path</label>
            <input type="text" name="path" required>
        </div>

         <div class="form-group">
              <label>Role</label>
               <select name="role" required>
                    <option value="">Select Role</option>
                    <c:forEach var="role" items="${roles}">
                    <option value="${role.name}">${role.name}</option>
                    </c:forEach>
                </select>
         </div>

         <div class="form-group">
               <label>Roles</label>
               <select name="roles" multiple required>
                    <option value="">Select Roles</option>
                    <c:forEach var="role" items="${roles}">
                    <option value="${role.name}">${role.name}</option>
                    </c:forEach>
               </select>
         </div>

        <button type="submit" class="register-btn">Add Node</button>
    </form>

</div>

</body>
</html>