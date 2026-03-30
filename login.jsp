<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f8f9fa; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-container { background: white; padding: 24px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,.1); width: 320px; }
        .login-container h2 { margin-top: 0; }
        .login-container input { width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ccc; border-radius: 4px; }
        .login-container button { width: 100%; padding: 10px; background: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .login-container .error { color: #b00020; margin-top: 8px; }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            boolean loginSuccess = false;
            String errorMessage = null;

            if (username != null && password != null) {
                username = username.trim();
                password = password.trim();
                boolean valid = "admin".equals(username) && "admin123".equals(password);
                if (valid) {
                    session.setAttribute("user", username);
                    loginSuccess = true;
                } else {
                    errorMessage = "Invalid username or password. Try \"admin\" / \"admin123\".";
                }
            }
        %>

        <%
            if (loginSuccess) {
        %>
                <h3>Thank you for login</h3>
                <p>Welcome, <strong><%= username %></strong>.</p>
        <%
            } else {
        %>
                <form method="post" onsubmit="return validateAndSubmit();">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter username" required>

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter password" required>

                    <button type="submit">Sign In</button>
                    <div id="error" class="error"></div>
                </form>

                <% if (errorMessage != null) { %>
                    <p class="error"><%= errorMessage %></p>
                <% } %>
        <%
            }
        %>
    </div>
    <script>
        function validateAndSubmit() {
            var user = document.getElementById('username').value.trim();
            var pwd = document.getElementById('password').value.trim();
            var errorEl = document.getElementById('error');
            if (!user || !pwd) {
                errorEl.textContent = 'Please enter both username and password.';
                return false;
            }
            if (user.length < 3 || user.length > 30) {
                errorEl.textContent = 'Username must be between 3 and 30 characters.';
                return false;
            }
            if (pwd.length < 4 || pwd.length > 50) {
                errorEl.textContent = 'Password must be between 4 and 50 characters.';
                return false;
            }
            return true;
        }
    </script>
</body>
</html>