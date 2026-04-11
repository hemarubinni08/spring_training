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
                        <td>${node.id}</td>
                        <td>${node.name}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <form action="${pageContext.request.contextPath}/node/updatenode" method="post" modelAttribute="nodeDto">


                <input type="hidden" name="id" value="${node.id}"/>
                <label>Name:</label>
                <input type="text" name="name" value="${node.name}"
                class="${not empty node.message ? 'error-input' : ''}"/>
                <c:if test="${not empty node.message}">
                    <div class="error-text">${node.message}</div>
                </c:if>
                <label>Path:</label>
                                <input type="text" name="path" value="${node.path}"
                                class="${not empty node.message ? 'error-input' : ''}"/>
                                <c:if test="${not empty node.message}">
                                    <div class="error-text">${node.message}</div>
                                </c:if>
                <button class="button-style" type="submit">Save</button>
            </form>

        <div style="text-align: center;">
            <a href="${pageContext.request.contextPath}/node/displaynode" class="button-style">View Users</a>
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