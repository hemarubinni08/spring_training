<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Register</title>

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
width:460px;
background:#fff;
padding:30px;
border-radius:16px;
box-shadow:0 12px 35px rgba(0,0,0,0.08);
animation:fade 0.4s ease;
}

@keyframes fade{
from{opacity:0; transform:translateY(10px);}
to{opacity:1; transform:translateY(0);}
}

h2{
text-align:center;
color:#2563eb;
margin-bottom:20px;
font-weight:700;
}

/* FORM GRID */
form{
display:grid;
grid-template-columns:1fr 1fr;
gap:14px;
}

.field{
position:relative;
}

.full{
grid-column:span 2;
}

input{
width:100%;
padding:12px;
border:1px solid #e5e7eb;
border-radius:10px;
font-size:14px;
background:#fafafa;
outline:none;
transition:0.2s;
}

input:focus{
background:#fff;
border-color:#2563eb;
box-shadow:0 0 0 3px rgba(37,99,235,0.12);
}

label{
position:absolute;
top:10px;
left:12px;
font-size:12px;
color:#6b7280;
background:white;
padding:0 4px;
pointer-events:none;
transition:0.2s;
}

input:focus + label,
input:not(:placeholder-shown) + label{
top:-8px;
font-size:11px;
color:#2563eb;
}

/* BUTTON */
.btn{
grid-column:span 2;
padding:12px;
background:#2563eb;
color:#fff;
border:none;
border-radius:10px;
font-weight:600;
cursor:pointer;
transition:0.2s;
}

.btn:hover{
background:#1e40af;
transform:translateY(-1px);
}

/* TOAST */
.toast{
position:fixed;
top:20px;
right:20px;
background:#111827;
color:#fff;
padding:12px 16px;
border-radius:10px;
font-size:13px;
opacity:0;
transform:translateY(-10px);
transition:0.3s;
z-index:999;
}

.toast.show{
opacity:1;
transform:translateY(0);
}

.toast.success{
background:#16a34a;
}

.toast.error{
background:#dc2626;
}
</style>

</head>

<body>

<div class="toast" id="toast"></div>

<div class="container">

<h2>Create Account</h2>

<c:if test="${not empty errorMessage}">
<script>
window.onload = () => showToast("${errorMessage}", "error");
</script>
</c:if>

<form:form method="post"
action="${pageContext.request.contextPath}/user/register"
modelAttribute="user"
onsubmit="return validateForm(event);">

<div class="field">
<form:input path="name" placeholder=" " id="name"/>
<label>Name</label>
</div>

<div class="field">
<form:input path="email" placeholder=" " id="email"/>
<label>Email</label>
</div>

<div class="field">
<form:input path="phoneNo" placeholder=" " id="phone"/>
<label>Phone</label>
</div>

<div class="field">
<form:input path="userName" placeholder=" " id="username"/>
<label>Username</label>
</div>

<div class="field full">
<form:input path="age" placeholder=" " id="age"/>
<label>Age</label>
</div>

<div class="field full">
<form:password path="password" placeholder=" " id="password"/>
<label>Password</label>
</div>

<button class="btn" type="submit">Register</button>

</form:form>

</div>

<script>
function showToast(message,type="error"){
const toast=document.getElementById("toast");
toast.innerText=message;
toast.className="toast show "+type;

setTimeout(()=>{
toast.className="toast";
},2500);
}

/* CLEAN VALIDATION (NO RED BORDERS) */
function validateForm(event){

const fields = ["name","email","phone","username","age","password"];

for(let id of fields){
let el=document.getElementById(id);
if(!el || el.value.trim()===""){
event.preventDefault();
showToast("Please fill all fields properly","error");
return false;
}
}

let email=document.getElementById("email").value;
if(!email.includes("@")){
event.preventDefault();
showToast("Enter a valid email","error");
return false;
}

showToast("Validation passed","success");
return true;
}

/* FIX AGE DEFAULT 0 ISSUE */
document.addEventListener("DOMContentLoaded",()=>{
let age=document.getElementById("age");
if(age.value==="0"){
age.value="";
}
});
</script>

</body>
</html>