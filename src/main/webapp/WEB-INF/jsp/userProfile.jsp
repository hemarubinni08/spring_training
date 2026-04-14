<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<style>
*{ box-sizing:border-box; }

body {
    font-family: 'Inter', sans-serif;
    margin: 0;
    background: linear-gradient(135deg, #eef2ff, #f8fafc);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* CARD */
.card {
    width: 460px;
    background: white;
    padding: 28px;
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
    margin-bottom: 18px;
    color: #111827;
}

/* MESSAGES */
.msg {
    text-align: center;
    font-size: 13px;
    margin-bottom: 10px;
}
.error { color: #dc2626; }
.success { color: #16a34a; }

/* PROGRESS BAR */
.progress {
    height: 5px;
    background: #e5e7eb;
    border-radius: 10px;
    overflow: hidden;
    margin-bottom: 18px;
}

.progress-bar {
    height: 5px;
    width: 0%;
    background: linear-gradient(90deg, #4f46e5, #22c55e);
    transition: width 0.3s;
}

/* FORM */
.field {
    position: relative;
    margin-bottom: 16px;
}

input, select {
    width: 100%;
    padding: 12px;
    border: 1px solid #e5e7eb;
    border-radius: 10px;
    font-size: 14px;
    background: #fafafa;
    outline: none;
    transition: 0.2s;
}

input:focus, select:focus {
    background: #fff;
    border-color: #6366f1;
    box-shadow: 0 0 0 3px rgba(99,102,241,0.15);
}

/* FLOAT LABEL (INPUT ONLY) */
label {
    position: absolute;
    top: 10px;
    left: 12px;
    font-size: 12px;
    color: #6b7280;
    background: white;
    padding: 0 4px;
    pointer-events: none;
    transition: 0.2s;
}

input:focus + label,
input:not(:placeholder-shown) + label {
    top: -8px;
    font-size: 11px;
    color: #4f46e5;
}

/* SELECT FIX (NO FLOATING LABEL BUG) */
.select-label {
    font-size: 12px;
    font-weight: 600;
    color: #6b7280;
    margin-bottom: 6px;
    display: block;
}

/* BUTTON */
.btn {
    width: 100%;
    margin-top: 10px;
    padding: 12px;
    border: none;
    border-radius: 10px;
    background: linear-gradient(90deg, #4f46e5, #6366f1);
    color: white;
    font-weight: 600;
    cursor: pointer;
    transition: 0.2s;
}

.btn:hover {
    transform: translateY(-1px);
    opacity: 0.95;
}

/* SHAKE */
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

    <!-- NAME -->
    <div class="field">
        <input type="text" name="name" value="${user.name}" placeholder=" " required oninput="updateProgress()" />
        <label>Name</label>
    </div>

    <!-- EMAIL -->
    <div class="field">
        <input type="email" name="email" value="${user.email}" placeholder=" " required oninput="updateProgress()" />
        <label>Email</label>
    </div>

    <!-- PHONE -->
    <div class="field">
        <input type="text" name="phoneNo" value="${user.phoneNo}" placeholder=" " oninput="updateProgress()" />
        <label>Phone</label>
    </div>

    <!-- USERNAME -->
    <div class="field">
        <input type="text" name="userName" value="${user.userName}" placeholder=" " required oninput="updateProgress()" />
        <label>Username</label>
    </div>

    <!-- ROLE (PROPER UI FIXED) -->
    <div class="field">
        <span class="select-label">Role</span>

        <select name="role" id="role" required onchange="updateProgress()">
            <option value="">Select role</option>

            <c:forEach var="r" items="${roles}">
                <option value="${r.name}"
                    <c:if test="${user.role == r.name}">selected</c:if>>
                    ${r.name}
                </option>
            </c:forEach>
        </select>
    </div>

    <button type="submit" class="btn">Update Profile</button>

</form>

</div>

<script>
function updateProgress() {
    let inputs = document.querySelectorAll("input[required], select[required]");
    let filled = 0;

    inputs.forEach(i => {
        if (i.value.trim() !== "") filled++;
    });

    let percent = (filled / inputs.length) * 100;
    document.getElementById("progressBar").style.width = percent + "%";
}

document.getElementById("form").addEventListener("submit", function(e) {
    let inputs = document.querySelectorAll("input[required], select[required]");
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