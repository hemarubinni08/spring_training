<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

<style>
body {
    background-color: cyan;
}

.login-card {
    max-width: 400px;
    margin: 80px auto;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    background: white;
}
</style>
</head>

<body>

<div class="login-card">
    <h3 class="text-center mb-4">User Login</h3>

    <!-- Error Message -->
    <%
    String message = (String) request.getAttribute("message");
    if(message != null && !message.isEmpty()) { %>
        <div id="loginErrorAlert" class="alert alert-danger text-center rounded-pill">
            <%= message %>
        </div>
    <% } %>

    <form action="/user/login" method="post" modelAttribute="userDto">

        <div class="form-group">
            <label>Email</label>
            <input type="email"
                   class="form-control"
                   name="email"
                   placeholder="Enter email"
                   required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password"
                   class="form-control"
                   name="password"
                   placeholder="Enter password"
                   required>
        </div>

        <button type="submit" class="btn btn-primary btn-block">
            Login
        </button>

        <div class="text-center mt-3">
            <small>Don't have an account?</small>
            <a href="/user/register" class="btn btn-sm">
                Register
            </a>
        </div>
    </form>
</div>

<script>
setTimeout(function() {
    var alertBox = document.getElementById("loginErrorAlert");
    if(alertBox) {
        alertBox.style.transition = "opacity 0.5s";
        alertBox.style.opacity = "0";
        setTimeout(() => alertBox.remove(), 500);
    }
}, 3000);
</script>
</body>
</html>