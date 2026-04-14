<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Node Management (JPA)</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f4f6f9;
            margin: 0;
            color: #1f2937;
            padding: 30px;
        }

        .back-arrow {
            position: fixed;
            top: 18px;
            left: 18px;
            width: 42px;
            height: 42px;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
            text-decoration: none;
            font-size: 20px;
            color: #4f46e5;
            transition: 0.2s;
        }

        .back-arrow:hover {
            transform: translateX(-3px);
            background: #eef2ff;
        }

        .container {
            max-width: 1100px;
            margin: 60px auto 0;
        }

        .card {
            background: #ffffff;
            padding: 20px;
            border-radius: 14px;
            margin-bottom: 25px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        }

        h2 {
            color: #111827;
            margin-bottom: 15px;
            font-weight: 600;
        }

        input {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #e5e7eb;
            width: 260px;
            margin-right: 10px;
            outline: none;
            transition: 0.2s;
        }

        input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,0.2);
        }

        button {
            padding: 10px 16px;
            border-radius: 8px;
            background: linear-gradient(90deg, #4f46e5, #6366f1);
            border: none;
            color: white;
            cursor: pointer;
            font-weight: 600;
            transition: 0.2s;
        }

        button:hover {
            transform: scale(1.02);
        }

        .success {
            background: #dcfce7;
            color: #166534;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            overflow: hidden;
            border-radius: 12px;
        }

        th {
            background: linear-gradient(90deg, #4f46e5, #6366f1);
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background: #f9fafb;
        }

        .edit-btn {
            background: #3b82f6;
            color: white;
            border: none;
            padding: 6px 10px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            margin-right: 6px;
        }

        .edit-btn:hover {
            background: #2563eb;
        }

        .delete-link {
            color: #ef4444;
            text-decoration: none;
            font-weight: 500;
        }

        .delete-link:hover {
            text-decoration: underline;
        }
    </style>

    <script>
        function editNode(id, name, path) {
            document.getElementById("nodeId").value = id;
            document.getElementById("nodeName").value = name;
            document.getElementById("nodePath").value = path;

            document.getElementById("nodeForm").action =
                "${pageContext.request.contextPath}/node/updateNode";

            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    </script>
</head>

<body>

<a class="back-arrow" href="${pageContext.request.contextPath}/">
    ←
</a>

<div class="container">

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

            <input type="text" id="nodeName" name="name"
                   value="${node.name}" placeholder="Node Name" required />

            <input type="text" id="nodePath" name="path"
                   value="${node.path}" placeholder="Node Path" required />

            <button type="submit">Save Node</button>
        </form>
    </div>

    <div class="card">
        <h2>All Nodes</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Path</th>
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

</div>

</body>
</html>