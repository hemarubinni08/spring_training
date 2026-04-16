<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Role (JDBC)</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Verdana, sans-serif;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            width: 420px;
            background: #ffffff;
            border-radius: 22px;
            padding: 35px;
            box-shadow: 0 30px 70px rgba(0,0,0,0.35);
        }

        .title {
            text-align: center;
            font-size: 26px;
            font-weight: 800;
            margin-bottom: 30px;
        }

        label {
            font-weight: 600;
            font-size: 14px;
        }

        .input-box {
            width: 100%;
            padding: 14px;
            margin: 10px 0 25px;
            font-size: 15px;
            border-radius: 12px;
            border: 1px solid #ccc;
        }

        .btn {
            width: 100%;
            padding: 14px;
            border-radius: 14px;
            border: none;
            font-size: 16px;
            font-weight: 700;
            color: white;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="card">

    <div class="title">➕ Add Role (JDBC)</div>

    <!-- ✅ OPENING TAG WAS MISSING BEFORE -->
    <form:form method="post"
               modelAttribute="roleDto"
               action="${pageContext.request.contextPath}/role/addRoleJdbc">

        <label>Role Name</label>
        <form:input path="name"
                    class="input-box"
                    placeholder="Enter role name"
                    required="true"/>

        <button type="submit" class="btn">
            🚀 Add Role
        </button>

    </form:form>

</div>

</body>
</html>