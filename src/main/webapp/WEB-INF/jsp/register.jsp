<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Register</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
*{ box-sizing:border-box; }

body{
    margin:0;
    font-family:Inter,sans-serif;
    background:#f4f7fb;
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
}

.container{
    width:560px;
    background:#fff;
    padding:32px;
    border-radius:16px;
    box-shadow:0 12px 35px rgba(0,0,0,0.08);
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

.field{ position:relative; }
.full{ grid-column:span 2; }

input, select{
    width:100%;
    padding:12px;
    border:1px solid #e5e7eb;
    border-radius:10px;
    font-size:14px;
    background:#fafafa;
    outline:none;
    transition:.2s;
}

input:focus, select:focus{
    background:#fff;
    border-color:#2563eb;
    box-shadow:0 0 0 3px rgba(37,99,235,.12);
}

label{
    position:absolute;
    top:10px;
    left:12px;
    font-size:12px;
    color:#6b7280;
    background:#fff;
    padding:0 4px;
    pointer-events:none;
    transition:.2s;
}

input:focus + label,
input:not(:placeholder-shown) + label,
select:focus + label,
select:valid + label{
    top:-8px;
    font-size:11px;
    color:#2563eb;
}

/* Multi-select tweak */
select[multiple]{
    min-height:120px;
    padding-top:16px;
}

.btn{
    grid-column:span 2;
    padding:12px;
    background:#2563eb;
    color:#fff;
    border:none;
    border-radius:10px;
    font-weight:600;
    cursor:pointer;
}

.btn:hover{ background:#1e40af; }

small{
    grid-column:span 2;
    color:#6b7280;
    font-size:12px;
}

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
    transition:.3s;
}
.toast.show{ opacity:1; }
.toast.success{ background:#16a34a; }
.toast.error{ background:#dc2626; }
</style>
</head>

<body>

<div id="toast" class="toast"></div>

<div class="container">
<h2>Create Account</h2>

<form:form method="post"
           action="${pageContext.request.contextPath}/user/register"
           modelAttribute="user"
           onsubmit="return validateForm(event);">

    <div class="field">
        <form:input path="name" id="name" placeholder=" "/>
        <label>Name</label>
    </div>

    <div class="field">
        <form:input path="email" id="email" placeholder=" "/>
        <label>Email</label>
    </div>

    <div class="field">
        <form:input path="phoneNo" id="phone" placeholder=" "/>
        <label>Phone</label>
    </div>

    <div class="field">
        <form:input path="userName" id="username" placeholder=" "/>
        <label>Username</label>
    </div>

    <div class="field">
        <form:input path="age" id="age" placeholder=" "/>
        <label>Age</label>
    </div>

    <!-- ✅ SINGLE ROLE -->
    <div class="field">
        <form:select path="role" id="role">
            <form:option value="" label=" "/>
            <c:forEach var="r" items="${roles}">
                <form:option value="${r.name}" label="${r.name}"/>
            </c:forEach>
        </form:select>
        <label>Primary Role</label>
    </div>

    <!-- ✅ MULTIPLE ROLES -->
    <div class="field">
        <form:select path="roles" id="roles" multiple="true">
            <c:forEach var="r" items="${roles}">
                <form:option value="${r.name}"/>
            </c:forEach>
        </form:select>
        <label>Additional Roles</label>
    </div>

    <small>
        Hold Ctrl (Windows) or Cmd (Mac) to select multiple roles
    </small>

    <div class="field full">
        <form:password path="password" id="password" placeholder=" "/>
        <label>Password</label>
    </div>

    <button type="submit" class="btn">Register</button>
</form:form>
</div>

<script>
function showToast(msg,type="error"){
    const t=document.getElementById("toast");
    t.innerText=msg;
    t.className="toast show "+type;
    setTimeout(()=>t.className="toast",2500);
}

function validateForm(e){
    const ids=["name","email","phone","username","age","password"];
    for(let i of ids){
        if(document.getElementById(i).value.trim()===""){
            e.preventDefault();
            showToast("Please fill all fields","error");
            return false;
        }
    }

    if(document.getElementById("role").value===""){
        e.preventDefault();
        showToast("Select a primary role","error");
        return false;
    }

    if(document.getElementById("roles").selectedOptions.length===0){
        e.preventDefault();
        showToast("Select at least one additional role","error");
        return false;
    }

    showToast("Registration successful","success");
    return true;
}
</script>

</body>
</html>