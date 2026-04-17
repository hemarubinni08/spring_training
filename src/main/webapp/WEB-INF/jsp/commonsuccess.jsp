<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<style>
    .message-box {
        margin-top: 40px;
        padding: 25px;
        background-color: #f2f2f2;
        border-left: 5px solid #007bff;
        color: #333;
        font-size: 18px;        /* ✅ bigger content */
        line-height: 1.6;
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
    }

    .back-btn {
        display: inline-block;
        margin-top: 25px;
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        font-size: 14px;
        border-radius: 4px;
    }

    .back-btn:hover {
        background-color: #0056b3;
    }
</style>

<c:if test="${not empty message}">
    <div class="message-box">
        ${message}
        <br><br>
        <a href="${path}" class="back-btn">Go Back</a>
    </div>
</c:if>