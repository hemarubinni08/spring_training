<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Users (JDBC)</title>

<style>
    body {
        margin: 0;
        min-height: 100vh;
        background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
        font-family: 'Segoe UI', Tahoma, Verdana, sans-serif;
        padding: 40px;
    }

    .container {
        background: #ffffff;
        border-radius: 18px;
        padding: 30px;
        box-shadow: 0 20px 40px rgba(0,0,0,0.3);
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 25px;
        letter-spacing: 1px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    thead {
        background: #2c5364;
        color: white;
    }

    th, td {
        padding: 14px;
        text-align: left;
        font-size: 14px;
    }

    tbody tr:nth-child(even) {
        background: #f2f7fa;
    }

    tbody tr:hover {
        background: #e0f2f1;
    }

    .password {
        letter-spacing: 2px;
        color: #999;
    }

    .no-data {
        text-align: center;
        font-size: 18px;
        color: #c62828;
        padding: 20px;
        font-weight: 600;
    }

    .footer {
        margin-top: 30px;
        text-align: center;
    }

    .btn {
        display: inline-block;
        padding: 12px 30px;
        background: #2c5364;
        color: #fff;
        text-decoration: none;
        border-radius: 8px;
        font-weight: 600;
    }

    .btn:hover {
        background: #1b3a4b;
    }
</style>
</head>

<body>

<div class="container">
    <h1>All Users (JDBC)</h1>

    <!-- ✅ NO USERS -->
    <c:if test="${empty users}">
        <div class="no-data">No users found in database</div>
    </c:if>

    <!-- ✅ USERS TABLE -->
    <c:if test="${not empty users}">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email (RequestParam)</th>
                    <th>Phone</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Age</th>
                    <th>Date of Birth</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>
                            <c:url value="/user/getProfileJdbcId" var="jdbcReqUrl">
                            <c:param name="id" value="${user.id}" />
                            </c:url>

                            <a href="${jdbcReqUrl}">
                            ${user.id}
                            </a>
                            </td>
                        <td>${user.name}</td>

                        <td>
                            <c:url value="/user/getProfileJdbcEmail" var="jdbcReqUrl">
                                <c:param name="email" value="${user.email}" />
                            </c:url>

                            <a href="${jdbcReqUrl}">
                                ${user.email}
                            </a>
                        </td>

                        <td>${user.phoneNo}</td>
                        <td>${user.userName}</td>
                        <td class="password">••••••</td>
                        <td>${user.age}</td>

                        <td>
                            <c:choose>
                                <c:when test="${not empty user.dateOfBirth}">
                                    <fmt:formatDate value="${user.dateOfBirth}" pattern="dd-MM-yyyy"/>
                                </c:when>
                                <c:otherwise>
                                    <span style="color:#999;">Not Provided</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <div class="footer">
        <a class="btn" href="${pageContext.request.contextPath}/user/register">
            Back to Register
        </a>
    </div>
</div>

</body>
</html>