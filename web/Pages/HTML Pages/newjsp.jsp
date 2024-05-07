
<html><head><style>#login-popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #000;
            padding: 20px;
            border: 1px solid #ccc;
        }
    </style>
    <script>
        var loginButton = document.getElementById("login-button");
        var loginPopup = document.getElementById("login-popup");

        loginButton.addEventListener(click, function () {
            loginPopup.style.display = "block";
        });

    </script>
</head>
<body>
    <button id="login-button">Login</button>
    <div id="login-popup">
        <form>
            <label>Username:</label>
            <input type="text" name="username">
            <label>Password:</label>
            <input type="password" name="password">
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>