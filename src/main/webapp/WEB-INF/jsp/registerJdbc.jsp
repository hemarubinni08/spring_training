<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account - POS System</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #f3f4f6;
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --text-dark: #111827;
            --text-muted: #6b7280;
            --error-bg: #fee2e2;
            --error-text: #dc2626;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

        body {
            background-color: var(--bg-color);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .card {
            background: #ffffff;
            width: 100%;
            max-width: 480px;
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
        }

        .header { text-align: center; margin-bottom: 1.5rem; }
        .header h1 { font-size: 1.5rem; color: var(--text-dark); }
        .header p { font-size: 0.9rem; color: var(--text-muted); margin-top: 0.5rem; }

        .error-banner {
            background-color: var(--error-bg);
            color: var(--error-text);
            padding: 0.75rem;
            border-radius: 8px;
            font-size: 0.85rem;
            margin-bottom: 1.5rem;
            text-align: center;
            border: 1px solid #fecaca;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .form-group { margin-bottom: 1.1rem; }
        .full-width { grid-column: span 2; }

        .form-group label {
            display: block;
            font-size: 0.8rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.4rem;
            text-transform: uppercase;
            letter-spacing: 0.025em;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            outline: none;
            transition: all 0.2s;
            font-size: 0.95rem;
        }

        .form-group input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        .btn {
            width: 100%;
            padding: 0.85rem;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 1rem;
            font-size: 1rem;
            transition: background 0.2s;
        }

        .btn:hover { background-color: var(--primary-hover); }

        .footer { text-align: center; margin-top: 1.5rem; font-size: 0.85rem; color: var(--text-muted); }
        .footer a { color: var(--primary); text-decoration: none; font-weight: 600; }
    </style>
</head>
<body>
    <div class="card">
        <div class="header">
            <h1>Create Account</h1>
            <p>Please fill in your details to register</p>
        </div>

        <c:if test="${not empty error}">
            <div class="error-banner">
                ${error}
            </div>
        </c:if>

        <form action="/user/registerJdbc" method="POST">
            <div class="form-grid">
                <div class="form-group full-width">
                    <label>Full Name</label>
                    <input type="text" name="name" placeholder="Enter your full name" required>
                </div>

                <div class="form-group full-width">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="email@example.com" required>
                </div>

                <div class="form-group full-width">
                    <label>Phone Number</label>
                    <input type="tel" name="phoneNo" placeholder="10-digit mobile number" pattern="[0-9]{10}" required title="Please enter a 10-digit phone number">
                </div>

                <div class="form-group">
                    <label>Date of Birth</label>
                    <input type="date" name="dateOfBirth" required>
                </div>

                <div class="form-group">
                    <label>Age</label>
                    <input type="number" name="age" min="1" max="120" placeholder="0" required>
                </div>

                <div class="form-group full-width">
                    <label>Username</label>
                    <input type="text" name="userName" placeholder="Choose a unique username" required>
                </div>

                <div class="form-group full-width">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Create a strong password" required>
                </div>
            </div>

            <button type="submit" class="btn">Register Now</button>
        </form>

        <div class="footer">
            Already have an account? <a href="/login">Login here</a>
        </div>
    </div>
</body>
</html>