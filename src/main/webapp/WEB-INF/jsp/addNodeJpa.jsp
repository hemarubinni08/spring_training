<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Node</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 420px;
            margin: 60px auto;
            background-color: #ffffff;
            padding: 25px 30px;
            border-radius: 6px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2c3e50;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-field {
            margin-bottom: 18px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="text"]:focus {
            border-color: #1abc9c;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #1abc9c;
            border: none;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #16a085;
        }

        .footer-link {
            margin-top: 20px;
            text-align: center;
        }

        .footer-link a {
            color: #0066cc;
            text-decoration: none;
            font-weight: bold;
        }

        .footer-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Add Node</h2>

    <form:form action="${pageContext.request.contextPath}/node/addNodeJpa"
               method="post"
               modelAttribute="nodeDto">

        <div class="form-field">
            <label for="name">Node Name</label>
            <form:input path="name" id="name"
                        placeholder="Enter node name" />
        </div>

        <div class="form-field">
            <label for="path">Node Path</label>
            <form:input path="path" id="path"
                        placeholder="Enter node path" />
        </div>
        <div class="form-group">
                    <label>Additional Roles</label>
                    <select name="roles" multiple size="3">
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.name}">
                                ${role.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>

        <input type="submit" value="Save Node" />

    </form:form>

    <div class="footer-link">
        <a href="${pageContext.request.contextPath}/node/displayNodeJpa">
             View Node List
        </a>
    </div>

</div>

</body>
</html>