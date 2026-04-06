<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>

    <style>
        /* ===== Ensure full height ===== */
        html, body {
            height: 100%;
            margin: 0;
        }

        /* ===== Abstract DARK BLUE background ===== */
        body {
            font-family: "Segoe UI", Tahoma, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background:
                radial-gradient(circle at 20% 20%, rgba(79, 172, 254, 0.18), transparent 40%),
                radial-gradient(circle at 80% 30%, rgba(0, 242, 254, 0.15), transparent 45%),
                radial-gradient(circle at 50% 80%, rgba(138, 43, 226, 0.14), transparent 50%),
                linear-gradient(135deg, #0f2027, #203a43, #2c5364) !important;
            color: #e6e6e6;
        }

        /* ===== Form box with BORDER + 3D ===== */
        .form-container {
            width: 360px;
            padding: 32px;
            border-radius: 16px;
            background: linear-gradient(145deg, #1c2a32, #162129);
            border: 1px solid rgba(130, 190, 255, 0.35);
            box-shadow:
                0 20px 40px rgba(0, 0, 0, 0.7),
                inset 0 1px 0 rgba(255, 255, 255, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-6px);
            box-shadow:
                0 26px 55px rgba(0, 0, 0, 0.85),
                inset 0 1px 0 rgba(255, 255, 255, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #ffffff;
            letter-spacing: 1px;
        }

        label {
            font-size: 13px;
            color: #cdd9e5;
        }

        /* ===== Input fields ===== */
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            margin-bottom: 18px;
            background: linear-gradient(145deg, #223743, #1a2c35);
            border: 1px solid #34515d;
            border-radius: 8px;
            color: #ffffff;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.7);
        }

        input:focus {
            outline: none;
            border-color: #5fa8ff;
            box-shadow:
                0 0 8px rgba(95, 168, 255, 0.8),
                inset 0 2px 4px rgba(0, 0, 0, 0.7);
        }

        /* ===== Buttons ===== */
        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        input[type="submit"],
        input[type="reset"] {
            width: 48%;
            padding: 11px;
            border-radius: 8px;
            font-size: 14px;
            border: none;
            cursor: pointer;
            color: #ffffff;
        }

        input[type="submit"] {
            background: linear-gradient(145deg, #4facfe, #00c6ff);
            box-shadow: 0 6px 14px rgba(0, 0, 0, 0.5);
        }

        input[type="reset"] {
            background: linear-gradient(145deg, #3a4b55, #2b3942);
            box-shadow: 0 6px 14px rgba(0, 0, 0, 0.5);
        }

        input[type="submit"]:active,
        input[type="reset"]:active {
            transform: translateY(2px);
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.8);
        }
    </style>
</head>

<body>

    <div class="form-container">
        <h2>Registration</h2>

        <!-- Spring MVC form -->
        <form action="/user/registerJdbc" method="post">
            <label>Username</label>
            <input type="text" name="username" required>

            <label>Email</label>
            <input type="email" name="email" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <div class="buttons">
                <input type="submit" value="Register">
                <input type="reset" value="Clear">
            </div>
        </form>
    </div>

</body>
</html>