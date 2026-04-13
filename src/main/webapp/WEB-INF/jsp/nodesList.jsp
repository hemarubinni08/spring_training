<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Node Management</title>

    <style>
        /* (same CSS as yours – unchanged) */
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-image: linear-gradient(-225deg, #B7F8DB 0%, #50A7C2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 900px;
            background: #ffffff;
            padding: 30px;
            border-radius: 28px;
            box-shadow: 0 18px 35px rgba(0,0,0,0.15);
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
        }

        .add-node {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 25px;
        }

        .add-node input {
            width: 220px;
            padding: 9px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .btn-add {
            padding: 9px 22px;
            border-radius: 20px;
            border: none;
            background: linear-gradient(120deg, #36d1dc, #5b86e5);
            color: white;
            cursor: pointer;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        thead {
            background: linear-gradient(120deg, #1d2b64, #6dd5ed);
            color: white;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #eee;
        }

        .btn-view {
            padding: 6px 16px;
            border-radius: 18px;
            text-decoration: none;
            color: white;
            background: linear-gradient(120deg, #36d1dc, #5b86e5);
        }

        .btn-delete {
            background: linear-gradient(120deg, #ff416c, #ff4b2b);
        }

        .toast {
            position: fixed;
            top: 20px;
            right: -400px;
            padding: 14px 20px;
            border-radius: 12px;
            color: #fff;
            font-weight: 600;
            opacity: 0;
            transition: all 0.5s ease;
        }

        .toast-success {
            background: linear-gradient(120deg, #22c55e, #16a34a);
        }

        .toast-error {
            background: linear-gradient(120deg, #ef4444, #dc2626);
        }

        .toast.show {
            right: 20px;
            opacity: 1;
        }
    </style>
</head>

<body>

<!-- ✅ Toast -->
<c:set var="toastClass" value="${colour eq 'red' ? 'toast-error' : 'toast-success'}"/>
<c:if test="${not empty message}">
    <div id="toast" class="toast ${toastClass}">
        ${message}
    </div>
</c:if>

<div class="container">
    <h1>Node Management</h1>

    <!-- ✅ Add Node -->
    <form action="${pageContext.request.contextPath}/node/addNode"
          method="post"
          class="add-node">
        <input type="text" name="name" placeholder="Node name" required />
        <input type="text" name="path" placeholder="Node path" required />
        <button type="submit" class="btn-add">Add Node</button>
    </form>

    <!-- ✅ Node List -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Path</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="node" items="${nodesList}">
                <tr>
                    <td>${node.id}</td>
                    <td>${node.name}</td>
                    <td>${node.path}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/node/nodeProfile/${node.id}"
                           class="btn-view">View / Edit</a>

                        <a href="${pageContext.request.contextPath}/node/deletenode/${node.id}"
                           class="btn-view btn-delete"
                           onclick="return confirm('Delete this node?')">
                           Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const toast = document.getElementById("toast");
        if (toast) {
            setTimeout(() => toast.classList.add("show"), 200);
            setTimeout(() => toast.classList.remove("show"), 3200);
            setTimeout(() => toast.remove(), 3800);
        }
    });
</script>

</body>
</html>