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

/* BACK */
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
    transition:0.2s;
}
.back-arrow:hover{
    transform:translateX(-3px);
    background:#eef2ff;
}

/* LAYOUT */
.container{
    max-width:1100px;
    margin:60px auto;
    padding:0 20px;
}

/* CARD */
.card{
    background:#fff;
    padding:25px;
    border-radius:12px;
    box-shadow:0 8px 25px rgba(0,0,0,0.08);
    margin-bottom:20px;
}

/* TITLE */
h2{
    margin-bottom:15px;
    font-weight:600;
    color:#111827;
}

/* FORM */
.form-row{
    display:flex;
    gap:12px;
    flex-wrap:wrap;
}

input{
    flex:1;
    min-width:220px;
    padding:10px 12px;
    border:1px solid #e5e7eb;
    border-radius:8px;
    outline:none;
}

input:focus{
    border-color:#6366f1;
    box-shadow:0 0 0 3px rgba(99,102,241,0.2);
}

/* BUTTONS */
.btn{
    padding:8px 12px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-weight:500;
}

.primary{
    background:#4f46e5;
    color:#fff;
}
.primary:hover{background:#4338ca;}

.edit{
    background:#3b82f6;
    color:#fff;
}
.edit:hover{background:#2563eb;}

.delete{
    background:#ef4444;
    color:#fff;
}
.delete:hover{background:#dc2626;}

/* TABLE */
table{
    width:100%;
    border-collapse:collapse;
    margin-top:10px;
}

th{
    background:#eef2ff;
    color:#374151;
    text-align:left;
    padding:12px;
}

td{
    padding:12px;
    border-bottom:1px solid #e5e7eb;
}

tr:hover{
    background:#f9fafb;
}

/* TOAST */
.toast{
    position:fixed;
    bottom:20px;
    right:20px;
    background:#111827;
    color:#fff;
    padding:12px 16px;
    border-radius:8px;
    display:none;
    z-index:10000;
}

/* MODAL */
.modal-backdrop{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(17,24,39,0.6);
    display:none;
    align-items:center;
    justify-content:center;
    z-index:9999;
}

.modal{
    background:#fff;
    width:360px;
    padding:22px;
    border-radius:14px;
    text-align:center;
    box-shadow:0 20px 60px rgba(0,0,0,0.3);
}

.modal h3{
    margin:0 0 10px;
    font-size:18px;
}

.modal p{
    font-size:14px;
    color:#6b7280;
    margin-bottom:16px;
}

.modal-actions{
    display:flex;
    gap:10px;
    justify-content:center;
}

.btn-cancel{
    background:#e5e7eb;
    border:none;
    padding:8px 14px;
    border-radius:8px;
    cursor:pointer;
}

.btn-confirm{
    background:#ef4444;
    color:#fff;
    border:none;
    padding:8px 14px;
    border-radius:8px;
    cursor:pointer;
}
</style>

<script>
let deleteUrl = "";

function toast(msg){
    const t=document.getElementById("toast");
    t.innerText=msg;
    t.style.display="block";
    setTimeout(()=>t.style.display="none",2000);
}

function editNode(id,name,path){
    document.getElementById("nodeId").value=id;
    document.getElementById("nodeName").value=name;
    document.getElementById("nodePath").value=path;
    toast("Editing node: " + name);
}

function confirmDelete(url){
    deleteUrl = url;
    document.getElementById("modal").style.display="flex";
}

function closeModal(){
    document.getElementById("modal").style.display="none";
    deleteUrl="";
}

function proceedDelete(){
    window.location.href = deleteUrl;
}
</script>

</head>

<body>

<a class="back-arrow" href="${pageContext.request.contextPath}/">←</a>

<div class="container">

<!-- FORM -->
<div class="card">
    <h2>Node Management</h2>

    <form method="post" action="${pageContext.request.contextPath}/node/addnodes">
        <input type="hidden" id="nodeId" name="id"/>

        <div class="form-row">
            <input type="text" id="nodeName" name="name" placeholder="Node Name" required/>
            <input type="text" id="nodePath" name="path" placeholder="Node Path" required/>
            <button class="btn primary" type="submit">Save Node</button>
        </div>
    </form>
</div>

<!-- TABLE -->
<div class="card">
    <h2>All Nodes</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Path</th>
            <th>Action</th>
        </tr>

        <c:forEach var="n" items="${nodes}">
        <tr>
            <td>${n.id}</td>
            <td>${n.name}</td>
            <td>${n.path}</td>
            <td>
                <button class="btn edit"
                        onclick="editNode('${n.id}','${n.name}','${n.path}')">
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

<!-- TOAST -->
<div id="toast" class="toast"></div>

<!-- MODAL -->
<div id="modal" class="modal-backdrop">
    <div class="modal">
        <h3>Delete Node?</h3>
        <p>This action cannot be undone.</p>

        <div class="modal-actions">
            <button class="btn-cancel" onclick="closeModal()">Cancel</button>
            <button class="btn-confirm" onclick="proceedDelete()">Delete</button>
        </div>
    </div>
</div>

</body>
</html>