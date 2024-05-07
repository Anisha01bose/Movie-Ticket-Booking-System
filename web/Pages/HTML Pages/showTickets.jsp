<%@page import="java.util.Base64"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<html><head>
        <title>Show Ticket</title>

        <style>
            
            @import url("https://fonts.googleapis.com/css2?family=Staatliches&display=swap");
            @import url("https://fonts.googleapis.com/css2?family=MedievalSharp&display=swap");

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body,
            html {
                height: 100%;
                display: grid;
                font-family: "Staatliches", cursive;
                background: linear-gradient(120deg,#031637,#080710);
                color: black;
                font-size: 14px;
                letter-spacing: 0.1em;
            }
            body{
            }

            .ticket {

                background-image: url("ticket.png");
                margin-top: 50px;
                width: 900px; 
                background: black;
                margin-left: auto;
                margin-right: auto;
                display: flex;
                height:fit-content;
                border-radius: 15px;
                box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;
            }
            .ticket {
                width: 900px; 
                height:350px;
                background: black;
                margin: auto;
                display: flex;
                border-radius: 15px;
                box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;
            }
            .ticket .imge
            {
                position: absolute;
                width: 900px; 
                height:350px; 
                z-index: 0;
                opacity: .4;
                border-radius: 15px;
                background: url("ticket.png");

                background-repeat: repeat;

            }
            .left {
                
                width:700px;
                display: flex;
            }

            .image {
                z-index: 1;
                height: 350px;
                width: 250px;

                background-size: contain;
                opacity: 0.85;
            }

            .ticket .left .admit-one {
                z-index: 2;
                position: absolute;
                color: darkgray;
                height: 38%;
                padding: 0 10px;
                letter-spacing: 0.15em;
                display: flex;
                text-align: center;
                justify-content: space-around;
                writing-mode: vertical-rl;
                transform: rotate(-180deg);
            }

            .admit-one span:nth-child(odd) {
                color: white;
                font-weight: 700;
            }

            .ticket-info .ticket-number {
                position: absolute;
                margin-top:200px;
                margin-right: 400px;
                height: 50px;
                transform: rotate(-90deg);
                width: 100px;
                display: flex;
                align-items: flex-end;
                padding: 5px;
            }

            .left .ticket-info {
                margin:10px;
                z-index: 2;
                padding: 10px 20px;
                display: flex;
                width: 600px;
                font-size: 20px;
                color:White;
                flex-direction: column;
                text-align: center;
                align-items: center;
            }

            .date { z-index: 2;
                    border-top: 1px solid gray;
                    border-bottom: 1px solid gray;
                    padding: 5px 0;
                    font-weight: 700;
                    display: flex;
                    align-items: center;
                    justify-content: space-around;
            }

            .date span { z-index: 2;
                         width: 100px;
            }

            .date span:first-child {
                text-align: left;
            }

            .date span:last-child {
                text-align: right;
            }

            .date .june-29 {
                color: #d83565;
                font-size: 20px;
            }

            .show-name {
                text-shadow:1px 2px 10px black;
                z-index: 2;
                width: 95%;
                margin-left:15px;
                margin-top: 5px;
                font-size: 32px;
                font-family: "MedievalSharp";
                color: #d83565;
            }

            .show-name h1 { 
                font-size: 48px;
                font-weight: 700;
                letter-spacing: 0.1em;
                color: red;
            }

            .time { z-index: 2;
                    padding: 10px 0;
                    color: #4a437e;
                    text-align: center;
                    display: flex;
                    flex-direction: column;
                    gap: 10px;
                    color:white;
                    font-weight: 700;
            }

            .time span {
                font-weight: 400;
                color: gray;
            }
            .image .poster{
                width: 100%;
                height:100%;
            }
            .left .time {
                font-size: 16px;
            }


            .location {
                display: flex;
                justify-content: space-around;
                align-items: center;
                width: 100%;
                padding-top: 8px;
                border-top: 1px solid gray;
            }

            .location .separator {
                font-size: 20px;
            }

            .right { z-index: 2;
                     background-image: url("ticket.png");
                     width: 100%;
                     border-left: 1px dashed #fff;
            }
            .ticket-info .tick
            {
                height:100%;
            }
            .right .admit-one {
                color: darkgray;
            }

            .right .admit-one span:nth-child(2) {
                color: gray;
            }

            .right .right-info-container {
                height: 250px;
                padding: 10px 10px 10px 35px;
                display: flex;
                flex-direction: column;
                justify-content: space-around;
                align-items: center;
            }

            .right .show-name h1 {
                font-size: 18px;
            }

            .barcode {
                height: 100px;
            }

            .barcode img {
                height: 100%;
            }

            .right .ticket-number {
                color: gray;
            }

        </style>
    </head>
    <body>
        <%!String fintime;%>
        <%
            // JDBC driver and database URL
            String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
            String DB_URL = "dburl";

            // Database credentials
            String USER = "dbuname";
            String PASS = "dbpass";

            Connection conn = null;
            PreparedStatement pstmt, pst, stmts = null;

            ResultSet rs, r = null, rt = null;

            try {
                // Register JDBC driver
                Class.forName(JDBC_DRIVER);

                // Open a connection
                conn = DriverManager.getConnection(DB_URL, USER, PASS);

                // Get customer details from database
                int cid = Integer.valueOf((request.getSession().getAttribute("cid")).toString());
                String query = "SELECT name, movie, bookedseats, phno, city, amt, qr, tickid FROM customers WHERE cid = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, cid);
                rs = pstmt.executeQuery();%>
        <%
            while (rs.next()) {
        %>

        <div class="ticket">
            <div class="imge"></div>
            <div class="left">
                <div class="image">

                    <% HttpSession sess = request.getSession(false);
                        String mv = rs.getString("movie");
                        System.out.println(mv);
                        String q = "Select poster from movies where name='" + mv + "'";
                        stmts = conn.prepareStatement(q);
                        rt = stmts.executeQuery();

                        if (rt.next()) {
                            // Set the content type of the response

                            // Get the image data from the result set
                            Blob imageBlob = rt.getBlob("poster");
                            byte imageBytes[] = imageBlob.getBytes(1, (int) imageBlob.length());
                            out.write("<img class='poster' style='width:100%;height:100%;border-radius:10px;'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                        }
                    %>  
                </div>
                <p class="admit-one">

                    <span>MOVIE LOVERS</span>
                    <span>MOVIE LOVERS</span>
                    <span>MOVIE LOVERS</span>

                </p>

                <div class="ticket-info">
                    <span  style='color:white;' class='ticket-number'>#
                        <%=rs.getInt("tickid")%>
                    </span>
                    <div class="tick">

                        <div class="show-name">
                            <h1><%= rs.getString("movie")%></h1>
                        </div>
                        <%pst = conn.prepareStatement("Select * from " + rs.getString("city") + " where movie='" + rs.getString("movie") + "'");
                            r = pst.executeQuery();
                            if (r.next()) {
                        %>
                        <div class="time">
                            TIME:
                            <% int h = Integer.valueOf(r.getString(3).substring(11, 13));
                                String m = r.getString(3).substring(13, 16);
                                String timety = "A.M.";
                                System.out.println(h);
                                System.out.println(m);
                                if (h > 12) {
                                    h = h - 12;
                                    timety = "P.M.";
                                }
                                fintime = String.valueOf(h) + m + " " + timety;
                            %> <%=fintime%></p><%}%>

                        </div>
                        <p class="seats"><span>Seats: <%= rs.getString("bookedseats")%></span>
                        </p>
                        <p class="phone"><span>Phone: <%= rs.getString("phno")%></span>
                        </p>
                        <p class="amt"><span>Amount: <%= rs.getString("amt")%></span>
                        </p>
                        <p class='name'><span>Name: <%= rs.getString("name")%></span>
                        <p class="location"><span><%=rs.getString("city")%></span></p>

                    </div>
                </div>
            </div>
            <div class="right">
                <p class="admit-one">
                    <span>MOVIE LOVERS</span>
                    <span>MOVIE LOVERS</span>
                    <span>MOVIE LOVERS</span>
                </p>
                <div class="right-info-container">
                    <div class="show-name">
                        <h1><%=mv%></h1>
                    </div>
                    <div class="time">
                        <p> <%=fintime%></p>

                    </div>
                    <div class="barcode">
                        <%
                            Blob imageBlob = rs.getBlob("qr");
                            byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                            out.write("<img style='width:140px;height:140px'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                        %>                    </div>
                    <p class="ticket-number" style='color:white'>
                        #<%=rs.getInt("tickid")%>
                    </p>
                </div>
            </div>
        </div>
        <%
                }
            } catch (SQLException se) {
                // Handle errors for JDBC
                se.printStackTrace();
            } catch (Exception e) {
                // Handle errors for Class.forName
                e.printStackTrace();
            }%>
    </body>
</html>