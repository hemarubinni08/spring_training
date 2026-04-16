<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Node Management</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
*{box-sizing:border-box;}

body {
    font-family: 'Inter', sans-serif;
    margin: 0;
    background: #f4f6f9;
    color: #1f2937;
}

/* BACK BUTTON */
.back-arrow {
    position: fixed;
    top: 18px;
    left: 18px;
    width: 44px;
    height: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: white;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.12);
    text-decoration: none;
    font-size: 20px;
    color: #4f46e5;
    transition: 0.2s;
    z-index: 1000;
}

.back-arrow:hover {
    transform: translateX(-3px);
    background: #eef2ff;
}

/* LAYOUT */
.container {
    max-width: 1100px;
    margin: 70px auto;
    padding: 0 20px;
}

.card {
    background: white;
    padding: 24px;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
    margin-bottom: 20px;
}

h2 {
    margin-bottom: 18px;
    font-weight: 700;
}

/* FORM */
.form-row{
    display:flex;
    gap:12px;
    flex-wrap:wrap;
}

input, select{
    flex:1;
    min-width:220px;
    padding:12px;
    border-radius:10px;
    border:1px solid #e5e7eb;
    outline:none;
}

input:focus, select:focus{
    border-color:#4f46e5;
    box-shadow:0 0 0 3px rgba(79,70,229,0.15);
}

select[multiple]{
    min-height:110px;
}

/* BUTTONS */
.btn{
    height:40px;
    padding:0 14px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    font-weight:500;
}

.primary{
    background:#4f46e5;
    color:white;
}

.primary:hover{
    background:#4338ca;
}

/* TABLE */
table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #eef2ff;
    color: #3730a3;
    padding: 14px;
    text-align: left;
}

td {
    padding: 14px;
    border-bottom: 1px solid #e5e7eb;
}

tr:hover {
    background: #f9fafb;
}

/* BADGES */
.badge {
    background: #e0e7ff;
    color: #3730a3;
    padding: 4px 10px;
    border-radius: 8px;
    font-size: 12px;
}

/* ACTION BUTTONS */
.actions {
    display:flex;
    gap:10px;
}

.btn-edit {
    background:#3b82f6;
    color:white;
}

.btn-delete {
    background:#ef4444;
    color:white;
}

/* SEARCH */
.search-box {
    margin-bottom: 18px;
}

.search-box input {
    width: 100%;
}

/* MODAL */
.modal-overlay {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.45);
    display: none;
    align-items: center;
    justify-content: center;
}

.modal {
    background: white;
    padding: 24px;
    border-radius: 14px;
    width: 320px;
    text-align: center;
}

.btn-danger { background:#ef4444;color:white; }
.btn-secondary { background:#e5e7eb; }
</style>

<script>
/* BACK BUTTON */
function goBack(){
    if(document.referrer){
        window.history.back();
    } else {
        window.location.href = "${pageContext.request.contextPath}/";
    }
}

function editNode(id,name,path,role,roles){

    document.getElementById("nodeId").value=id;
    document.getElementById("nodeName").value=name;
    document.getElementById("nodePath").value=path;
    document.getElementById("role").value=role;

    document.getElementById("nodeForm").action =
        "${pageContext.request.contextPath}/node/updateNode";

    const multi=document.getElementById("roles");
    [...multi.options].forEach(o=>o.selected=false);

    roles.split(",").forEach(r=>{
        const opt=[...multi.options].find(o=>o.value===r.trim());
        if(opt) opt.selected=true;
    });
}

/* DELETE MODAL */
function openModal(id){
    document.getElementById("deleteForm").action =
        "${pageContext.request.contextPath}/node/deleteNode/" + id;
    document.getElementById("modal").style.display="flex";
}
function closeModal(){
    document.getElementById("modal").style.display="none";
}

/* SEARCH */
function searchTable(){
    let filter = document.getElementById("searchInput").value.toLowerCase();
    document.querySelectorAll("#nodeTable tbody tr").forEach(row=>{
        row.style.display = row.innerText.toLowerCase().includes(filter) ? "" : "none";
    });
}
</script>
</head>

<body>

<!-- UPDATED BACK BUTTON -->
<a class="back-arrow" href="javascript:void(0)" onclick="goBack()">←</a>

<div class="container">

<!-- FORM -->
<div class="card">
<h2>Node Management</h2>

<form method="post" id="nodeForm"
      action="${pageContext.request.contextPath}/node/addnodes">

    <input type="hidden" id="nodeId" name="id"/>

    <div class="form-row">
        <input type="text" id="nodeName" name="name" placeholder="Node Name" required />
        <input type="text" id="nodePath" name="path" placeholder="Node Path" required />

        <select id="role" name="role" required>
            <option value="">Primary Role</option>
            <c:forEach var="r" items="${roles}">
                <option value="${r.name}">${r.name}</option>
            </c:forEach>
        </select>

        <select id="roles" name="roles" multiple>
            <c:forEach var="r" items="${roles}">
                <option value="${r.name}">${r.name}</option>
            </c:forEach>
        </select>

        <button class="btn primary" type="submit">Save Node</button>
    </div>
</form>
</div>

<!-- TABLE -->
<div class="card">
<h2>All Nodes</h2>

<div class="search-box">
    <input type="text" id="searchInput" placeholder="Search nodes..." onkeyup="searchTable()">
</div>

<table id="nodeTable">
<thead>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Path</th>
    <th>Primary Role</th>
    <th>Roles</th>
    <th>Action</th>
</tr>
</thead>

<tbody>
<c:forEach var="n" items="${nodes}">
<tr>
    <td>${n.id}</td>
    <td>${n.name}</td>
    <td>${n.path}</td>

    <td><span class="badge">${n.role}</span></td>

    <td>
        <c:forEach var="r" items="${n.roles}">
            <span class="badge">${r}</span>
        </c:forEach>
    </td>

    <td>
        <div class="actions">
            <button class="btn btn-edit"
                onclick="editNode(
                    '${n.id}',
                    '${n.name}',
                    '${n.path}',
                    '${n.role}',
                    '<c:forEach var="r" items="${n.roles}" varStatus="s">${r}<c:if test="${!s.last}">,</c:if></c:forEach>'
                )">
                Edit
            </button>

            <button class="btn btn-delete"
                    onclick="openModal('${n.id}')">
                Delete
            </button>
        </div>
    </td>
</tr>
</c:forEach>
</tbody>

</table>
</div>

</div>

<!-- DELETE MODAL -->
<div id="modal" class="modal-overlay">
    <div class="modal">
        <h3>Delete Node?</h3>
        <p>This action cannot be undone.</p>

        <form id="deleteForm" method="get">
            <button type="submit" class="btn-danger">Delete</button>
            <button type="button" class="btn-secondary" onclick="closeModal()">Cancel</button>
        </form>
    </div>
</div>

</body>
</html>