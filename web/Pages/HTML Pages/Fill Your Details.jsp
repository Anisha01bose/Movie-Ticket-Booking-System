<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>


        <style>
            .img #logo,a
            {
                width:50px;
                height: 50px;
                margin-top:-40px;
                left:10px;
            }
            .head
            {
                width: 100%;
                height: 5%;
                position: relative;
                text-align: center;
                color: white;

            }
            .head h1
            {

            }
            .main
            {
                color:white;
                background-color: rgba(128,128,128,0.1);

                max-width: 1200px;
                height:780px;
                position: relative;
                margin: auto;
                border-radius:10px;
                backdrop-filter: blur(10px);
                box-shadow: 2px 2px 15px rgba(0,0,0,0.5);
                box-shadow: 1px 1px 20px rgba(255,255,255,0.2) inset;

            }
            .main .left{
                box-shadow: 2px 2px 15px rgba(0,0,0,0.5);
                float: left;
                height: 100%;
                width:40%;
            }
            .main .right
            { 
                box-shadow: 2px 2px 15px rgba(0,0,0,0.5);
                height: 100%;
                float:left;
                width:60%;
            }
            .main .right label{
                display: inline;
                color:white;
                margin-left: 10%;
                margin-top: 25px;
                font-size: 25px;
                font-weight: 500;
            }
            .main .right input[disabled],textarea,select,input[type=text]
            {   
                background:rgba(0,0,0,.2);
                color: white;
                margin-left:10%;
                display: inline;
                height: 40px;
                width: 75%;
                background-color: rgba(255,255,255,0.07);
                border-radius: 3px;
                padding: 0 10px;
                margin-top: 25px;
                font-size: 20px;
                font-weight: 300;
                border: 1px solid #9b59b6;
                border-bottom-width: 2px;

            }
            .main .right input[disabled]
            {
                border:1px solid red;
                cursor:not-allowed;
            }
            .poster
            {
                opacity: .8;
            }
            body
            {
                <%! byte[] imageBytes;%>
                background:linear-gradient(130deg,#0e0f28,#000428);
                height:900px;
            }
            #sub
            {
                box-shadow: 2px 2px 15px rgba(0,0,0,0.5);
                border:none;
                margin-top: 50px;
                width: 120px;
                background: linear-gradient(135deg, #f09819,  #ff512f);
                color: #ffffff;
                padding: 15px 0;
                font-size: 18px;
                font-weight: 400;
                border-radius: 5px;
                cursor: pointer;
                transition: .5s ease;
            }
            #sub:hover
            {
                transition: .5s ease;
                color:#ffffff;
                background: linear-gradient(-135deg, #f09819,  #ff512f);
            }
            #edit
            {
                box-shadow: 2px 2px 15px rgba(0,0,0,0.5);
                border:none;
                margin-top: 50px;
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
            #edit:hover
            {

            }

            .background{
                width: 430px;
                height: 520px;
                position: absolute;
                transform: translate(-50%,-50%);
                left: 50%;
                top: 50%;
            }
            .background .shape{
                height: 200px;
                width: 200px;
                position: absolute;
                border-radius: 50%;
            }
            .shape:first-child{
                background: linear-gradient(
                    #1845ad,
                    #23a2f6
                    );
                right: -100%;
                top: -30%;
            }
            .shape:last-child{
                background: linear-gradient(
                    to left,
                    red,
                    purple
                    );
                left: 20%;
                bottom: -35%;
            }
            option
            {
                color:black;
            }
            span
            {
                color:red;
                display:block;
                margin-left:50px;
            }
        </style>
        <title>Fill Your Details</title>
    </head>
    <body>
        <div class="head">
            <h1>Confirm Your Details</h1>
        </div>
        <div class="img">
            <a href="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Homepage.jsp" >
                <img id="logo" src="..\..\Images\Logo.png" >
            </a>
        </div>
        <div class="background">
            <div class="shape"></div>
            <div class="shape"></div>
        </div>

        <%

            Connection conn = null;
            ResultSet rs, r;
            PreparedStatement stmt = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("dburl", "dbuname", "dbpass");
            String seats[] = request.getParameterValues("seat");
            String mov = request.getParameter("mov");
            request.getSession().setAttribute("mov", mov);
            request.getSession().setAttribute("seats", seats);
            HttpSession sess = request.getSession(false);
            String em = sess.getAttribute("loggedInMail").toString();
            stmt = conn.prepareStatement("select * from users where email='" + em + "'");
            Statement stm = conn.createStatement();
            rs = stmt.executeQuery();
            String ph = null;
            String nm = null;

            System.out.println(mov);
            while (rs.next()) {
                ph = rs.getString(5);
                nm = rs.getString(4);
            }
            String city = sess.getAttribute("city").toString();
            stmt = conn.prepareStatement("select amt from " + city + " where movie='" + mov + "'");
            rs = stmt.executeQuery();
            String amt = null;
            while (rs.next()) {
                amt = rs.getString("amt");
            }
        %>    
        <div class="main">
            <div class="left">
                <% String q = "Select poster from movies where name='" + mov + "'";
                    r = stm.executeQuery(q);
                    if (r.next()) {
                        // Set the content type of the response

                        // Get the image data from the result set
                        Blob imageBlob = r.getBlob("poster");
                        imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        out.write("<img class='poster' style='width:100%;height:100%;border-radius:10px;'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                    }
                %>             
            </div>
            <div class="right">


                <div class="booking-form-container">
                    <h1 style="text-align:center">Booking Details</h1>
                    <table style="width:100%">
                        <form method="post" action="" name="submitdet" onsubmit="return WinOpen(this);">
                            <tr><td style="text-align:center"><label for="name">Name:</label></td>
                                <td> <input type="text" name="name" id="name" value="<%=nm%>" disabled  ><br>
                                <span id="namerr" ></span></td>
                            
                            </tr>
                            <tr>
                                <td style="text-align:center"><label for="email">Email:</label></td>
                                <td> <input type="text" name="email" id="email" value="<%=em%>" disabled><br>
                                    <span id="emailerr" ></span></td>
                            
                            </tr>
                            <tr>
                                <td style="text-align:center"><label for="phone">Phone:</label></td>
                                <td><input type="text" name="phone" id="phone" pattern="[0-9]{10}" value="<%=ph%>" disabled>
                                    <br><span id="phoneerr" style="color:red;text-align: center;"></span></td>
                            </tr>
                            <tr>
                                <td style="text-align:center">  <label for="Movie Name">Movie:</label></td>
                                <td> <input type="text" name="mov" id="mov" value="<%=mov%>" disabled></td>
                            </tr>
                            <tr>
                                <td style="text-align:center"><label for="seats">Seats:</label></td>
                                <%
                                    String s = seats[0];
                                    int i;
                                    for (i = 1; i < seats.length; i++) {
                                        s = s + ", " + seats[i];
                                    }
                                    amt = "INR " + String.valueOf(Integer.valueOf(amt) * i);
                                %>
                                <td> <input type="text" name="seat" id="seat" value="<%=s%>" disabled></td>
                            </tr>
                            <tr>
                                <td style="text-align:center"><label for="address">Address:</label></td>
                                <td><textarea name="address" style="height:50px;" id="address" required></textarea></td>
                            </tr>
                            <tr>
                                <td style="text-align:center"><label for="amti">Amount:</label></td>
                                <td><input type="text" name="amti" value="<%=amt%>" id="amt" disabled></td>
                            </tr>
                            <tr>

                                <td style="text-align:center">  <label for="payment">Payment Method:</label></td>
                                <td> <select name="payment" id="payment" required>
                                        <option value="">--Select Payment Method--</option>
                                        <option value="CreditCard.jsp?mov=<%=mov%>&amti=<%=amt%>">Credit Card</option>
                                        <option value="DebitCard.jsp?mov=<%=mov%>&amti=<%=amt%>">Debit Card</option>
                                        <!--<option value="UPI.jsp?mov=<//%=mov%>&amti=<//%=amt%>">UPI</option>-->
                                    </select></td>
                            </tr>

                            <tr ><td style="text-align: right"><input style="margin-right:25px;" type="submit" value="Book Now" id="sub" ></td>
                                <td style="text-align: center"> <input type="button" id="edit" value="Edit Details" onclick="enable()"></td></tr>
                        </form>

                    </table>

                </div>
            </div></div>
        <script>
            function enable()
            {
                if (confirm("Do You Want to Edit Your Details") === true) {
                    document.getElementById("phone").disabled = false;
                    document.getElementById("email").disabled = false;
                    document.getElementById("name").disabled = false;
                }
            }
            function WinOpen(idval)
            {
                
                a = validateEmail(document.getElementById("email"));
                f = validatePhone(document.getElementById("phone"));
                g = validateName(document.getElementById("name"));
                if (a && f && g)
                {
                    var x = document.getElementById("payment").value;
                    document.getElementById("phone").disabled = false;
                    document.getElementById("email").disabled = false;
                    document.getElementById("name").disabled = false;
                    document.getElementById("seat").disabled = false;
                    document.getElementById("mov").disabled = false;
                    idval.action = x;
                    return true;
                } else{
                    return false;
                }
                    
            }
            function validateName(idval)
            {
                if (idval.value === "")
                {
                    document.getElementById("namerr").innerHTML = "Enter Your Name";
                    return false;
                } else
                {
                    document.getElementById("namerr").innerHTML = "";
                    return true;

                }
            }
            function validateEmail(idval)
            {
                var rege = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
                if (idval.value === "")
                {
                    document.getElementById("emailerr").innerHTML = "Email is Empty";
                    return false;
                } else
                {
                    if (idval.value.match(rege))
                    {
                        document.getElementById("emailerr").innerHTML = "";
                        return true;

                    } else
                    {
                        document.getElementById("emailerr").innerHTML = "Email is Invalid";
                        document.getElementById("emailerr").style = "color:orange";
                    }
                    return false;
                }
            }
            function validatePhone(idval)
            {
                if (idval.value === "")
                {
                    document.getElementById("phoneerr").innerHTML = "Enter A Phone Number";
                    document.getElementById("phoneerr").style = "color:red";
                    return false;

                } else
                {
                    if (idval.value.length !== 10)
                    {
                        document.getElementById("phoneerr").innerHTML = "Enter A Valid Phone Number";
                        document.getElementById("phoneerr").style = "color:orange";
                        return false;
                    } else
                    {
                        document.getElementById("phoneerr").innerHTML = "";
                        return true;

                    }
                }
            }
            function validate()
            {

            }

        </script>

    </body>
</html>