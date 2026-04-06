<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Registration Status</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;800&family=Mulish:wght@400;500;600&display=swap" rel="stylesheet"/>
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        :root {
            --bg: #0d1117; --surface: #161b22;
            --border: rgba(255,255,255,0.08);
            --accent: #00c896; --accent2: #0096ff;
            --text: #e6edf3; --muted: #7d8590;
            --error: #f85149; --success: #3fb950;
        }
        body {
            min-height: 100vh; background: var(--bg);
            font-family: 'Mulish', sans-serif; color: var(--text);
            display: flex; align-items: center; justify-content: center; padding: 24px;
        }
        body::before {
            content: ''; position: fixed; inset: 0;
            background-image:
                linear-gradient(rgba(0,200,150,0.03) 1px, transparent 1px),
                linear-gradient(90deg, rgba(0,200,150,0.03) 1px, transparent 1px);
            background-size: 40px 40px; pointer-events: none; z-index: 0;
        }
        .orb { position: fixed; border-radius: 50%; filter: blur(120px); pointer-events: none; z-index: 0; }
        .orb-1 { width: 400px; height: 400px; background: rgba(0,200,150,0.08); top: -100px; left: -100px; }
        .orb-2 { width: 350px; height: 350px; background: rgba(0,150,255,0.07); bottom: -80px; right: -80px; }

        .card {
            position: relative; z-index: 1; background: var(--surface);
            border: 1px solid var(--border); border-radius: 24px;
            padding: 60px 52px; width: 100%; max-width: 480px;
            text-align: center; box-shadow: 0 24px 80px rgba(0,0,0,0.5);
            animation: popIn 0.5s cubic-bezier(.22,1,.36,1) both;
        }
        @keyframes popIn {
            from { opacity: 0; transform: scale(0.92) translateY(20px); }
            to   { opacity: 1; transform: scale(1)    translateY(0); }
        }

        .icon-wrap {
            width: 90px; height: 90px; border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 28px; font-size: 38px;
        }
        .icon-success { background: rgba(63,185,80,0.12);  border: 2px solid rgba(63,185,80,0.3); }
        .icon-error   { background: rgba(248,81,73,0.12);  border: 2px solid rgba(248,81,73,0.3); }

        h1 { font-family: 'Playfair Display', serif; font-size: 28px; font-weight: 800; margin-bottom: 12px; }
        .color-success { color: var(--success); }
        .color-error   { color: var(--error); }

        .sub-msg { font-size: 15px; color: var(--muted); line-height: 1.7; margin-bottom: 28px; }

        .detail-box {
            background: rgba(255,255,255,0.03); border: 1px solid var(--border);
            border-radius: 12px; padding: 16px 20px; margin-bottom: 28px;
            text-align: left; font-size: 13px; color: var(--muted); line-height: 1.7;
        }
        .detail-box strong { color: var(--text); }

        .divider { height: 1px; background: var(--border); margin-bottom: 24px; }

        .btn {
            display: block; width: 100%; padding: 13px; border-radius: 11px;
            font-family: 'Mulish', sans-serif; font-size: 14px; font-weight: 700;
            cursor: pointer; text-decoration: none; margin-bottom: 12px;
            transition: opacity 0.2s, transform 0.15s; border: none;
        }
        .btn:hover { opacity: 0.88; transform: translateY(-1px); }
        .btn-primary {
            background: linear-gradient(135deg, var(--accent), var(--accent2));
            color: #000; box-shadow: 0 4px 20px rgba(0,200,150,0.25);
        }
        .btn-secondary {
            background: transparent; border: 1.5px solid var(--border);
            color: var(--muted);
        }
    </style>
</head>
<body>

<div class="orb orb-1"></div>
<div class="orb orb-2"></div>

<div class="card">

    <%-- DEBUG: uncomment this line if still blank --%>
    <%-- Status: ${status} | Message: ${message} --%>

    <c:choose>

        <c:when test="${status == 'success'}">
            <div class="icon-wrap icon-success">✓</div>
            <h1 class="color-success">Registration Successful!</h1>
            <p class="sub-msg">${subMessage}</p>
            <div class="detail-box">
                <strong>What's next?</strong><br/>
                You can now log in with your email and password to access the POS dashboard.
            </div>
            <div class="divider"></div>
            <a href="/user/login"    class="btn btn-primary">Go to Login →</a>
            <a href="/user/register" class="btn btn-secondary">Register Another Account</a>
        </c:when>

        <c:when test="${status == 'error'}">
            <div class="icon-wrap icon-error">✕</div>
            <h1 class="color-error">Registration Failed!</h1>
            <p class="sub-msg">${subMessage}</p>
            <div class="detail-box">
                <strong>What went wrong?</strong><br/>
                ${subMessage} — Please go back and try with a different email.
            </div>
            <div class="divider"></div>
            <a href="/user/register" class="btn btn-primary">← Try Again</a>
            <a href="/user/login"    class="btn btn-secondary">Already have an account? Login</a>
        </c:when>

        <c:otherwise>
            <%-- Fallback: if status is null/empty --%>
            <div class="icon-wrap icon-error">⚠</div>
            <h1 class="color-error">Something went wrong</h1>
            <p class="sub-msg">No status received. Please try registering again.</p>
            <div class="divider"></div>
            <a href="/user/register" class="btn btn-primary">← Go Back</a>
        </c:otherwise>

    </c:choose>

</div>

</body>
</html>