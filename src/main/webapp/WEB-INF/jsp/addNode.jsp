<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Node Management</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<style>
body{
    margin:0;
    font-family:Inter,sans-serif;
    background:#f4f6f9;
    color:#1f2937;
}

.back-arrow{
    position:fixed;
    top:16px;
    left:16px;
    width:42px;
    height:42px;
    background:#fff;
    border-radius:10px;
    display:flex;
    align-items:center;
    justify-content:center;
    text-decoration:none;
    color:#4f46e5;
    font-size:20px;
    box-shadow:0 4px 15px rgba(0,0,0,0.12);
}

.container{
    max-width:1100px;
    margin:60px auto;
    padding:0 20px;
}

.card{
    background:#fff;
    padding:25px;
    border-radius:12px;
    box-shadow:0 8px 25px rgba(0,0,0,0.08);
    margin-bottom:20px;
}

h2{
    margin-bottom:15px;
    font-weight:600;
}

.form-row{
    display:flex;
    gap:12px;
    flex-wrap:wrap;
}

input, select{
    flex:1;
    min-width:220px;
    padding:10px 12px;
    border:1px solid #e5e7eb;
    border-radius:8px;
    outline:none;
}

select[multiple]{
    min-height:110px;
}

.btn{
    padding:10px 14px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    font-weight:500;
}

.primary{
    background:#4f46e5;
    color:#fff;
}

.edit{
    background:#3b82f6;
    color:#fff;
}

.delete{
    background:#ef4444;
    color:#fff;
}

table{
    width:100%;
    border-collapse:collapse;
    margin-top:10px;
}

th{
    background:#eef2ff;
    padding:12px;
}

td{
    padding:12px;
    border-bottom:1px solid #e5e7eb;
}

.toast{
    position:fixed;
    bottom:20px;
    right:20px;
    background:#111827;
    color:#fff;
    padding:12px 16px;
    border-radius:8px;
    display:none;
}

.modal-backdrop{
    position:fixed;
    inset:0;
    background:rgba(0,0,0,0.6);
    display:none;
    align-items:center;
    justify-content:center;
}

.modal{
    background:#fff;
    padding:22px;
    border-radius:14px;
    width:360px;
    text-align:center;
}
</style>

<script>
let deleteUrl="";

function editNode(id,name,path,role,roles){
    document.getElementById("nodeId").value=id;
    document.getElementById("nodeName").value=name;
    document.getElementById("nodePath").value=path;
    document.getElementById("role").value=role;

    const multi=document.getElementById("roles");
    [...multi.options].forEach(o=>o.selected=false);
    roles.split(",").forEach(r=>{
        const opt=[...multi.options].find(o=>o.value===r.trim());
        if(opt) opt.selected=true;
    });
}

function confirmDelete(url){
    deleteUrl=url;
    document.getElementById("modal").style.display="flex";
}
function closeModal(){
    document.getElementById("modal").style.display="none";
}
function proceedDelete(){
    window.location.href=deleteUrl;
}
</script>
</head>

<body>

<a class="back-arrow" href="${pageContext.request.contextPath}/">←</a>

<div class="container">

<!-- ✅ ADD / EDIT NODE -->
<div class="card">
<h2>Node Management</h2>

<form method="post" action="${pageContext.request.contextPath}/node/addnodes">
    <input type="hidden" id="nodeId" name="id"/>

    <div class="form-row">
        <input type="text" id="nodeName" name="name" placeholder="Node Name" required />
        <input type="text" id="nodePath" name="path" placeholder="Node Path" required />

        <!-- ✅ PRIMARY ROLE -->
        <select id="role" name="role" required>
            <option value="">Primary Role</option>
            <c:forEach var="r" items="${roles}">
                <option value="${r.name}">${r.name}</option>
            </c:forEach>
        </select>

        <!-- ✅ MULTI ROLES -->
        <select id="roles" name="roles" multiple>
            <c:forEach var="r" items="${roles}">
                <option value="${r.name}">${r.name}</option>
            </c:forEach>
        </select>

        <button class="btn primary" type="submit">Save Node</button>
    </div>
</form>
</div>

<!-- ✅ NODE TABLE -->
<div class="card">
<h2>All Nodes</h2>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Path</th>
    <th>Primary Role</th>
    <th>Additional Roles</th>
    <th>Action</th>
</tr>

<c:forEach var="n" items="${nodes}">
<tr>
    <td>${n.id}</td>
    <td>${n.name}</td>
    <td>${n.path}</td>
    <td>${n.role}</td>
    <td>
        <c:forEach var="r" items="${n.roles}" varStatus="s">
            ${r}<c:if test="${!s.last}">, </c:if>
        </c:forEach>
    </td>
    <td>
        <button class="btn edit"
            onclick="editNode(
                '${n.id}',
                '${n.name}',
                '${n.path}',
                '${n.role}',
                '<c:forEach var="r" items="${n.roles}">${r},</c:forEach>'
            )">
            Edit
        </button>

        <button class="btn delete"
            onclick="confirmDelete('${pageContext.request.contextPath}/node/deleteNode/${n.id}')">
            Delete
        </button>
    </td>
</tr>
</c:forEach>
</table>
</div>

</div>

<!-- MODAL -->
<div id="modal" class="modal-backdrop">
    <div class="modal">
        <h3>Delete Node?</h3>
        <p>This action cannot be undone.</p>
        <button onclick="closeModal()">Cancel</button>
        <button onclick="proceedDelete()" class="delete">Delete</button>
    </div>
</div>

</body>
</html>
``