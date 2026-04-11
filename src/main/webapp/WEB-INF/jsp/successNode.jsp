<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Node Status</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #43cea2, #185a9d);
            min-height: 100vh;
        }
        .card {
            border-radius: 15px;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center align-items-center mt-5">
    <div class="col-md-5">

        <div class="card shadow-lg text-center">
            <div class="card-body p-4">

                <c:choose>
                    <c:when test="${node eq 'Node Added Successfully'}">
                        <div class="alert alert-success">
                            ${node}
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-danger">
                            ${node}
                        </div>
                    </c:otherwise>
                </c:choose>

                <a href="/node/addNode"
                   class="btn btn-primary mt-3">
                    Add Another Node
                </a>

            </div>

            <div class="card-footer text-muted small">
                POS Management System
            </div>
        </div>

    </div>
</div>

</body>
</html>