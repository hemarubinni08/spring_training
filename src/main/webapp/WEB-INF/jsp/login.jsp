<style>
    body {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        background: #f7f7f7;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .login-box {
        background: #fff;
        padding: 30px 28px;
        width: 280px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    h2 {
        font-size: 18px;
        font-weight: 500;
        text-align: center;
        margin-bottom: 24px;
        color: #333;
    }

    .field {
        display: flex;
        flex-direction: column;
        margin-bottom: 16px;
    }

    label {
        font-size: 12px;
        color: #777;
        margin-bottom: 6px;
    }

    input {
        border: none;
        border-bottom: 1px solid #ddd;
        padding: 6px 2px;
        font-size: 14px;
        background: transparent;
        outline: none;
        transition: border-color 0.2s;
    }

    input:focus {
        border-bottom: 1px solid #000;
    }

    button {
        width: 100%;
        margin-top: 10px;
        padding: 10px;
        background: #111;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
        transition: background 0.2s;
    }

    button:hover {
        background: #333;
    }
</style>

<div class="login-box">
    <h2>Login</h2>

    <form th:action="/login" method="post">
        <div class="field">
            <label>Username</label>
            <input type="text" name="username" />
        </div>

        <div class="field">
            <label>Password</label>
            <input type="password" name="password" />
        </div>

        <button type="submit">Login</button>
    </form>
</div>