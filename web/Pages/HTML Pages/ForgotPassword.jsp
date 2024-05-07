<%-- 
    Document   : ForgotPassword
    Created on : 3 May, 2023, 1:38:32 AM
    Author     : dbuname dbpass
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body{
                background:linear-gradient(130deg,#004e92,#000428);
                height: 1000px;
                overflow-y: hidden;
                overflow-x: hidden;
                width: 100%;
            }
              h1
            {
                text-shadow:1px 1px 10px black;
                margin: auto;
                display: block;
                margin-bottom: 25px;
                padding:2px;
                width:
                    300px;
                border-radius: 10px;
                background: linear-gradient(150deg,blueviolet,red);
            }
            form
            {
                font-family: 'Poppins',sans-serif;
                box-shadow: 1px 5px 10px rgba(0,0,0,0.5);
                margin:100px;
                padding: 25px;
                color:white;
                border-radius: 10px;
                max-width: 500px;
                max-height: 500px;
                margin-left:Auto;
                margin-right: auto;
                text-align: center;
                position: relative;
                align-items: center;
                justify-content: center;
                background: rgba(0,0,0,0.2);
                backdrop-filter:blur(10px);
                border:0.2px solid gray;
            }
            input[type=text]{
                color:White;
                background-color: rgba(255,255,255,0.02);
                box-shadow: 2px 5px 10px rgba(255,255,255,0.1);
                border:1px solid purple;
                border-radius: 5px;
                margin:10px;
                padding:10px;
                width:90%;
                height:25px;
                font-size: 15px;
                border-bottom-width: 2px;
            }
            input[type=text]:active,:focus{
                border:1px solid blue;
            }
            input[type=submit]
            {
                box-shadow: 2px 2px 15px rgba(0,0,0,0.5);
                border:none;
                margin-top: 4px;
                width: 120px;
                background: linear-gradient(135deg, red,  purple);
                color: #ffffff;
                padding: 15px 0;
                font-size: 18px;
                font-weight: 400;
                border-radius: 5px;
                cursor: pointer;
                transition: .5s ease;
            }
            ::placeholder
            {
                color:lightgray;
            }
            label
            {
                display: block;
                font-size: 20px;
            }
            .error-message
            {
                margin:5px;
                display: block;
                color:red;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
    </head>
    <body>
        <form action="http://localhost:8080/TestProject_1/ForgotPassword" method="post" onsubmit="return validate()">
            <h1>Forgot Password</h1>
            <label for="email">Enter Your Registered Email:</label>
            <input type="text" name="email" id="email"onblur="validate()">
            <span id="err" style="color:red;font-size: 20px;display: block"></span>
            <%
                String error = request.getParameter("status");
                if (error != null && error.equals("invalid")) {
                    out.println("<span class=\"error-message\" id=\"er\">Not Registerd. Please Register Yourself</span>");
                }
            %>
            <input type="submit" value="submit">
        </form>
    </body>
    <script>
        function validate()
        {
            if (document.getElementById("email").value === "") {
                document.getElementById("err").innerHTML = "Enter your Email";
                return false;
            } else
            {
                document.getElementById("err").innerHTML = "";
                return true;
            }
        }
    </script>
</html>
