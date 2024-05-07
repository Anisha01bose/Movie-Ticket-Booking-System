<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.Instant"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>Select Movie</title>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Open+Sans:700,400');

            body{
                overflow-x: hidden;
                background-image: url("collage.png");
                margin: 0;
                padding: 0;
                background-color: black;
                font-family: 'Open Sans', sans-serif;
            }
            #container-movies{
                margin-top: 25px;
                width: 100%;
                height: 400px;
                display: flex;
                flex-wrap: wrap;
            }
            .container-movie{

                position: relative;
                margin: 5px 5px;
            }
            .movie{

                position: relative;
                width: 280px;
                height: 410px;
                transform-style: preserve-3d;
                transform: rotateY(0deg) translateZ(-130px);

                transition: all 0.5s ease-in-out;

            }
            .movie .movie-inside{
                background-color: #5e5e5e;
                position: absolute;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                z-index: 3;
                transition: all 0.5s ease-in-out;

                backface-visibility: hidden;

            }
            .container-movie .movie .front{
                box-shadow: 2px 2px 5px black;
                transform-origin: 0%;
                border-radius: 10px;

                transform: translateZ(130px);


            }
            ul
            {
                list-style-type: none;
                position: relative;
                list-style: none;
                display: inline-block;
                margin: 0;
                padding:10px;
            }
            .container-movie:hover .front{
                opacity: 1;
                transition: opacity 0.5s ease-in-out;
            }
            .container-movie .movie .back{
                box-shadow: 2px 2px 5px black;
                background-color: #080710;
                transform-origin: 100%;
                transform: rotateY(90deg) translateX(140px) translateZ(0px);
            }
            .container-movie:hover .movie{
                transform: rotateY(-78deg) translateX(-70px) translateZ(0px);
            }
            .container-movie:hover .front{
                opacity: 0;
            }

            /* MOVIE DETAILS */
            .movie-details{
                margin-top: 15px;
                width: 70%;
                height: 80%;
                background-color: #080710;
                background-color: rgba(255,255,255,0.1);
                border-radius: 20px;
                backdrop-filter: blur(10px);
                max-width: 1000px;
                padding: 20px;
                margin-left:Auto;
                margin-right:auto;

            }
            .movie-details h1{
                position:relative;
                font-size: 16px;
                font-weight: 700;
                color: WHITE;
                text-align: left;
                margin: 10px; 
                text-transform: uppercase;
            }
            .movie-details h1 span{
                font-size: 14px;
                font-weight: 400;
                color: #aaa;
                text-transform: lowercase;
            }
            .movie-tags{
                position: relative;
                margin: 0 10px;
                padding: 0;
            }
            .movie-tags li{
                background: radial-gradient(#5d85c2, #71b7e6, #5d85c2);
                position: relative;
                list-style: none;
                display: inline-block;
                margin: 0;
                padding: 3px 7px;
                border-radius: 5px;
                transition: all 0.2s ease-in-out;

            }
            .movie-tags li a{
                position: relative;
                text-decoration: none;
                font-size: 10px;
                line-height: 30px;
                text-transform: uppercase;
                color: #fff;
            }
            .movie-tags li:hover{
                background-color: #aaa;
            }
            .movie-time
            {
                color:white;
            }
            .movie-synopsis{
                color:white;
                width: 90%;
                font-size: 12px;
                line-height: 15px;
                padding: 10px;
            }
            .container-movie .movie .front .img
            {
                border-radius: 10px;
                margin-top:6%;
                justify-content: center;
                width: 100%;
                height: 100%;

            }
            .row {
                width: 100%;
                display: flex;
                margin-left: 80px;
                flex-wrap: wrap;
                float:left;
            }
            .column {

                flex: 25%;
                padding: 5px;
            }
            #book{
                background-color: #FFA500;
                color: white;
                padding: 8px 16px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 12px;
                color: #ffffff; 
            }
            .movie-snap
            {
                background-color: red;
            }
            .title
            {
                text-align: center;
                margin: auto;
                padding: 20px;
                color: white;

            }
            .glass
            {
                box-shadow: 1px 1px 15px white inset;
                background-color: rgba(255,255,255,0.1);
                border-radius: 20px;
                backdrop-filter: blur(10px);
                margin: 0 auto;
                overflow: hidden;
                min-height: 120%;
                max-width: 95%;
                padding: 10px;
                text-align: center;
            }      
            .im #logo
            {
                width:50px;
                height: 50px;
                margin-left: 10px;
                margin-top:10px;
            }

        </style>
    </head>
    <body>
        <div class="im">
            <a href="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Homepage.jsp" >
                <img id="logo" src="..\..\Images\Logo.png" >
            </a>
        </div>
        <% if (session.getAttribute("loggedInUser") != null) {%>
        <h1 class="title">MOVIES RUNNING IN VELLORE </h1>
        <div class="glass">
            <div class="row"><%
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection conn = DriverManager.getConnection("dburl", "dbuname", "dbpass");
                String query = "SELECT * FROM vellore";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                ResultSet r = null;
                while (rs.next()) {

                %>
                <div class="column">

                    <div id="container-movies">

                        <div class="container-movie">
                            <div class="movie">
                                <div class="movie-inside back" >
                                    <div class="movie-details">
                                        <div class="movie-snap"></div>
                                        <h1><%= rs.getString(1)%></h1>
                                        <ul class="movie-tags">
                                            <li><%=r.getString("movie_type")%></li>
                                        </ul>
                                        <p class="movie-synopsis"><%=r.getString(5)%></p>
                                        <%}%>
                                        <ul class="movie-time">
                                            <li>Show Time: <% int h = Integer.valueOf(rs.getString(3).substring(11, 13));
                                                String m = rs.getString(3).substring(13, 16);
                                                String timety = "A.M.";
                                                System.out.println(h);
                                                System.out.println(m);
                                                if (h > 12) {
                                                    h = h - 12;
                                                    timety = "P.M.";
                                                }
                                                String fintime = String.valueOf(h) + m + " " + timety;
                                                long t = System.currentTimeMillis();
                                                t = t + 86400000;
                                                LocalDate date = Instant.ofEpochMilli(t).atZone(ZoneId.systemDefault()).toLocalDate();
                                                DateTimeFormatter fm = DateTimeFormatter.ofPattern("dd-MM");
                                                String dt = fm.format(date);
                                                %>
                                                <br>
                                                <%=dt%>   <%=fintime%></li>
                                        </ul>



                                        <ul>
                                            <li>
                                                <form method="post" action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/SelSeat.jsp?db=<%=rs.getString(2)%>&city=<%=city%>&movie=<%=rs.getString(1)%>">
                                                    <button type="submit" id="book">BOOK YOUR SEAT</button>
                                                </form>
                                            </li>
                                        </ul>

                                    </div>
                                </div>

                            </div>
                        </div> 
                    </div>
                </div>
                <%} else {
                        response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Login.jsp?error=login");
                    }
                %>
            </div>
        </div>
    </body>
</html>