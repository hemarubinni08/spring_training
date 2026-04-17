<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="sidebar">
    <div class="sidebar-links">
        <c:forEach items="${navList}" var="nav">
            <a href="${nav.path}">
                ${nav.name}
            </a>
        </c:forEach>
    </div>

    <!-- Logout -->
    <div class="logout-container">
        <form action="/logout" method="post">
            <button class="logout-btn" type="submit">Logout</button>
        </form>
    </div>
</div>
<style>
.sidebar {
    width: 240px;
    height: 100vh;
    background-color: #1f2937;
    padding: 20px;
    display: flex;
    flex-direction: column;
}

.sidebar a {
    display: block;
    padding: 10px 12px;
    margin-bottom: 5px;
    color: #e5e7eb;
    text-decoration: none;
    border-radius: 6px;
    font-weight: 500;
}

.sidebar a:hover {
    background-color: #374151;
    color: #ffffff;
}

/* Push logout to bottom */
.logout-container {
    margin-top: auto;
}

.logout-btn {
    width: 100%;
    padding: 10px;
    background-color: #dc2626;
    color: #ffffff;
    border: none;
    border-radius: 6px;
    font-weight: 600;
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease;
}

.logout-btn:hover {
    background-color: #b91c1c;
    transform: translateY(-1px);
}
</style>