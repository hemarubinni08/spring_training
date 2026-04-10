<body>
    <div class="register-card">
        <div class="table-container">
            <table border="1" style="width: 100%; margin-bottom: 20px; border-collapse: collapse;">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${role.id}</td>
                        <td>${role.name}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <form action="${pageContext.request.contextPath}/role/updaterole" method="post" modelAttribute="roleDto">


                <input type="hidden" name="id" value="${role.id}"/>
                <label>Name:</label>
                <input type="text" name="name" value="${role.name}"
                class="${not empty role.message ? 'error-input' : ''}"/>
                <c:if test="${not empty role.message}">
                    <div class="error-text">${role.message}</div>
                </c:if>
                <button class="button-style" type="submit">Save</button>
            </form>

        <div style="text-align: center;">
            <a href="${pageContext.request.contextPath}/role/displayrole" class="button-style">View Users</a>
        </div>
    </div>

    <style>
        .error-input{
            border: 1px solid red;
            border-bottom: 3px solid red;
            outline: none;
        }
        .error-text
        {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
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