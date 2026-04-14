<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Register</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
*{box-sizing:border-box;}

body{
margin:0;
font-family:Inter;
background:#f4f7fb;
display:flex;
justify-content:center;
align-items:center;
min-height:100vh;
}

.container{
width:520px;
background:#fff;
padding:32px;
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
margin-bottom:22px;
font-weight:700;
}

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

/* INPUT + SELECT UNIFIED STYLE */
input, select{
width:100%;
padding:12px;
border:1px solid #e5e7eb;
border-radius:10px;
font-size:14px;
background:#fafafa;
outline:none;
transition:0.2s;
appearance:none;
}

input:focus, select:focus{
background:#fff;
border-color:#2563eb;
box-shadow:0 0 0 3px rgba(37,99,235,0.12);
}

/* FLOATING LABEL (WORKS FOR INPUT ONLY) */
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

/* INPUT LABEL ANIMATION */
input:focus + label,
input:not(:placeholder-shown) + label{
top:-8px;
font-size:11px;
color:#2563eb;
}

/* SELECT FIX (NO PLACEHOLDER, SAME LOOK AS INPUT) */
select{
color:#111827;
}

/* make select behave like input label system */
select:valid + label,
select:focus + label{
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

.toast.success{background:#16a34a;}
.toast.error{background:#dc2626;}
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

<!-- NAME -->
<div class="field">
<form:input path="name" id="name" placeholder=" "/>
<label>Name</label>
</div>

<!-- EMAIL -->
<div class="field">
<form:input path="email" id="email" placeholder=" "/>
<label>Email</label>
</div>

<!-- PHONE -->
<div class="field">
<form:input path="phoneNo" id="phone" placeholder=" "/>
<label>Phone</label>
</div>

<!-- USERNAME -->
<div class="field">
<form:input path="userName" id="username" placeholder=" "/>
<label>Username</label>
</div>

<!-- AGE -->
<div class="field">
<form:input path="age" id="age" placeholder=" "/>
<label>Age</label>
</div>

<!-- ROLE (NOW SAME STYLE AS INPUT) -->
<div class="field">
<form:select path="role" id="role">
    <form:option value="" label=" "/>
    <c:forEach var="r" items="${roles}">
        <form:option value="${r.name}" label="${r.name}"/>
    </c:forEach>
</form:select>
<label>Role</label>
</div>

<!-- PASSWORD -->
<div class="field full">
<form:password path="password" id="password" placeholder=" "/>
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

setTimeout(()=>toast.className="toast",2500);
}

function validateForm(event){

const fields=["name","email","phone","username","age","password","role"];

for(let id of fields){
let el=document.getElementById(id);
if(!el || el.value.trim()===""){
event.preventDefault();
showToast("Please fill all fields","error");
return false;
}
}

let email=document.getElementById("email").value;
if(!email.includes("@")){
event.preventDefault();
showToast("Enter valid email","error");
return false;
}

showToast("Registration successful","success");
return true;
}

/* FIX AGE DEFAULT 0 */
document.addEventListener("DOMContentLoaded",()=>{
let age=document.getElementById("age");
if(age.value==="0"){
age.value="";
}
});
</script>

</body>
</html>