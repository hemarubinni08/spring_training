<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Node Management</title>
    <style>
        :root {
            --primary: #4361ee;
            --danger: #ef233c;
            --bg-gradient: radial-gradient(circle, #ffffff 0%, #e0e7ff 35%, #4361ee 100%);
            --glass: rgba(255, 255, 255, 0.95);
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            min-height: 100vh;
            background: var(--bg-gradient);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: var(--glass);
            width: 90%;
            max-width: 800px;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            backdrop-filter: blur(10px);
        }

        h2 {
            margin-top: 0;
            color: #2b2d42;
            font-weight: 600;
            border-left: 5px solid var(--primary);
            padding-left: 15px;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
            background: white;
            border-radius: 8px;
            overflow: hidden; /* Ensures corners are rounded */
        }

        thead {
            background-color: #f8f9fa;
            border-bottom: 2px solid #edf2f7;
        }

        th {
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
            color: #64748b;
            padding: 15px;
            text-align: left;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #edf2f7;
            color: #334155;
            font-size: 0.95rem;
        }

        tr:hover {
            background-color: #f1f5ff;
            transition: 0.2s;
        }

        /* Action Links */
        .id-link {
            color: var(--primary);
            text-decoration: none;
            font-weight: bold;
        }

        .delete-link {
            color: var(--danger);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.9rem;
        }

        .delete-link:hover {
            text-decoration: underline;
        }

        /* Add Button */
        .button-style {
            display: inline-block;
            padding: 12px 24px;
            background-color: var(--primary);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            box-shadow: 0 4px 6px rgba(67, 97, 238, 0.3);
            transition: transform 0.2s, background 0.3s;
        }

        .button-style:hover {
            background-color: #3046c9;
            transform: translateY(-2px);
        }
        .button-container
        {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
        }
        .button-secondary
        {
        background-color: #64748b;
        }
        .button-secondary:hover
        {
        background-color: #475569;
        }
        .button-style:hover {
                    background-color: #3046c9;
                    transform: translateY(-2px);
                }
    </style>
</head>

<body>
<div class="container">
    <h2>Registered Nodes</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Node Name</th>
                <th>Path</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${nodes}" var="node">
                <tr>
                    <td>
                        <a class="id-link" href="/node/updatenode?id=${node.id}">${node.id}</a>
                    </td>
                    <td>${node.name}</td>
                    <td>${node.path}</td>
                    <td>
                        <a class="delete-link" href="/node/deletenode?id=${node.id}"
                           onclick="return confirm('Delete this node permanently?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="button-container">
    <a class="button-style" href="/node/addnode">+ Add New Node</a>
    <a class="button-style button-secondary" href="/">Home</a>
    </div>
</div>

<c:if test="${not empty msg}">
    <script type="text/javascript">
        alert("${msg}");
    </script>
</c:if>
</body>
</html>
