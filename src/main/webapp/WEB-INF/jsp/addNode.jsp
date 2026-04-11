<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Node Management (JPA)</title>

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #0f172a;
            color: #e5e7eb;
            padding: 30px;
        }

        .card {
            background: #111827;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.4);
        }

        h2 {
            color: #22d3ee;
            margin-bottom: 15px;
        }

        input {
            padding: 10px;
            border-radius: 6px;
            border: none;
            width: 260px;
        }

        button {
            padding: 10px 18px;
            border-radius: 6px;
            background: #22d3ee;
            border: none;
            color: #000;
            cursor: pointer;
            font-weight: 600;
        }

        .success {
            background: #064e3b;
            color: #34d399;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 10px;
        }

        .error {
            background: #7f1d1d;
            color: #f87171;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #334155;
            text-align: left;
        }

        th {
            color: #38bdf8;
        }

        .edit-btn {
            background: #0ea5e9;
            padding: 6px 12px;
            border-radius: 4px;
            color: #000;
            border: none;
            cursor: pointer;
            margin-right: 6px;
            font-weight: 600;
        }

        .delete-link {
            color: #f87171;
            text-decoration: none;
            font-weight: 600;
        }
    </style>

    <script>
        function editNode(id, name, path) {
            document.getElementById("nodeId").value = id;
            document.getElementById("nodeName").value = name;
            document.getElementById("nodePath").value = path;

            document.getElementById("nodeForm").action =
                "${pageContext.request.contextPath}/node/updateNode";
        }
    </script>
</head>

<body>

<div class="card">
    <h2>Add / Update Node</h2>

    <c:if test="${not empty successMessage}">
        <div class="success">${successMessage}</div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <form id="nodeForm"
          action="${pageContext.request.contextPath}/node/addnodes"
          method="post">

        <input type="hidden" id="nodeId" name="id" value="${node.id}" />

        <input type="text"
               id="nodeName"
               name="name"
               value="${node.name}"
               placeholder="Enter Node Name"
               required />

        <input type="text"
               id="nodePath"
               name="path"
               value="${node.path}"
               placeholder="Enter Node Path"
               required />

        <button type="submit">Save Node</button>
    </form>
</div>

<div class="card">
    <h2>All Nodes</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Node Name</th>
            <th>Node Path</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="n" items="${nodes}">
            <tr>
                <td>${n.id}</td>
                <td>${n.name}</td>
                <td>${n.path}</td>
                <td>
                    <button class="edit-btn"
                            onclick="editNode('${n.id}','${n.name}','${n.path}')">
                        Edit
                    </button>

                    <a class="delete-link"
                       href="${pageContext.request.contextPath}/node/deleteNode/${n.id}">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>