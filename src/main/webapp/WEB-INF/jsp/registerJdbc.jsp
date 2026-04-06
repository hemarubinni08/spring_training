<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Create Account</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;800&family=Mulish:wght@300;400;500;600&display=swap" rel="stylesheet"/>
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        :root {
            --bg: #0d1117; --surface: #161b22; --border: rgba(255,255,255,0.08);
            --accent: #00c896; --accent2: #0096ff; --text: #e6edf3;
            --muted: #7d8590; --error: #f85149; --success: #3fb950; --input-bg: #0d1117;
        }
        body {
            min-height: 100vh; background: var(--bg);
            font-family: 'Mulish', sans-serif; color: var(--text);
            display: flex; align-items: center; justify-content: center;
            padding: 24px 16px;
        }
        body::before {
            content: ''; position: fixed; inset: 0;
            background-image:
                linear-gradient(rgba(0,200,150,0.03) 1px, transparent 1px),
                linear-gradient(90deg, rgba(0,200,150,0.03) 1px, transparent 1px);
            background-size: 40px 40px; pointer-events: none; z-index: 0;
        }
        .orb { position: fixed; border-radius: 50%; filter: blur(120px); pointer-events: none; z-index: 0; animation: pulse 8s ease-in-out infinite alternate; }
        .orb-1 { width: 400px; height: 400px; background: rgba(0,200,150,0.08); top: -100px; left: -100px; }
        .orb-2 { width: 350px; height: 350px; background: rgba(0,150,255,0.07); bottom: -80px; right: -80px; animation-delay: -4s; }
        @keyframes pulse { from { transform: scale(1); opacity: 0.6; } to { transform: scale(1.15) translate(20px,-20px); opacity: 1; } }
        .container {
            position: relative; z-index: 1; display: flex; width: 100%; max-width: 980px;
            border-radius: 20px; overflow: hidden;
            border: 1px solid var(--border); box-shadow: 0 24px 80px rgba(0,0,0,0.6);
            animation: slideUp 0.6s cubic-bezier(.22,1,.36,1) both;
        }
        @keyframes slideUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }

        /* LEFT PANEL */
        .left-panel {
            width: 360px; flex-shrink: 0;
            background: linear-gradient(145deg, #0a1628 0%, #0d1f1a 50%, #0a1117 100%);
            padding: 52px 40px; display: flex; flex-direction: column;
            justify-content: space-between; border-right: 1px solid var(--border);
        }
        .logo { display: flex; align-items: center; gap: 10px; margin-bottom: 48px; }
        .logo-icon {
            width: 36px; height: 36px;
            background: linear-gradient(135deg, var(--accent), var(--accent2));
            border-radius: 10px; display: flex; align-items: center; justify-content: center;
            font-size: 16px; font-weight: 800; color: #000; font-family: 'Playfair Display', serif;
        }
        .logo-text {
            font-family: 'Playfair Display', serif; font-size: 20px; font-weight: 700;
            background: linear-gradient(135deg, var(--accent), var(--accent2));
            -webkit-background-clip: text; -webkit-text-fill-color: transparent;
        }
        .left-panel h2 {
            font-family: 'Playfair Display', serif; font-size: 32px;
            font-weight: 800; line-height: 1.2; margin-bottom: 16px;
        }
        .left-panel h2 span {
            background: linear-gradient(135deg, var(--accent), var(--accent2));
            -webkit-background-clip: text; -webkit-text-fill-color: transparent;
        }
        .left-panel p { font-size: 14px; line-height: 1.8; color: var(--muted); margin-bottom: 36px; }
        .features { display: flex; flex-direction: column; gap: 14px; }
        .feature { display: flex; align-items: center; gap: 12px; font-size: 13px; color: #8d9ba8; }
        .feature-dot {
            width: 28px; height: 28px; flex-shrink: 0;
            background: rgba(0,200,150,0.1); border: 1px solid rgba(0,200,150,0.25);
            border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 13px;
        }
        .left-footer { font-size: 12px; color: var(--muted); border-top: 1px solid var(--border); padding-top: 20px; }

        /* RIGHT PANEL */
        .right-panel { flex: 1; background: var(--surface); padding: 52px 48px; overflow-y: auto; }
        .step-tag {
            display: inline-flex; align-items: center; gap: 6px;
            background: rgba(0,200,150,0.1); border: 1px solid rgba(0,200,150,0.2);
            color: var(--accent); font-size: 11px; font-weight: 600;
            letter-spacing: 0.1em; text-transform: uppercase;
            padding: 4px 12px; border-radius: 100px; margin-bottom: 14px;
        }
        .form-header h1 { font-family: 'Playfair Display', serif; font-size: 30px; font-weight: 800; margin-bottom: 6px; }
        .form-header p { font-size: 14px; color: var(--muted); margin-bottom: 28px; }

        /* Messages */
        .msg { padding: 12px 16px; border-radius: 10px; font-size: 13px; margin-bottom: 20px; }
        .msg-error   { background: rgba(248,81,73,0.1);  border: 1px solid rgba(248,81,73,0.3);  color: var(--error); }
        .msg-success { background: rgba(63,185,80,0.1);  border: 1px solid rgba(63,185,80,0.3);  color: var(--success); }

        /* Form */
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
        .full { grid-column: 1 / -1; }
        .field { display: flex; flex-direction: column; gap: 7px; }
        label { font-size: 12px; font-weight: 600; color: var(--muted); letter-spacing: 0.07em; text-transform: uppercase; }
        input {
            background: var(--input-bg); border: 1.5px solid var(--border);
            border-radius: 10px; padding: 12px 16px; font-size: 14px;
            font-family: 'Mulish', sans-serif; color: var(--text); outline: none; width: 100%;
            transition: border-color 0.2s, box-shadow 0.2s;
        }
        input::placeholder { color: #3d444d; }
        input:focus { border-color: var(--accent); box-shadow: 0 0 0 3px rgba(0,200,150,0.1); background: #111820; }
        input.invalid { border-color: var(--error); }
        .field-error { font-size: 11px; color: var(--error); display: none; }
        .field-error.show { display: block; }

        /* Password strength */
        .strength-wrap { display: flex; gap: 4px; margin-top: 6px; }
        .seg { flex: 1; height: 3px; border-radius: 99px; background: var(--border); transition: background 0.3s; }
        .seg.w { background: #f85149; }
        .seg.m { background: #e3b341; }
        .seg.s { background: var(--accent); }

        /* Button */
        .btn-submit {
            width: 100%; margin-top: 24px; padding: 14px; border: none; border-radius: 11px;
            background: linear-gradient(135deg, var(--accent), var(--accent2));
            color: #000; font-family: 'Mulish', sans-serif; font-size: 15px; font-weight: 700;
            cursor: pointer; transition: opacity 0.2s, transform 0.15s, box-shadow 0.2s;
            box-shadow: 0 4px 20px rgba(0,200,150,0.25);
        }
        .btn-submit:hover { opacity: 0.9; transform: translateY(-1px); box-shadow: 0 8px 28px rgba(0,200,150,0.35); }
        .btn-submit:active { transform: translateY(0); }

        .divider { display: flex; align-items: center; gap: 12px; color: var(--muted); font-size: 12px; margin: 20px 0; }
        .divider::before, .divider::after { content: ''; flex: 1; height: 1px; background: var(--border); }

        .form-footer { text-align: center; margin-top: 20px; font-size: 13px; color: var(--muted); }
        .form-footer a { color: var(--accent); text-decoration: none; font-weight: 600; }

        @media (max-width: 720px) {
            .container { flex-direction: column; }
            .left-panel { width: 100%; padding: 32px 24px; }
            .right-panel { padding: 32px 24px; }
            .form-grid { grid-template-columns: 1fr; }
            .full { grid-column: 1; }
        }
    </style>
</head>
<body>

<div class="orb orb-1"></div>
<div class="orb orb-2"></div>

<div class="container">

    <!-- Left Panel -->
    <div class="left-panel">
        <div>
            <div class="logo">
                <div class="logo-icon">P</div>
                <span class="logo-text">POS System</span>
            </div>
            <h2>Start your<br/><span>journey</span> today</h2>
            <p>Create your account to access the Point of Sale system and manage your business easily.</p>
            <div class="features">
                <div class="feature"><div class="feature-dot">🔒</div> Secure & encrypted account</div>
                <div class="feature"><div class="feature-dot">⚡</div> Instant access after signup</div>
                <div class="feature"><div class="feature-dot">📊</div> Full dashboard & analytics</div>
            </div>
        </div>
        <div class="left-footer">© 2026 POS System · All rights reserved</div>
    </div>

    <!-- Right Panel -->
    <div class="right-panel">
        <div class="form-header">
            <div class="step-tag">✦ New Account</div>
            <h1>Create Account</h1>
            <p>Fill in your details below to get started</p>
        </div>

        <c:if test="${not empty successMessage}">
            <div class="msg msg-success">✓ &nbsp;${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="msg msg-error">✕ &nbsp;${errorMessage}</div>
        </c:if>

        <form:form action="registerJdbc" method="post" modelAttribute="userDto" id="regForm">
            <div class="form-grid">

                <div class="field full">
                    <label>Full Name</label>
                    <form:input path="name" id="name" placeholder="Nagarajan Balamurugan"/>
                    <span class="field-error" id="err-name">Please enter your name</span>
                </div>

                <div class="field full">
                    <label>Email Address</label>
                    <form:input path="email" id="email" placeholder="you@example.com"/>
                    <span class="field-error" id="err-email">Enter a valid email</span>
                </div>

                <div class="field">
                    <label>Phone Number</label>
                    <form:input path="phoneNo" id="phoneNo" placeholder="+91 98765 43210"/>
                    <span class="field-error" id="err-phoneNo">Required</span>
                </div>

                <div class="field">
                    <label>Username</label>
                    <form:input path="userName" id="userName" placeholder="nagarajan"/>
                    <span class="field-error" id="err-userName">Required</span>
                </div>

                <div class="field">
                    <label>Age</label>
                    <form:input path="age" id="age" placeholder="25"/>
                    <span class="field-error" id="err-age">Required</span>
                </div>

                <div class="field">
                    <label>Password</label>
                    <form:password path="password" id="password" placeholder="Min 6 characters" oninput="checkStrength(this.value)"/>
                    <div class="strength-wrap">
                        <div class="seg" id="s1"></div>
                        <div class="seg" id="s2"></div>
                        <div class="seg" id="s3"></div>
                        <div class="seg" id="s4"></div>
                    </div>
                    <span class="field-error" id="err-password">Min 6 characters</span>
                </div>

            </div>

            <div class="divider">ready to join?</div>

            <button type="submit" class="btn-submit">Create My Account →</button>
        </form:form>

        <div class="form-footer">
            Already have an account? <a href="/user/login">Sign in</a>
        </div>
    </div>
</div>

<script>
    function checkStrength(val) {
        ['s1','s2','s3','s4'].forEach(id => document.getElementById(id).className = 'seg');
        if (!val) return;
        const strong = val.length >= 10 && /[A-Z]/.test(val) && /[0-9]/.test(val) && /[^a-zA-Z0-9]/.test(val);
        const medium = val.length >= 8  && /[A-Z]/.test(val) && /[0-9]/.test(val);
        const weak   = val.length >= 6;
        const cls    = strong ? 's' : medium ? 'm' : weak ? 'w' : '';
        const count  = strong ? 4 : medium ? 3 : weak ? 2 : 0;
        for (let i = 1; i <= count; i++) document.getElementById('s'+i).classList.add(cls);
    }

    document.getElementById('regForm').addEventListener('submit', function(e) {
        let ok = true;
        function check(id, cond) {
            const el  = document.getElementById(id);
            const err = document.getElementById('err-' + id);
            el.classList.toggle('invalid', !cond);
            if (err) err.classList.toggle('show', !cond);
            if (!cond) ok = false;
        }
        check('name',     document.getElementById('name').value.trim() !== '');
        check('email',    /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(document.getElementById('email').value));
        check('phoneNo',  document.getElementById('phoneNo').value.trim() !== '');
        check('userName', document.getElementById('userName').value.trim() !== '');
        check('age',      document.getElementById('age').value.trim() !== '');
        check('password', document.getElementById('password').value.length >= 6);
        if (!ok) e.preventDefault();
    });
</script>
</body>
</html>