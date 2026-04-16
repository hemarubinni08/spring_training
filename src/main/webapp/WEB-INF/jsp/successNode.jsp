<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Success</title>

    <style>
        * {
            box-sizing: border-box;
        }

        /* BODY */
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background-color: #eef2f7;
            font-family: Arial, Helvetica, sans-serif;
            display: flex;
            flex-direction: column;
        }

        /* HEADER (same as dashboard) */
        .header {
            height: 55px;
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #2c3e50;
            font-weight: bold;
            position: relative;
        }

        /* HOME BUTTON */
        .home-btn {
            position: absolute;
            left: 20px;
            padding: 8px 14px;
            background-color: #2c3e50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .home-btn:hover {
            opacity: 0.9;
        }

        /* CARD */
        .container {
            width: 380px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            margin: auto;
            text-align: center;
        }

        /* SUCCESS TEXT */
        h3 {
            color: #28a745;
            margin-bottom: 15px;
        }

        p {
            color: #2c3e50;
            font-size: 14px;
        }

        /* BUTTON GROUP */
        .btn-group {
            margin-top: 20px;
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
        }

        .back-btn {
            background-color: #34495e;
        }

        .list-btn {
            background-color: #2c3e50;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <a href="${pageContext.request.contextPath}/" class="home-btn">Home</a>
    Node
</div>

<!-- SUCCESS CARD -->
<div class="container">
    <h3>Node Added Successfully ✅</h3>

    <p>
        Node Name: <strong>${node.name}</strong>
    </p>

    <!-- BUTTONS -->
    <div class="btn-group">
        <button class="btn back-btn" onclick="history.back()">Back</button>

        <a href="${pageContext.request.contextPath}/node/list" class="btn list-btn">
            View Nodes
        </a>
    </div>
</div>

</body>
</html>