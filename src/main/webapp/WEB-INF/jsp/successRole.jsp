<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Role Status</title>

    <!-- Bootstrap CSS -->
    https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css

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

                <!-- Success -->
                <c:if test="${Name eq 'Added Successfull'}">
                    <div class="alert alert-success">
                        <h4 class="alert-heading">✅ Success</h4>
                        <p class="mb-0">${Name}</p>
                    </div>
                </c:if>

                <!-- Failure -->
                <c:if test="${Name ne 'Added Successfull'}">
                    <div class="alert alert-danger">
                        <h4 class="alert-heading">❌ Failed</h4>
                        <p class="mb-0">${Name}</p>
                    </div>
                </c:if>

                <a href="${pageContext.request.contextPath}/role/addRoleJdbc"
                   class="btn btn-primary mt-3">
                    Add Another Role
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