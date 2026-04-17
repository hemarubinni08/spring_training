<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Nodes</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        body {
            margin: 0;
            padding: 30px;
            font-family: Arial, Helvetica, sans-serif;
            color: #e0e0e0;
            background:
                radial-gradient(circle at top left,
                    rgba(255,255,255,0.08),
                    rgba(0,0,0,0.9) 60%),
                linear-gradient(120deg,#0f2027,#203a43,#2c5364);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            width: 700px;
            padding: 30px;
            background: rgba(25,25,25,0.95);
            border-radius: 14px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.6);
        }

        h2 {
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
            color: #ffffff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 14px;
            border: 1px solid #333;
            font-size: 14px;
            text-align: left;
        }

        th {
            background: linear-gradient(135deg,#1f1f1f,#2b2b2b);
            color: #ffffff;
            text-transform: uppercase;
            font-size: 13px;
        }

        tr:nth-child(even) {
            background-color: #1c1c1c;
        }

        tr:hover {
            background-color: #252525;
        }

        a {
            color: #4da6ff;
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            color: #80c1ff;
            text-decoration: underline;
        }

        .actions a {
            margin-right: 14px;
            font-size: 16px;
        }

        .delete {
            color: #ff6b6b;
        }

        .delete:hover {
            color: #ff9a9a;
        }

        .back {
            display: inline-block;
            margin-bottom: 16px;
            color: #4da6ff;
            font-size: 14px;
        }
        .add-btn-container {
            margin-top: 25px;
            text-align: center;
        }

        .add-btn {
            display: inline-block;
            padding: 12px 28px;
            background: linear-gradient(135deg, #4da6ff, #6c8cff);
            color: #fff;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            box-shadow: 0 6px 18px rgba(0,0,0,0.4);
            transition: all 0.3s ease;
        }

        .add-btn i {
            margin-right: 8px;
        }

        .add-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 24px rgba(0,0,0,0.55);
            background: linear-gradient(135deg, #6fb6ff, #8aa2ff);
        }
    </style>
</head>

<body>

<div class="card">

    <a class="back" href="${pageContext.request.contextPath}/">
        ← Back to Home
    </a>

    <h2>Nodes List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Path</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="node" items="${nodes}">
            <tr>
                <td>
                    <a href="${pageContext.request.contextPath}/node/getNode/${node.id}">
                        ${node.id}
                    </a>
                </td>

                <td>${node.name}</td>
                <td>${node.path}</td>

                <td class="actions">
                    <a href="${pageContext.request.contextPath}/node/getNode/${node.id}" title="Edit">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </a>

                    <a href="${pageContext.request.contextPath}/node/deleteNode/${node.id}"
                       class="delete"
                       title="Delete">
                        <i class="fa-solid fa-trash"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>

<div class="add-btn-container">
    <a href="${pageContext.request.contextPath}/node/addNode"
       class="id fa-plus"></i>
        Add Node
    </a>
</div>


</div>

</body>
</html>
