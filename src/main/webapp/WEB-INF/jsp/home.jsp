<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>

    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            min-height: 100vh;
            background: radial-gradient(
                circle,
                #ffffff 0%,
                #b8b4ff 35%,
                #1900c1 100%
            );
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            width: 420px;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #1900c1;
            margin-bottom: 20px;
        }

        .list {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .list a {
            display: block;
            padding: 12px;
            background: #f4f4ff;
            color: #1900c1;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            text-align: center;
            transition: background 0.2s ease;
        }

        .list a:hover {
            background: #dcd9ff;
        }

        .empty-text {
            text-align: center;
            font-size: 14px;
            color: #777;
        }

        .logout-container {
            margin-top: 25px;
            text-align: center;
        }

        .logout-btn {
            width: 100%;
            padding: 12px;
            background: #1900c1;
            color: #fff;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .logout-btn:hover {
            background: #005A9E;
        }
    </style>
</head>

<body>

<div class="card">
    <h1>Home</h1>

    <c:choose>
        <c:when test="${not empty nodeDtos}">
            <div class="list">
                <c:forEach items="${nodeDtos}" var="nodeDto">
                    <a href="${pageContext.request.contextPath}/${nodeDto.path}">
                        ${nodeDto.name}
                    </a>
                </c:forEach>
            </div>
        </c:when>

        <c:otherwise>
            <div class="empty-text">
                No modules available
            </div>
        </c:otherwise>
    </c:choose>

    <div class="logout-container">
        <form action="${pageContext.request.contextPath}/logout" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
</div>

</body>
</html>