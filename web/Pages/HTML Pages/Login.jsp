<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="LoginCSS.css">
    </head>
    <body>
        <div class="img">
            <a href="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Homepage.jsp" >
                <img id="logo" src="..\..\Images\Logo.png" >
            </a>
        </div>
            <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

            <form action="http://localhost:8080/TestProject_1/LoginServlet" method="post" onsubmit="return validate()" id="form">
                            <h3>Login Here</h3>
                <label for="username">Username/Email</label>
                <input type="text" id="email" name="username" onblur="validateEmail(this)" placeholder="Enter Your Email" onfocus="emailRem()">
                <span class="span" id="emailerr"></span>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" onblur="validatePass(this)" placeholder="Enter Your Password" onfocus="passRem()">
                <span class="span" id="passerr"></span>
                
                 

                <!--                <div class="error-message">-->
                <div >
                    <br>
                    <%
                        String error = request.getParameter("error");
                        if (error != null && error.equals("invalid")) {
                            out.println("<span class=\"error-message\" id=\"er\">Invalid username or password</span>");
                        } else if (error != null && error.equals("login")) {
                            out.println("<span class=\"error-message\" id=\"er\">Login Yourself First</span>");
                        }
                        else if (error != null && error.equals("reset")) {
                            out.println("<span class=\"success-message\" id=\"er\">Reset Password Success</span>");
                        }
                        else if (error != null && error.equals("success")) {
                            out.println("<span class=\"success-message\" id=\"er\">Registration Success</span>");
                        }
                    %>
                </div>
                <!--</div>-->
                <input type="submit" value="Login" id="login-btn">
                <br>
                
                </div>
                <div class="register">
                <label for="register">Not Registered?</label>
                <a  href="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Register.jsp">
                    <input type="button" value="Register Yourself" id="reg_btn" name="register" >
                </a>
                </div>
            </form>
               
        <script src="..\JS\LoginJS.js"></script>
    </body>
</html>
