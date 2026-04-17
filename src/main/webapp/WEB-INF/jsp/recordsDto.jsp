<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Database Records</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #0f172a, #111827, #0b1220);
            color: #e5e7eb;
            padding: 40px 16px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            color: #f8fafc;
            letter-spacing: 1px;
        }

        /* TABLE CONTAINER */
        .table-container {
            max-width: 1000px;
            margin: auto;
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 10px 35px rgba(0,0,0,0.5);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: rgba(59,130,246,0.15);
        }

        th {
            padding: 14px;
            text-align: left;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: #f1f5f9;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        td {
            padding: 14px;
            font-size: 14px;
            color: #cbd5e1;
            border-bottom: 1px solid rgba(255,255,255,0.06);
        }

        tr {
            transition: 0.3s ease;
        }

        tr:hover {
            background: rgba(255,255,255,0.05);
            transform: scale(1.01);
        }

        /* Responsive */
        @media (max-width: 768px) {
            body {
                padding: 20px;
            }

            td, th {
                font-size: 12px;
                padding: 10px;
            }
        }

    </style>
</head>

<body>
<h2>User Records ⚡</h2>
<div class="table-container">

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.phoneNo}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>