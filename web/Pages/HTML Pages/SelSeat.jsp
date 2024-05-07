<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<html>
    <head>
        <title>Choose Seats </title>
        <style>
            *,*:before,*:after {
                box-sizing: border-box;
            }
            html {
                font-size: 16px;
            }

            body

            {
                background-color: #080710;
            }

            ol {
                list-style :none;
                padding: 0;
                margin: 0;
            }

            .row {

            }

            .seats {
                padding: 10px;
                display: flex;
                flex-direction: row;
                flex-wrap: nowrap;
                justify-content: center;  
            }

            .se:nth-child(9) + .lb
            {
            }
            .seat {
                display: flex;
                flex: 0 0 14.28%;
                padding: 10px;
                position: inherit;  

                &:nth-child(9)
                    {
                    margin:10px;
                    color:white;
                }
                .se {
                    position: absolute;
                    opacity: 0;
                }
                .se + .lb
                {
                    width: 50px;
                    height: 50px;
                    padding: 10px;
                    margin:10px;
                }
                .se:checked {
                    + label {
                        background: #bada55;      
                    }
                }
                .se:disabled {
                    + label {
                        background: #dddddd;
                        text-indent: -9999px;
                        overflow: hidden;
                        &:after {
                            margin-top: 10%;
                            content: "X";
                            text-indent: 0;
                            position: absolute;
                            top: 4px;
                            left: 50%;
                            transform: translate(-50%, 0%);
                        }
                        &:hover {
                            box-shadow: none;
                            cursor: not-allowed;
                        }
                    }
                }
                .lb {    
                    display: block;
                    position: relative;    
                    width: 100%;    
                    text-align: center;
                    font-size: 14px;
                    font-weight: bold;
                    line-height: 1.5rem;
                    padding: 4px 0;
                    background: #F42536;
                    border-radius: 5px;

                    &:before {
                        content: "";
                        position: absolute;
                        width: 75%;
                        height: 75%;
                        top: 4px;
                        left: 50%;
                        transform: translate(-50%, 0%);
                        background: rgba(255,255,255,.4);
                        border-radius: 3px;
                    }
                    &:hover {
                        cursor: pointer;
                        box-shadow: 0 0 0px 2px green;
                    }
                }
            }
            .sub
            {
                text-align: center;
            }
            .sub .submit:disabled
            {
                background-color: red;
            }

            .sub .submit:enabled {
                background-color: #0069d9;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }
            .glass {
                box-shadow: 1px 1px 15px rgba(255,255,255,0.5) ;
                background-color: rgba(255,255,255,0.1);
                border-radius: 20px;
                backdrop-filter: blur(10px);
                margin: 0 auto;
                overflow: hidden;
                height: 780px;
                width: 1400px;
                padding: 10px;
                text-align: center;
            }    
            .se:nth-child(9)
            {
                margin: 10px;
            }
            .glass .screen {
                display: inline-block;
                width: 20%;
                height:10px;
                background-color: whitesmoke;
                margin: 2em 0;
            }

            h2.wthree {
                display: inline-block;
                font-size: 1.2em;
                color: #fff;
                text-transform: uppercase;
                font-weight: 400;
                letter-spacing: 2px;
                word-spacing: 10px;
            }
            .title{
                position: relative;
                text-align: center;
                font-size: 1.2em;
                color: #fff;
                text-transform: uppercase;
                font-weight: 400;
                letter-spacing: 2px;
                word-spacing: 10px;
            }
        </style>
        <script>
            function en()
            {

                var x = document.getElementsByName("seat");
                var c = 0;

                for (i = 0; i < x.length; i++)
                {

                    if (x[i].checked)
                    {
                        c++;
                    }
                }

                if (c !== 0)
                {
                    if (c > 5)
                    {

                        document.getElementById("error").innerHTML = "Select Upto 5 Seats at a time";
                        return false;
                    } else
                    {
                        return true;
                    }

                } else
                {
                    document.getElementById("error").innerHTML = "Select Atleast One Seat";
                    return false;

                }
            }

        </script>
    </head>
    <body>
        <%!String mov = "";%>
            <% String tb1 = "";
                mov = request.getParameter("movie");
            %>
        <div class='title'>
        <h1 style='text-align: center' >Please select Your Seats</h1>
        </div>
        <form action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Fill%20Your%20Details.jsp?mov=<%=mov%>" method="post" onsubmit="return en()">
            
            <% List<String> bookedSeats = new ArrayList<String>();
                System.out.println(mov);
                // fetch data from database and get booked seats
                Connection conn = null;
                PreparedStatement stmt = null;
                String db = request.getParameter("db");
                String city = request.getParameter("city");

                tb1 = city + "_" + db; //data of customers
                String tb2 = tb1 + "_seats"; //booked seats
                System.out.println(tb1);
                System.out.println(tb2);

                request.getSession().setAttribute("usertb", tb1);
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("dburl", "dbuname", "dbpass");
                stmt = conn.prepareStatement("SELECT bookedseats FROM " + tb2);
                //            stmt.setString(1, movieName);
                //            stmt.setString(2, theaterName);
                //            stmt.setString(3, showTiming);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    bookedSeats.add(rs.getString("bookedseats"));
                }
            %>
            <div class="glass">
                <ol class="">
                    <% for (char i = 'A'; i <= 'F'; i++) {%>
                    <li class="row row--"<%=i%>>
                        <ol class="seats" type=<%=i%>>
                            <li class="seat">
                                <% for (int j = 1; j <= 18; j++) {
                                        String k = String.valueOf(j);
                                        String seatNumber = i + k;
                                        String disabled = "";
                                        if (bookedSeats.contains(seatNumber)) {
                                            disabled = "disabled";
                                        }
                                %>
                                <input type="checkbox" name="seat" class="se" id="<%=i%><%=k%>" value="<%=i%><%=k%>" <%= disabled%>/>
                                <label class="lb" for="<%=i%><%=k%>"><%= seatNumber%></label>
                                <% } %>
                            </li>

                        </ol>
                    </li>
                    <% }%>

                </ol>
                <div class="screen">
                    <h2 class="wthree">Screen this way</h2>
                </div>
            </div>
            <div id="error" style="color:red;font-weight: bold"></div>
            <br>
            <div class="sub">
                <button type="submit" id="submit" class="submit" >Submit</button>
            </div>
        </form>
    </body>
</html>