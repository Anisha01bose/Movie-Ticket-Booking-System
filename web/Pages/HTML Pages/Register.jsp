<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <!---<title> Responsive Registration Form | CodingLab </title>--->
        <link rel="stylesheet" type="text/css" href="..\CSS\RegisterCSS.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <div class="container">
            
            <div class="title">Registration</div>
            <div class="content">
                <form onsubmit="return validate()" method="post" action="http://localhost:8080/TestProject_1/register">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Name</span>
                            <input type="text" placeholder="Enter your name" id="name" name="name" onblur="validateName(this)">
                            <span id="nameerr" style="color:red"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="text" placeholder="Enter your email" id="email" name="email" onblur="validateEmail(this)" >
                            <span id="emailerr" style="color:red"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Phone Number</span>
                            <input type="text" id="phone" placeholder="Enter your number" name="phone" pattern="[0-9]{10}" onblur="validatePhone(this)" >
                            <span id="phoneerr" style="color:red"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="password" id="password" name="password" placeholder="Enter your password" onblur="validatePass(this)">
                            <span id="passerr" style="color:red"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Confirm Password</span>
                            <input type="password" id="confpassword" name="password" placeholder="Confirm your password" onblur="validateConfirmPass(this)"  >
                            <span id="confpasserr" style="color:red"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Date Of Birth</span>
                            <input type="date" placeholder="Enter your DOB" name="dob" id="dob" onblur="calAge(this)" >
                            <span id="doberr" style="color:red"></span>
                        </div>
                    </div>
                    <div class="gender-details">
                        <input type="radio" name="gender" id="dot-1" value="M">
                        <input type="radio" name="gender" id="dot-2" value="F">
                        <span class="gender-title">Gender</span>
                        <div class="category">
                            <label for="dot-1">
                                <span class="dot one"></span>
                                <span class="gender">Male</span>
                            </label>
                            <label for="dot-2">
                                <span class="dot two"></span>
                                <span class="gender">Female</span>
                                <br>
                            </label>
                                </div>
                                <span id="gendererr" style="color:red"></span>
                                <div class="terms">
                                    <input type="checkbox" id="terms" name="terms" onclick="enableRegister(this)">
                                    <label >I agree to the <a href="#">terms and conditions</a></label>
                                </div>
                        </div>
                        <div class="button">
                            <input type="submit" value="Register" id="RegisterButton" disabled>
                        </div>
                    <div class="login">
                        <label for="login">Already Registered?</label>
                        <br>
                        <a href="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Login.jsp">
                            <input type="button" value="Login Yourself" id="log_btn" name="login" >
                        </a>
                    </div>
                        <div id="err">
                            <%
                                String error = request.getParameter("error");
                                if (error != null && error.equals("invalid")) {
                                    out.println("<div style='color:red;text-align:center'>Account Already Exists with the following Email</div>");
                                }
                            %>
                            </form>
                        </div>
                    </div>
            </div>
            <script src="..\JS\RegisterJS.js"></script>
    </body>
</html>
