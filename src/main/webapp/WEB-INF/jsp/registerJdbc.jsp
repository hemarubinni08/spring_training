<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            height: 100vh;
            background: linear-gradient(120deg, #4facfe, #00f2fe); /* smoother gradient */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 340px; /* reduced size */
            background: #ffffff;
            padding: 22px; /* reduced padding */
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 18px;
            color: #333;
            font-size: 20px;
        }

        .input-group {
            margin-bottom: 14px; /* tighter spacing */
        }

        label {
            font-size: 13px;
            color: #555;
            margin-bottom: 4px;
            display: block;
        }

        input {
            width: 100%;
            padding: 8px; /* smaller inputs */
            border-radius: 5px;
            border: 1px solid #ccc;
            outline: none;
            font-size: 13px;
        }

        input:focus {
            border-color: #4facfe;
            box-shadow: 0 0 4px rgba(79, 172, 254, 0.4);
        }

        .btn {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: linear-gradient(120deg, #4facfe, #00c6ff);
            color: white;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn:hover {
            transform: scale(1.02);
        }

        .footer-text {
            text-align: center;
            margin-top: 10px;
            font-size: 12px;
            color: #777;
        }

        .footer-text a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

    </style>
</head>

<body>

<div class="container">
    <h2>Create Account</h2>

    <form action="register" method="post">

        <div class="input-group">
            <label>Name</label>
            <input type="text" name="name" required />
        </div>

        <div class="input-group">
            <label>Email</label>
            <input type="email" name="email" required />
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" required />
        </div>

        <div class="input-group">
            <label>Age</label>
            <input type="number" name="age" required />
        </div>

        <div class="input-group">
            <label>Phone Number</label>
            <input type="text" name="phoneNo" required />
        </div>

        <input type="submit" value="Register" class="btn" />

        <div class="footer-text">
            Already have an account? <a href="#">Login</a>
        </div>

    </form>
</div>

</body>
</html>