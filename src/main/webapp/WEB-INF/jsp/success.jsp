<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Success</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
            margin: 0; padding: 0; text-align: center;
        }
        .box {
            margin: 100px auto; padding: 40px;
            background: #fff; border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            width: 500px; animation: fadeIn 0.8s ease-in-out;
        }
        h2 { color: #4CAF50; font-size: 28px; margin-bottom: 20px; }
        p  { font-size: 18px; color: #333; }
        .btn {
            display: inline-block; margin-top: 20px;
            padding: 12px 25px; background: #4CAF50;
            color: #fff; text-decoration: none;
            border-radius: 8px; transition: background 0.3s ease;
        }
        .btn:hover { background: #45a049; }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to   { opacity: 1; transform: scale(1); }
        }
    </style>
    <script>
        setTimeout(function(){
            window.location.href = '<c:url value="/user/register"/>';  <%-- ✅ fixed --%>
        }, 5000);
    </script>
</head>
<body>
<div class="box">
    <h2>🎉 Registration Successful!</h2>
    <p>Welcome, <strong>${userName}</strong>!</p>               <%-- ✅ fixed --%>
    <p>${successMessage}</p>
    <p>You will be redirected in 5 seconds...</p>
    <a href="<c:url value='/user/register'/>" class="btn">Go Back</a> <%-- ✅ fixed --%>
</div>
</body>
</html>