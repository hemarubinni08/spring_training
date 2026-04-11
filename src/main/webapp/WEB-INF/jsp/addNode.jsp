<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Node</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }
        .container {
            width: 400px;
            margin: 100px auto;
            padding: 25px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }
        button {
            background-color: #28a745;
            color: white;
            border: none;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Add Node</h2>

    <form:form action="/node/addNode" method="post" modelAttribute="nodeDto">

        <label>Node Name</label>
        <form:input path="name" placeholder="Enter node name"/>

        <label>Path</label>
        <form:input path="path" placeholder="Enter path"/>

        <button type="submit">Add Node</button>

    </form:form>
</div>

</body>
</html>