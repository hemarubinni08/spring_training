<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Register</title>
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                background-color: #f4f6f8;
                margin: 0;
                padding: 0;
            }

            h2 {
                text-align: center;
                margin-top: 40px;
                color: #333;
            }

            form {
                width: 400px;
                margin: 30px auto;
                background: #ffffff;
                padding: 25px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            form label {
                font-weight: bold;
                display: block;
                margin-top: 10px;
            }

            form input[type="text"],
            form input[type="password"] {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            form input[type="submit"] {
                width: 100%;
                margin-top: 20px;
                padding: 10px;
                background-color: #007bff;
                border: none;
                color: #fff;
                font-size: 16px;
                border-radius: 4px;
                cursor: pointer;
            }

            form input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
</head>
<body>

<h2>Update Node</h2>

<form:form method="post" modelAttribute="nodeDto" action="/node/updateNodeByid/${node.id}">
    Name: <form:input path="name" value = "${node.name}"/><br/><br/>
    path: <form:input path="path" value = "${node.path}"/><br/><br/>
    <input type="submit" value="Update"/>
</form:form>

</body>
</html>