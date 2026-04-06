<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>

   <style>
       * {
           box-sizing: border-box;
       }

       body {
           margin: 0;
           padding: 0;
           min-height: 100vh;
           background: linear-gradient(135deg, #667eea, #764ba2);
           font-family: "Segoe UI", Arial, sans-serif;
           display: flex;
           align-items: center;
           justify-content: center;
       }

       .container {
           width: 360px;
           padding: 30px 25px;
           background-color: #ffffff;
           border-radius: 12px;
           box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
           text-align: center;
           animation: fadeIn 0.6s ease-in-out;
       }

       @keyframes fadeIn {
           from {
               transform: translateY(20px);
               opacity: 0;
           }
           to {
               transform: translateY(0);
               opacity: 1;
           }
       }

       h2 {
           margin-bottom: 25px;
           color: #333;
           font-weight: 600;
           letter-spacing: 0.5px;
       }

       label {
           display: block;
           text-align: left;
           font-weight: 600;
           margin-bottom: 6px;
           color: #555;
           font-size: 14px;
       }

       input {
           width: 100%;
           padding: 12px;
           margin-bottom: 18px;
           border-radius: 6px;
           border: 1px solid #ccc;
           font-size: 14px;
           transition: all 0.3s ease;
           background-color: #fafafa;
       }

       input:focus {
           border-color: #667eea;
           box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);
           outline: none;
           background-color: #ffffff;
       }

       input:required:invalid {
           border-color: #ffb4b4;
       }

       input:required:valid {
           border-color: #7bd389;
       }

       button {
           width: 100%;
           padding: 12px;
           background: linear-gradient(135deg, #667eea, #764ba2);
           color: #ffffff;
           border: none;
           border-radius: 6px;
           font-size: 16px;
           font-weight: 600;
           letter-spacing: 0.6px;
           cursor: pointer;
           transition: all 0.3s ease;
       }

       button:hover {
           transform: translateY(-2px);
           box-shadow: 0 8px 18px rgba(118, 75, 162, 0.35);
       }

       button:active {
           transform: translateY(0);
           box-shadow: 0 4px 10px rgba(118, 75, 162, 0.25);
       }

       @media (max-width: 420px) {
           .container {
               width: 90%;
               padding: 25px 20px;
           }
       }
   </style>
</head>

<body>
<div class="container">
    <h2>User Register</h2>

    <form action="${pageContext.request.contextPath}/user/register" method="post" modelAttribute="userDto">

        <label>Name:</label>
        <input type="text" name="name" required/>

        <label>Email:</label>
        <input type="email" name="email" required/>

        <label>Password:</label>
        <input type="password" name="password" required/>

        <button type="submit">Register</button>

    </form>
</div>
</body>
</html>