<body>
    <div class="register-card">
        <div class="table-container">
            <table border="1" style="width: 100%; margin-bottom: 20px; border-collapse: collapse;">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Age</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.age}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div style="text-align: center;">
            <a href="${pageContext.request.contextPath}/user/display" class="button-style">View Users</a>
        </div>
    </div>

    <style>
        .button-style {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .button-style:hover {
            background-color: #0056b3;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</body>