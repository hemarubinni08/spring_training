<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>POS App</title>
    <style>
        :root {
            --primary: #4361ee;
            --accent: #3a0ca3;
            --bg-gradient: linear-gradient(135deg, #0f172a 0%, #1e293b 40%, #4361ee 100%);
            --glass: rgba(255, 255, 255, 0.08);
            --text-light: #f8fafc;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            min-height: 100vh;
            background: var(--bg-gradient);
            display: flex;
            color: var(--text-light);
        }

        .sidebar {
            width: 260px;
            background: var(--glass);
            backdrop-filter: blur(20px);
            border-right: 1px solid rgba(255,255,255,0.1);
            padding: 30px 20px;
            display: flex;
            flex-direction: column;
        }

        .sidebar h3 a {
            text-decoration: none;
            color: var(--primary);
            font-weight: 700;
            font-size: 1.3rem;
            letter-spacing: 1px;
        }

        .sidebar a {
            display: block;
            padding: 12px 18px;
            margin-bottom: 12px;
            border-radius: 10px;
            text-decoration: none;
            color: var(--text-light);
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .sidebar a:hover {
            background: rgba(67,97,238,0.2);
            color: #ffffff;
            transform: translateX(6px);
        }

        .main {
            flex: 1;
            padding: 40px;
        }

        .content-box {
            background: var(--glass);
            padding: 60px;
            border-radius: 20px;
            backdrop-filter: blur(25px);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4);
            text-align: center;
        }
        .sidebar-nav {
            flex: 1;
        }

        .logout-btn {
            margin-top: auto; /* Forces button to bottom */
            background: rgba(239, 68, 68, 0.1);
            color: #f87171 !important;
            border: 1px solid rgba(239, 68, 68, 0.2);
        }

        .logout-btn:hover {
            background: #ef4444 !important;
            color: white !important;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3><a href="/">POS Navigation</a></h3>
        <c:forEach items="${nodes}" var="node">
            <a href="${node.path}">${node.name}</a>
        </c:forEach>
        <a href="/logout" class="logout-btn">Logout</a>
    </div>

    <div class="main">
        <div id="content" class="content-box">
            <h1>Welcome to Your POS System</h1>
            <p>Smart, fast, and professional management at your fingertips.</p>
        </div>
    </div>

    <c:if test="${not empty msg}">
        <script type="text/javascript">
            alert("${msg}");
        </script>
    </c:if>
</body>
</html>
