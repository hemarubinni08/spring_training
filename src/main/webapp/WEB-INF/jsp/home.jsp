<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"/>

    <style>
        body {
            min-height: 100vh;
            background-color: #f4f6f9;
        }

        .sidebar {
            width: 250px;
            min-height: 100vh;
            background: linear-gradient(180deg, #667eea, #764ba2);
            color: white;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: rgba(255, 255, 255, 0.15);
            border-radius: 8px;
        }

        .content-area {
            padding: 30px;
        }
    </style>
</head>

<body>

<div class="d-flex">

    <!-- ✅ Sidebar -->
    <div class="sidebar p-3">
        <h5 class="text-center mb-4">POS System</h5>

        <c:if test="${empty node}">
            <div class="alert alert-light text-center small">
                No nodes found
            </div>
        </c:if>

        <c:if test="${not empty node}">
            <ul class="nav nav-pills flex-column gap-2">
                <c:forEach var="n" items="${node}">
                    <li class="nav-item">
                        <a class="nav-link" href="${n.path}">
                            ${n.name}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
    </div>

    <!-- ✅ Main Content -->
    <div class="content-area flex-grow-1">
        <div class="card shadow-sm">
            <div class="card-body">
                <h4>Welcome</h4>
                <p class="text-muted">
                    Select an option from the sidebar to continue.
                </p>
            </div>
        </div>
    </div>

</div>

</body>
</html>