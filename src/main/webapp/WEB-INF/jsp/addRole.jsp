<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Role</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
        }
        .register-container {
            width: 100%;
            max-width: 400px;
            margin: 60px auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .register-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .register-container label {
            font-weight: bold;
        }
        .register-container input {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .register-container button {
            width: 100%;
            padding: 10px;
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .register-container button:hover {
            background: #45a049;
        }
    </style>
</head>

<body>

<div class="register-container">
    <h2>Add Role</h2>

    <!-- ✅ Plain HTML form (LIKE YOUR USER PAGE) -->
    <form method="post" action="/Role/addRole">
        <label for="roleName">Role Name</label>
        <input type="text" id="roleName" name="name" required>

         <c:if test="${not empty status.message}">
                    <p style="color:red">${status.message}</p>
                </c:if>

        <c:otherwise>
            <p style="color:green">${success}</p>
        </c:otherwise>


        <button type="submit">Add Role</button>
    </form>
</div>

</body>
</html>
``