<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
</head>
<body>

<center>
    <h2 style="color: ${Colour};"> ${status}</h2>

    <p>${status2}</p>

    <br>

    ${pageContext.request.contextPath}/user/register
        Register Another User
    </a>
</center>

</body>
</html>