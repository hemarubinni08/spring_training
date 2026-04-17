<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Update Node</title>

    <style>
        body {
            margin: 0;
            padding: 40px 20px;
            font-family: "Segoe UI", Arial, sans-serif;
            min-height: 100vh;
            background: radial-gradient(
                circle,
                #ffffff 0%,
                #b8b4ff 35%,
                #1900c1 100%
            );
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .role-card {
            background: #ffffff;
            width: 420px;
            padding: 30px 35px;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        .top-actions {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .home-btn {
            padding: 8px 16px;
            background-color: #1900c1;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
        }

        .home-btn:hover {
            background-color: #12008f;
        }

        .back-btn {
            padding: 8px 16px;
            background-color: #fbc02d;
            color: #000000;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
        }

        .back-btn:hover {
            background-color: #f9a825;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #1900c1;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            box-sizing: border-box;
        }

        input:focus {
            border-color: #0078D4;
            box-shadow: 0 0 5px rgba(0, 120, 212, 0.3);
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background: #1900c1;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
            box-sizing: border-box;
        }

        .btn-submit:hover {
            background: #005A9E;
        }

        .role-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 8px;
        }

        .role-buttons div {
            position: relative;
        }

        .role-buttons input[type="checkbox"] {
            display: none;
        }

        .role-buttons label {
            padding: 8px 14px;
            border: 1px solid #1900c1;
            border-radius: 20px;
            cursor: pointer;
            font-size: 13px;
            color: #1900c1;
            transition: all 0.2s ease;
        }

        .role-buttons input[type="checkbox"]:checked + label {
            background: #1900c1;
            color: #fff;
        }
    </style>

</head>
<body>

<div class="role-card">

    <div class="top-actions">
        <a href="/" class="home-btn">Home</a>
        <a href="/node/allnodes" class="back-btn">Back to Node List</a>
    </div>

    <h2>Update Node</h2>

    <form:form action="/node/update" method="post" modelAttribute="nodeDto">

        <form:hidden path="id"/>

        <div class="form-group">
            <label>Node Name</label>
            <form:input path="name" type="text"/>
        </div>

        <div class="form-group">
            <label>Node Path</label>
            <form:input path="path" type="text"/>
        </div>

        <div class="form-group">
            <label>Roles</label>
            <div class="role-buttons">
                <form:checkboxes
                        path="roles"
                        items="${roles}"
                        itemValue="name"
                        itemLabel="name"
                        element="div"/>
            </div>
        </div>

        <input type="submit" value="Update Node" class="btn-submit"/>

    </form:form>

</div>

</body>
</html>