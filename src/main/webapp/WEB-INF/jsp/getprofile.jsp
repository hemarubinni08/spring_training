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
        <form action="${pageContext.request.contextPath}/user/updateprofilejdbc" method="post" modelAttribute="userDto">

                <input type="hidden" name="id" value="${user.id}"/>
                <label>Name:</label>
                <input type="text" name="name" value="${user.name}"/>

                <label>Email:</label>
                <input type="email" name="email" value="${user.email}"/>

                <label>Age:</label>
                <input type="number" name="age" value="${user.age}"/>

                <button class="button-style" type="submit">Save via JDBC</button>

            </form>

        <form action="${pageContext.request.contextPath}/user/updateprofilejpa" method="post" modelAttribute="userDto">

                <input type="hidden" name="id" value="${user.id}"/>
                <label>Name:</label>
                <input type="text" name="name" value="${user.name}"/>

                <label>Email:</label>
                <input type="email" name="email" value="${user.email}"/>

                <label>Age:</label>
                <input type="number" name="age" value="${user.age}"/>

                <button class="button-style" type="submit">Save via JPA</button>

            </form>

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