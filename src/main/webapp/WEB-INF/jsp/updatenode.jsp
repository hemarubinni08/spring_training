<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Update Role</title>
</head>
<body>

<h2>Update Role</h2>

<form action="/node/updatenode" method="post">

    <input type="hidden" name="id" value="${node.id}" readonly />

    <label>Name:</label>
    <input type="text" name="name" value="${node.name}" required />

    <input type="text" name="path" value="${node.path}" required />

    <input type="text" name="role" value="${node.role}" required />

    <div>

                <label>Roles</label>

                <select name="roles" multiple required>
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.name}"
                            <c:forEach var="rid" items="${node.roles}">
                                <c:if test="${rid == role.name}">
                                    selected
                                </c:if>
                            </c:forEach>
                        >
                            ${role.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

    <br><br>

    <button type="submit">Update</button>

</form>

</body>
</html>