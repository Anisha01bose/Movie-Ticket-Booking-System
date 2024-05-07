<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="..\CSS\AdminLoginCSS.css">

        <script>
            function validate()
            {
                if (document.getElementById("username").value === "")
                {
                    document.getElementById("passerr").innerHTML = "Email cannot be blank";
                    return false;
                }
                if (document.getElementById("password").value === "")
                {
                    document.getElementById("passerr").innerHTML = "Password cannot be blank";
                    return false;
                }
               
            }
            function valid()
            {
                x = validate();
                if (x)
                {
            <%session.invalidate();%>
                }
            }
        </script>
        <meta charset="UTF-8">
        <title>Admin Login</title>

    </head>
    <body>
        <div class="container">
            <h1>Login</h1>
            <form onsubmit="return validate()" method="post" action="http://localhost:8080/TestProject_1/AdminLogin" id='form'>
                <label for="username">Username/Email</label>
                <input type="text" id="username" name="username">
                <span id="emailerr"></span>

                <label for="password">Password</label>
                <input type="password" id="password" name="password"  >
                <span id="passerr"></span>
                <%
                    String error = request.getParameter("error");
                    if (error != null && error.equals("invalid")) {
                        out.println("<span class=\"error-message\" id=\"er\">Invalid username or password</span>");
                    }
                %>

                <input type="submit" value="Login" id="log">
            </form>
        </div>
        <br>
        <div class="homediv">
            <form action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Homepage.jsp" method="post">
                <button id="home">Homepage</button>
            </form>
        </div>

    </body>
</html>
