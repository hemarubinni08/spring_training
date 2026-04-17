<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

<style>
body {
    overflow-x: hidden;
    background-color: #EDE9E6;
}

.sidebar {
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    width: 220px;
    background-color: #343a40;
    padding-top: 60px;
}

.sidebar a {
    color: #ddd;
    padding: 10px 20px;
    display: block;
    text-decoration: none;
}

.sidebar a:hover {
    background-color: #495057;
    color: #fff;
}

.content {
    margin-left: 220px;
    padding: 20px;
}
</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="content">

    <div class="container-fluid">
        <div class="card shadow-sm">
            <div class="card-body rounded-pill">
                <h4 class="card-title">Welcome to the dashboard</h4>
                <p class="card-text">
                    You can manage your application features from here. Use the sidebar to navigate through different sections.
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>