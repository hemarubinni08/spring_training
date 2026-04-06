<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            height: 100vh;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 380px;
            padding: 30px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            margin-bottom: 18px;
        }

        label {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }

        input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            outline: none;
            transition: 0.3s;
        }

        input:focus {
            border-color: #2575fc;
            box-shadow: 0 0 5px rgba(37, 117, 252, 0.5);
        }

        .btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            transform: scale(1.03);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .footer-text {
            text-align: center;
            margin-top: 15px;
            font-size: 13px;
            color: #777;
        }

        .footer-text a {
            color: #2575fc;
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
            <input type="text" name="name" placeholder="Enter your name" required />
        </div>

        <div class="input-group">
            <label>Email</label>
            <input type="email" name="email" placeholder="Enter your email" required />
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter password" required />
        </div>

        <input type="submit" value="Register" class="btn" />

        <div class="footer-text">
            Already have an account? <a href="#">Login</a>
        </div>

    </form>
</div>

</body>
</html>