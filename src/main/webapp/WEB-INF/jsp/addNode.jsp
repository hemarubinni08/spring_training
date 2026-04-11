<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Node</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #1d976c, #93f9b9);
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

        <div class="card shadow-lg">
            <div class="card-body p-4">
                <h4 class="text-center mb-4">${node}</h4>

                <form action="/node/addNode"
                      method="post">

                    <div class="mb-3">
                        <label class="form-label">Node Name</label>
                        <input type="text"
                               class="form-control"
                               name="name"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Node Path</label>
                        <input type="text"
                               class="form-control"
                               name="path"
                               required>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">
                            Add Node
                        </button>
                    </div>

                </form>
            </div>

            <div class="card-footer text-muted text-center small">
                POS Management System
            </div>
        </div>

    </div>
</div>

</body>
</html>