<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Status</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>

<body class="bg-light">

<div class="container">
    <div class="row justify-content-center align-items-center" style="height:100vh;">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-body text-center">

                    <h3 class="mb-4">Registration Status</h3>

                    <div class="alert alert-success">
                        ${statusMessage}
                    </div>

                    <a href="/" class="btn btn-warning btn-block">
                        Go to Home
                    </a>

                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>