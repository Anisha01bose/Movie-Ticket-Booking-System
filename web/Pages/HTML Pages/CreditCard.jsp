<html>

    <head>
        <script>
            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload = function () {
            };</script> 
        <style>
            @import url(https://fonts.googleapis.com/css?family=Lato:400,300,700);
            body,html {
                height:100%;
                margin:0;
                font-family:lato;
            }

            .order-info-content table{

                border-spacing: 10px;
            }
            .order-info-content th
            {   color: white;
                padding:5px;
                height:5px;
                text-align: center;
                border-bottom: 1px solid rgba(255,255,255,0.1);

            }
            .order-info-content td{
                border-radius: 5px;
                background:rgba(128,128,128,.08);
                padding:10px;
                height:10px;
                color:white;
                text-align: center;
                border: 1px solid rgba(68,136,221,1);
            }
            h2 {
                margin-bottom:0px;
                margin-top:25px;
                text-align:center;
                font-weight:400;
                font-size:19px;
                font-size:1.2rem;
                color:white;
            }
            .container {
                height:100%;

                justify-content:center;

                align-items:center;

                display:flex;
                background:linear-gradient(130deg,#0e0f28,#000428);
            }
            .dropdown-select.visible {
                display:block;
            }
            .dropdown {
                position:relative;
            }
            ul {
                margin:0;
                padding:0;
            }
            ul li {
                list-style:none;
                padding-left:10px;
                cursor:pointer;
            }
            ul li:hover {
                background:rgba(255,255,255,0.1);
            }
            .dropdown-select {
                position:absolute;
                background:#77aaee;
                text-align:left;
                box-shadow:0px 3px 5px 0px rgba(0,0,0,0.1);
                border-bottom-right-radius:5px;
                border-bottom-left-radius:5px;
                width:90%;
                left:2px;
                line-height:2em;
                margin-top:2px;
                box-sizing:border-box;
            }
            .thin {
                font-weight:600;
            }
            .small {
                font-size:12px;
                font-size:.8rem;
            }
            .window {
                height:540px;
                width:800px;
                background-color: rgba(128,128,128,0.1);
                display:-webkit-box;
                display:-webkit-flex;
                display:-ms-flexbox;
                display:flex;
                backdrop-filter: blur(10px);
                box-shadow: 8px 5px 25px rgba(128, 128,128, 0.2) inset;
                border-radius:30px;
                z-index:10;
            }
            .order-info {
                height:100%;
                width:50%;
                padding-left:25px;
                padding-right:25px;
                box-sizing:border-box;
                display:flex;
                justify-content:center;
                position:relative;
            }
            .price {
                bottom:0px;
                position:absolute;
                right:0px;
                color:#4488dd;
            }
            .line {
                height:1px;
                width:100%;
                margin-top:10px;
                margin-bottom:10px;
                background:#ddd;
            }

            .pay-btn {
                border:none;
                background:#22b877;
                line-height:2em;
                border-radius:10px;
                font-size:19px;
                font-size:1.2rem;
                color:#fff;
                cursor:pointer;
                position:absolute;
                bottom:25px;
                width:calc(100% - 50px);
                -webkit-transition:all .2s ease;
                transition:all .2s ease;
            }
            .pay-btn:hover {
                background:#22a877;
                color:#eee;
                -webkit-transition:all .2s ease;
                transition:all .2s ease;
            }

            .order-info-content .total {
                margin:auto;
                margin-top:25px;

                font-size:25px;
                width:85%;
                padding: 8px;
                color:white;
                font-weight: 600;
                display:flex;
                right:15px;
                text-align: center;
                border-radius:10px;
                text-shadow:2px 2px 10px black;
                background: linear-gradient(135deg, red,  purple);
            }
            .dense {
                line-height:1.2em;
                font-size:16px;
                font-size:1rem;
            }
            .input-field {
                background:rgba(255,255,255,0.1);
                margin-bottom:10px;
                margin-top:3px;
                line-height:1.5em;
                font-size:20px;
                font-size:1.3rem;
                border:none;
                padding:5px 10px 5px 10px;
                color:#fff;
                box-sizing:border-box;
                width:100%;
                margin-left:auto;
                margin-right:auto;
            }
            .credit-info {
                background:rgba(68,136,221,0.8);
                height:100%;
                width:50%;
                color:#eee;
                justify-content:center;
                font-size:14px;
                font-size:.9rem;
                display:-webkit-box;
                display:-webkit-flex;
                display:-ms-flexbox;
                display:flex;
                box-sizing:border-box;
                padding-left:25px;
                padding-right:25px;
                border-top-right-radius:30px;
                border-bottom-right-radius:30px;
                position:relative;
            }
            .dropdown-btn {
                background:rgba(255,255,255,0.1);
                width:100%;
                border-radius:5px;
                text-align:center;
                line-height:1.5em;
                cursor:pointer;
                position:relative;
                -webkit-transition:background .2s ease;
                transition:background .2s ease;
            }
            .dropdown-btn:after {
                content: '\25BE';
                right:8px;
                position:absolute;
            }
            .dropdown-btn:hover {
                background:rgba(255,255,255,0.2);
                -webkit-transition:background .2s ease;
                transition:background .2s ease;
            }
            .dropdown-select {
                display:none;
            }
            .credit-card-image {
                display:block;
                max-height:80px;
                margin-left:auto;
                margin-right:auto;
                margin-top:35px;
                margin-bottom:15px;
            }
            .half-input-table
            {
                color:white;
            }
            .credit-info-content {
                margin-top:25px;
                -webkit-flex-flow:column;
                -ms-flex-flow:column;
                flex-flow:column;
                display:-webkit-box;
                display:-webkit-flex;
                display:-ms-flexbox;
                display:flex;
                width:100%;
            }
            @media (max-width: 600px) {
                .window {
                    width: 100%;
                    height: 100%;
                    display:block;
                    border-radius:0px;
                }
                .order-info {
                    width:100%;
                    height:auto;
                    padding-bottom:100px;
                    border-radius:0px;
                }
                .credit-info {
                    width:100%;
                    height:auto;
                    padding-bottom:100px;
                    border-radius:0px;
                }
                .pay-btn {
                    border-radius:0px;
                }
            }
            .err
            {
                color:red;
                font-size: 15px;
            }
            .er
            {
                display: flex;
                justify-content: space-between;
            }
        </style>
        <title>Credit Card </title>
    </head>
    <body><div class='container'>
            <div class='window'>
                <div class='order-info'>
                    <div class='order-info-content'>
                        <h2>Billing Details</h2>
                        <div class='line'></div>
                        <form action="submitUserDetails.jsp?paymd=Credit_" method="post" onsubmit="return validate()">
                            <table class='order-table'>
                                <tbody>
                                    <tr>
                                        <th>
                                            <%
                                                String mov = request.getParameter("mov");
                                                String name = request.getParameter("name");
                                                String phone = request.getParameter("phone");
                                                String email = request.getParameter("email");
                                                String seats = request.getParameter("seat");
                                                String address = request.getParameter("address");
                                                String amt = request.getParameter("amti");
                                                request.getSession(false).setAttribute("name", name);
                                                request.getSession(false).setAttribute("phone", phone);
                                                request.getSession(false).setAttribute("email", email);
                                                request.getSession(false).setAttribute("amt", amt);
                                                System.out.println(amt);

                                            %>
                                            <span class='thin'>Name</span></th>
                                        <td><span ><%=name%></span></td>
                                    </tr>
                                    <tr>
                                        <th> <span class='thin'>Phone</span></th>
                                        <td><span ><%=phone%></span></td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <span class='thin'>Email</span></th>
                                        <td><span value="<%=email%>"><%=email%></span></td>
                                    </tr>
                                </tbody>
                                <tr>
                                    <th><span class='thin'>Movie</span></th>
                                    <td><span ><%=mov%></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span class='thin'>Seats</span></th>
                                    <td> <span ><%=seats%></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span class='thin'>Address</span></th>
                                    <td>    <span ><%=address%></span>
                                    </td>
                                </tr>

                            </table>
                            <div class="total">
                                <span >Amount Payable   </span>
                                <span style="margin-left:5px;color:#70eaff">  <%=amt%></span>

                            </div>
                    </div>
                </div>

                <div class='credit-info'>
                    <div class='credit-info-content'>
                        <img src='../../Images/CreditCard.png' height='80' class='credit-card-image' id='credit-card-image'></img>
                        Card Number
                        <input class='input-field' id="nm" pattern="^[0-9]*$" onblur="checkNum(this)">
                        <span class="err" id="numerr"></span>
                        Card Holder
                        <input class='input-field'  pattern="^[A-Za-z ]*$" id="name" onblur="checkNm(this)"></input>
                        <span class="err" id="nmerr"></span>
                        <table class='half-input-table'>
                            <tr>
                                <td> Expires
                                    <input type="month" id="ex" class='input-field' onblur="checkDate(this)">

                                </td>
                                <td>CVC
                                    <input class='input-field' id="cvv" pattern="^[0-9]*$"  onblur="checkCVV(this)">

                                </td>
                            </tr>

                        </table>
                        <div class="er">
                            <span style="text-align:left" class="err" id="exerr"></span>
                            <span style="text-align:right" class="err" id="cvverr"></span>
                        </div>
                        <button class='pay-btn' type="submit">Checkout</button>

                    </div>

                </div>
                </form>
            </div>
        </div>
        <script>
            function checkDate(idval)
            {
                var date = idval.value;
                var varDate = new Date(date); //dd-mm-YYYY
                var today = new Date();
                if (varDate >= today) {
                    document.getElementById("exerr").innerHTML = "";
                } else
                {
                    document.getElementById("exerr").innerHTML = "Enter a valid date";
                    return false;
                }
            }
            function checkNm(idval)
            {
                if (idval.value === "")
                {
                    document.getElementById("nmerr").innerHTML = "Enter the Card Holder Name";
                    return false;
                } else
                {

                    document.getElementById("nmerr").innerHTML = "";
                    return true;
                }
            }
            function checkNum(idval)
            {

                if (idval.value.length !== 16)
                {

                    document.getElementById("numerr").innerHTML = "Enter a valid Card Number";
                    return false;
                } else
                {

                    document.getElementById("numerr").innerHTML = "";
                    return true;
                }
            }
            function checkCVV(idval)
            {
                if (idval.value.length !== 3)
                {

                    document.getElementById("cvverr").innerHTML = "Enter a valid CVC";
                    return false;
                } else
                {

                    document.getElementById("cvverr").innerHTML = "";
                    return true;

                }
            }
            function validate()
            {
                a = checkCVV(document.getElementById("cvv"));
                b = checkNum(document.getElementById("nm"));
                c = checkDate(document.getElementById("ex"));
                d = checkNm(document.getElementById("name"));
                return(a && b && c);
            }
        </script>
    </body>
</html>