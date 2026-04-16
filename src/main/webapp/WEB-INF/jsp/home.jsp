<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
body{
margin:0;
font-family:Inter,sans-serif;
background:#f4f7fb;
color:#1f2937;
}

/* SIDEBAR */
.sidebar{
position:fixed;
left:0;
top:0;
width:250px;
height:100vh;
background:#ffffff;
border-right:1px solid #e5e7eb;
box-shadow:2px 0 20px rgba(0,0,0,0.05);
}

.sidebar-header{
padding:18px;
font-weight:700;
color:#2563eb;
border-bottom:1px solid #eee;
}

.sidebar a{
display:block;
padding:12px 18px;
margin:6px 10px;
text-decoration:none;
color:#374151;
border-radius:8px;
transition:0.2s;
}

.sidebar a:hover{
background:#eef2ff;
color:#2563eb;
transform:translateX(4px);
}

/* TOP BAR */
.topbar{
display:flex;
justify-content:space-between;
align-items:center;
padding:15px 25px;
background:#fff;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.05);
margin-bottom:20px;
}

.title{
font-size:20px;
font-weight:700;
color:#111827;
}

/* LOGOUT ICON */
.logout{
width:38px;
height:38px;
border-radius:10px;
background:#eff6ff;
display:flex;
align-items:center;
justify-content:center;
cursor:pointer;
transition:0.2s;
}

.logout:hover{
background:#dbeafe;
transform:scale(1.05);
}

.logout svg{
width:20px;
height:20px;
fill:#2563eb;
}

/* CONTENT */
.content{
margin-left:250px;
padding:25px;
}

/* CARDS */
.card{
background:#fff;
border-radius:14px;
padding:18px;
box-shadow:0 8px 25px rgba(0,0,0,0.06);
margin-bottom:20px;
}

h3{
margin-bottom:12px;
color:#2563eb;
}

/* TABLE */
table{
width:100%;
border-collapse:collapse;
}

th{
text-align:left;
padding:12px;
background:#f1f5ff;
color:#1e3a8a;
font-size:13px;
}

td{
padding:12px;
border-bottom:1px solid #eee;
}

tr:hover{
background:#f9fafb;
}

.badge{
background:#dbeafe;
color:#1e3a8a;
padding:4px 10px;
border-radius:8px;
font-size:12px;
}
</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
<div class="sidebar-header">Dashboard</div>

<c:forEach var="node" items="${nodes}">
<a href="${pageContext.request.contextPath}${node.path}">
${node.name}
</a>
</c:forEach>
</div>

<!-- CONTENT -->
<div class="content">

<div class="topbar">
<div class="title">Home Dashboard</div>

<a class="logout"
href="${pageContext.request.contextPath}/login">
<svg viewBox="0 0 24 24">
<path d="M10 17l5-5-5-5v10z"/>
</svg>
</a>
</div>

<!-- USERS -->
<div class="card">
<h3>Users</h3>
<table>
<tr>
<th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Username</th>
</tr>

<c:forEach var="u" items="${users}">
<tr>
<td>${u.id}</td>
<td>${u.name}</td>
<td>${u.email}</td>
<td>${u.phoneNo}</td>
<td><span class="badge">${u.userName}</span></td>
</tr>
</c:forEach>
</table>
</div>

<!-- ROLES -->
<div class="card">
<h3>Roles</h3>
<table>
<tr><th>ID</th><th>Name</th></tr>

<c:forEach var="r" items="${roles}">
<tr>
<td>${r.id}</td>
<td>${r.name}</td>
</tr>
</c:forEach>
</table>
</div>

<!-- NODES -->
<div class="card">
<h3>Nodes</h3>
<table>
<tr><th>ID</th><th>Name</th><th>Path</th></tr>

<c:forEach var="n" items="${nodes}">
<tr>
<td>${n.id}</td>
<td>${n.name}</td>
<td>${n.path}</td>
</tr>
</c:forEach>
</table>
</div>

</div>

</body>
</html>