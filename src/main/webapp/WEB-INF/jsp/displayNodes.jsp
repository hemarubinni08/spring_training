<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
<title>Display</title>
<style>
       @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');

       body {
           font-family: 'Inter', Arial, sans-serif;
           background: linear-gradient(135deg, #eef2f7, #dde6f1);
           margin: 0;
           padding: 30px;
       }

       table {
           width: 100%;
           border-collapse: collapse;
           background: #ffffff;
           border-radius: 12px;
           overflow: hidden;
           box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
       }

       th {
           background: linear-gradient(135deg, #2c3e50, #34495e);
           color: #ffffff;
           text-align: left;
           padding: 14px 12px;
           font-size: 13px;
           text-transform: uppercase;
           letter-spacing: 0.05em;
           border-bottom: 1px solid rgba(255,255,255,0.1);
       }

       td {
           padding: 12px;
           font-size: 14px;
           color: #333;
           border-bottom: 1px solid #f0f0f0;
           vertical-align: middle;
       }

       tr:nth-child(even) {
           background: #fafafa;
       }

       tr {
           transition: background 0.2s ease;
       }

       tr:hover {
           background: #eaf1ff;
       }

       a {
           color: #2563eb;
           text-decoration: none;
           font-weight: 500;
       }

       a:hover {
           text-decoration: underline;
       }

       a[href*="delete"] {
           color: #dc2626;
           background: rgba(220, 38, 38, 0.1);
           padding: 6px 10px;
           border-radius: 6px;
           font-size: 13px;
       }

       a[href*="delete"]:hover {
           background: rgba(220, 38, 38, 0.2);
           text-decoration: none;
       }

       td a:first-child {
           font-weight: 600;
       }

       body > a {
           display: inline-block;
           margin-top: 20px;
           margin-right: 15px;
           padding: 10px 18px;
           background: #2563eb;
           color: #ffffff;
           border-radius: 8px;
           font-weight: 500;
           box-shadow: 0 6px 14px rgba(37, 99, 235, 0.3);
       }

           background: #1d4ed8;
           text-decoration: none;
       }

       body > a[href="/"] {
           background: #64748b;
       }

       body > a[href="/"]:hover {
           background: #475569;
       }
</style>
</head>
<body>
<table border="1">
      <tr>
        <th>Node Id</th>
        <th>Node Name</th>
        <th>Node path</th>
        <th>Role Ids</th>
        <th>DELETE</th>

    </tr>
    <c:forEach var="node" items="${nodeDtoList}">
         <tr>
            <td><a href = "/node/updateNodeByid/${node.id}">${node.id}</a></td>
            <td>${node.name}</td>
            <td>${node.path}</td>
            <td>${node.roleIds}</td>
            <td><a href = "/node/deleteNodeById/${node.id}">DELETE</a></td>
         </tr>
    </c:forEach>

</Table>

<a href="/node/addNode">Add Node<a/><br>
<a href="/">Home</a>
</body>
</html>


