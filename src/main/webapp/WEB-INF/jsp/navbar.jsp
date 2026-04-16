<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="sidebar">
    <c:forEach items="${navList}" var="nav">
        <a href="${nav.path}">
            ${nav.name}
        </a>
    </c:forEach>
</div>