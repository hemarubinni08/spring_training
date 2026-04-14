<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #eef2ff, #f8fafc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            width: 420px;
            background: white;
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.12);
            animation: fadeIn 0.4s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #111827;
        }

        .msg {
            text-align: center;
            font-size: 13px;
            margin-bottom: 10px;
        }

        .error {
            color: #dc2626;
        }

        .success {
            color: #16a34a;
        }

        label {
            font-size: 13px;
            font-weight: 500;
            margin-top: 10px;
            display: block;
            color: #374151;
        }

        input {
            width: 100%;
            padding: 10px 12px;
            margin-top: 5px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            outline: none;
            transition: 0.2s;
            font-size: 14px;
        }

        input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,0.2);
        }

        .btn {
            width: 100%;
            margin-top: 15px;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(90deg, #4f46e5, #6366f1);
            color: white;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn:hover {
            transform: scale(1.02);
            opacity: 0.95;
        }

        .progress {
            height: 5px;
            background: #e5e7eb;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 15px;
        }

        .progress-bar {
            height: 5px;
            width: 0%;
            background: linear-gradient(90deg, #4f46e5, #22c55e);
            transition: width 0.3s;
        }

        .shake {
            animation: shake 0.3s;
        }

        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
            100% { transform: translateX(0); }
        }
    </style>
</head>

<body>

<div class="card" id="card">

    <h2>Edit Profile</h2>

    <c:if test="${not empty errorMessage}">
        <div class="msg error">${errorMessage}</div>
    </c:if>

    <c:if test="${not empty successMessage}">
        <div class="msg success">${successMessage}</div>
    </c:if>

    <div class="progress">
        <div class="progress-bar" id="progressBar"></div>
    </div>

    <form id="form"
          method="post"
          action="${pageContext.request.contextPath}/user/userProfileJdbc">

        <input type="hidden" name="id" value="${user.id}" />

        <label>Name</label>
        <input type="text" name="name" value="${user.name}" required oninput="updateProgress()" />

        <label>Email</label>
        <input type="email" name="email" value="${user.email}" required oninput="updateProgress()" />

        <label>Phone</label>
        <input type="text" name="phoneNo" value="${user.phoneNo}" oninput="updateProgress()" />

        <label>Username</label>
        <input type="text" name="userName" value="${user.userName}" required oninput="updateProgress()" />

        <button type="submit" class="btn">Update Profile</button>

    </form>

</div>

<script>
    function updateProgress() {
        let inputs = document.querySelectorAll("input[type='text'], input[type='email']");
        let filled = 0;

        inputs.forEach(i => {
            if (i.value.trim().length > 0) filled++;
        });

        let percent = (filled / inputs.length) * 100;
        document.getElementById("progressBar").style.width = percent + "%";
    }

    document.getElementById("form").addEventListener("submit", function(e) {
        let inputs = document.querySelectorAll("input[required]");
        let valid = true;

        inputs.forEach(i => {
            if (i.value.trim() === "") valid = false;
        });

        if (!valid) {
            e.preventDefault();
            document.getElementById("card").classList.add("shake");
            setTimeout(() => {
                document.getElementById("card").classList.remove("shake");
            }, 300);
        }
    });

    updateProgress();
</script>

</body>
</html>