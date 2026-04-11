<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Node</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #2193b0, #6dd5ed);
            min-height: 100vh;
        }
        .card {
            border-radius: 15px;
        }
        .label {
            font-weight: 600;
        }
    </style>
</head>

<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="mb-0">Edit Node</h4>
                </div>

                <div class="card-body">

                    <c:if test="${empty node}">
                        <div class="alert alert-danger text-center">
                            Node not found
                        </div>
                    </c:if>

                    <c:if test="${not empty node}">
                        <form:form method="post"
                                   action="${pageContext.request.contextPath}/node/updateNode"
                                   modelAttribute="node">

                            <!-- Hidden ID -->
                            <form:hidden path="id"/>

                            <div class="mb-3">
                                <label class="label">Node ID</label>
                                <input type="text"
                                       class="form-control"
                                       value="${node.id}"
                                       readonly>
                            </div>

                            <div class="mb-3">
                                <label class="label">Node Name</label>
                                <form:input path="name"
                                            cssClass="form-control"
                                            required="true"/>
                            </div>

                            <div class="mb-3">
                                <label class="label">Node Path</label>
                                <form:input path="path"
                                            cssClass="form-control"
                                            required="true"/>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/node/listOfNodes"
                                   class="btn btn-secondary">
                                    Cancel
                                </a>

                                <button type="submit"
                                        class="btn btn-success">
                                    Update Node
                                </button>
                            </div>

                        </form:form>
                    </c:if>

                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
