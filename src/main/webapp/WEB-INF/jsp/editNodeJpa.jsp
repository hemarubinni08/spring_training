<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Node</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .form-container {
            width: 420px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        h2 {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        .form-field {
            margin-bottom: 15px;
        }
        input[type="submit"] {
            padding: 8px 18px;
            cursor: pointer;
        }
        .footer-link {
            margin-top: 20px;
            display: inline-block;
        }
    </style>
</head>

<body>

<div class="form-container">

    <h2>Edit Node</h2>

    <form:form action="${pageContext.request.contextPath}/node/updateNode"
               method="post"
               modelAttribute="nodeDto">

        <!-- Hidden ID field -->
        <form:input path="id" value="${node.id}" type="hidden" />

        <div class="form-field">
            <label for="name">Node Name</label>
            <form:input path="name" id="name"
                        value="${node.name}"
                        placeholder="Enter node name" />
        </div>

        <div class="form-field">
            <label for="path">Node Path</label>
            <form:input path="path" id="path"
                        value="${node.path}"
                        placeholder="Enter node path" />
        </div>
        </div>
        <div class="form-group">
             <label>Roles</label>
             <select name="roles" multiple  required>
             <option value="">-- Select Role --</option>
             <c:forEach var="role" items="${roles}">
                     <option value="${role.name}">
                     ${role.name}
                     </option>
                     </c:forEach>
       </select>
       </div>

        <input type="submit" value="Update Node" />

    </form:form>

    <div class="footer-link">
        <a href="${pageContext.request.contextPath}/node/displayNodeJpa">
            ← Back to Node List
        </a>
    </div>

</div>

</body>
</html>