<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Node List</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            margin: 40px auto;
            background-color: #ffffff;
            padding: 25px;
            border-radius: 6px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #2c3e50;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #34495e;
            color: #ffffff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #eef6f5;
        }

        a {
            color: #0066cc;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .action-links a {
            margin-right: 10px;
            color: #e74c3c;
        }

        .footer {
            margin-top: 25px;
            text-align: right;
        }

        .add-btn {
            background-color: #1abc9c;
            color: white;
            padding: 8px 14px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
        }

        .add-btn:hover {
            background-color: #16a085;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Node List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Node Name</th>
            <th>Path</th>
            <th>Roles</th>
            <th>Actions</th>

        </tr>

        <c:forEach var="node" items="${nodeDto}">
            <tr>
                <!-- ID (Clickable for Edit/View) -->
                <td>
                    <a href="${pageContext.request.contextPath}/node/getNodeDetails/${node.id}">
                        ${node.id}
                    </a>
                </td>

                <!-- Node Name -->
                <td>${node.name}</td>

                <!-- Path -->
                <td>${node.path}</td>
                <td>${node.roles}</td>

                <!-- Actions -->
                <td class="action-links">
                    <a href="${pageContext.request.contextPath}/node/deleteNodeJpa?id=${node.id}"
                       onclick="return confirm('Are you sure you want to delete this node?');">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>

    </table>

    <div class="footer">
        <a class="add-btn" href="${pageContext.request.contextPath}/node/addNodeJpa">
              Add New Node
        </a>
    </div>
   <div class="action-buttons">
       <a href="/" class="home-btn">Home</a>
   </div>
</div>

</body>
</html>