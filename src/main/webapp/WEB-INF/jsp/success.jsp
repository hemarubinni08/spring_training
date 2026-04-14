<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Success</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
*{
box-sizing:border-box;
}

body{
margin:0;
font-family:Inter;
background:#f4f7fb;
display:flex;
justify-content:center;
align-items:center;
min-height:100vh;
}

/* CARD */
.container{
width:420px;
background:#fff;
padding:32px;
border-radius:16px;
box-shadow:0 12px 35px rgba(0,0,0,0.08);
text-align:center;
animation:pop 0.5s ease;
}

/* ANIMATION */
@keyframes pop{
from{
opacity:0;
transform:translateY(15px) scale(0.98);
}
to{
opacity:1;
transform:translateY(0) scale(1);
}
}

/* SUCCESS ICON */
.icon{
width:70px;
height:70px;
margin:0 auto 15px;
border-radius:50%;
background:#e0f2fe;
display:flex;
align-items:center;
justify-content:center;
}

.icon svg{
width:34px;
height:34px;
fill:#2563eb;
}

/* TITLE */
h2{
margin:10px 0;
color:#16a34a;
font-weight:700;
}

/* TEXT */
p{
color:#6b7280;
font-size:14px;
margin-bottom:20px;
}

/* BUTTONS */
.btn{
display:block;
width:100%;
padding:12px;
border-radius:10px;
text-decoration:none;
font-weight:600;
transition:0.2s;
}

.primary{
background:#2563eb;
color:#fff;
}

.primary:hover{
background:#1e40af;
transform:translateY(-1px);
}

.secondary{
margin-top:10px;
background:#eef2ff;
color:#2563eb;
}

.secondary:hover{
background:#dbeafe;
}
</style>
</head>

<body>

<div class="container">

<!-- ICON -->
<div class="icon">
<svg viewBox="0 0 24 24">
<path d="M9 16.2l-3.5-3.5L4 14.2 9 19l12-12-1.5-1.5z"/>
</svg>
</div>

<h2>Registration Successful</h2>

<p>
User <b>${user.name}</b> has been created successfully.
</p>

<a class="btn primary"
href="${pageContext.request.contextPath}/">
Go to Dashboard
</a>

<a class="btn secondary"
href="${pageContext.request.contextPath}/user/register">
Create Another User
</a>

</div>

</body>
</html>