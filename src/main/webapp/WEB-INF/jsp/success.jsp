<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Result</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f9fafb;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Inter', sans-serif;
            margin: 0;
        }

        /* Success Card Styling */
        .card {
            background: white;
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
        }

        .icon {
            width: 64px;
            height: 64px;
            background: #dcfce7;
            color: #16a34a;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            margin: 0 auto 1.5rem;
        }

        /* Failure Card Styling */
        .card-error {
            background: white;
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 10px 15px -3px rgba(220, 38, 38, 0.1);
            text-align: center;
            max-width: 400px;
            border: 1px solid #fee2e2;
        }

        .icon-error {
            width: 64px;
            height: 64px;
            background: #fee2e2;
            color: #dc2626;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            margin: 0 auto 1.5rem;
        }

        .error-title { color: #991b1b; font-size: 1.5rem; font-weight: 700; margin-bottom: 0.5rem; }
        .error-desc { color: #7f1d1d; font-size: 0.95rem; opacity: 0.8; }

        h1 { color: #111827; font-size: 1.5rem; margin-bottom: 1rem; }
        p { color: #6b7280; margin-bottom: 2rem; line-height: 1.5; }

        .btn {
            display: block;
            background: #4f46e5;
            color: white;
            padding: 0.75rem;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.2s;
        }
        .btn:hover { background: #4338ca; }
        .btn-error { background: #dc2626 !important; }
        .btn-error:hover { background: #b91c1c !important; }
    </style>
</head>
<body>

    <%
        // We pull the message from the model and check if its an error
        String msg = (String) request.getAttribute("message");
        boolean isError = (msg != null && msg.toLowerCase().contains("exists"));
    %>

    <div class="<%= isError ? "card-error" : "card" %>">

        <div class="<%= isError ? "icon-error" : "icon" %>">
            <%= isError ? "✕" : "✓" %>
        </div>

        <h1 class="<%= isError ? "error-title" : "" %>">
            ${message}
        </h1>

        <p class="<%= isError ? "error-desc" : "" %>">
            <%= isError ? "The details you provided are already in our system."
                        : "Your account has been created. You can now proceed to the login page." %>
        </p>

        <a href="<%= isError ? "/register" : "/login" %>"
           class="btn <%= isError ? "btn-error" : "" %>">
            <%= isError ? "Go Back" : "Continue to Login" %>
        </a>
    </div>

</body>
</html>