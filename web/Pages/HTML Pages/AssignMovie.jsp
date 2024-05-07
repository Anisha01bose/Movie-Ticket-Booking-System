<%-- 
    Document   : AllocateMov
    Created on : 11 Apr, 2023, 11:25:03 PM
    Author     : dbuname dbpass
--%>
<%@page import="oracle.net.aso.C00"%>
<%@page import="oracle.jdbc.OracleStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            function openit()
            {
                if(document.getElementById("tag2").value==="")
                {
                    document.getElementById("err").innerHTML="Select a city first";
                }
                else
                {
                    document.getElementById("err").innerHTML="";
                 MyPath="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/showAssigned.jsp?cityy="+document.getElementById("tag2").value;
                 window.open(MyPath,"","toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=500,width=657");
             }
            }

            function nameValidate(idval)
            {
                reg = "^[A-Za-z0-9_]*$";
                if (idval.value.match(reg))
                {
                    document.getElementById("err").innerHTML = "";
                    return true;
                } else
                {
                    document.getElementById("err").innerHTML = "Only Letters, Digits and Underscore Allowed";
                    return false;
                }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Movie</title>
        <link rel="stylesheet" type="text/css" href="AssignMovCSS.css">
        <%! OracleConnection oconn;
            OracleStatement ost;
            OracleResultSet ors, ostm;
            String q;
        %>

    </head>
    <body>
        <div class="img">
            <a href="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Homepage.jsp" >
                <img id="logo" src="..\..\Images\Logo.png" >
            </a>
        </div>
        <h1>Assign Movie</h1>

    </a>
    <form id='form' class="container" action="http://localhost:8080/TestProject_1/AssignMovie" method="post">


        <%
            //STEP 1 : REGISTERING OF THE REQUIRED DRIVER WITH THE JAVA PROGRAM
            DriverManager.registerDriver(
                    new oracle.jdbc.OracleDriver());

            //STEP 2: INSTANTIATING THE CONNECTION OBJECT 
            oconn = (OracleConnection) DriverManager.getConnection("dburl", "dbuname", "dbpass");

            //STEP 3: CREATING THE QUERY
            q = "select * from movies";
            ost = (OracleStatement) oconn.createStatement();

            //STEP 5: EXECUTING THE STATEMENT AND FILL UP THE RESULTSET
            ors = (OracleResultSet) ost.executeQuery(q);
        %>
        <label for="tag1"> Select Movie:</label>
        <select id="tag1" name="movie">
            <option value="">--------</option>
            <%
                while (ors.next()) {

            %>
            <% out.println(ors.getString(1));%>
            <option value="<%=ors.getString(1)%><%String s=", "+ors.getString(2);%>"><%=ors.getString(1)%><%=s%></option><br>

            <%
                }
            %>
        </select>
       <input type="button" id="assign" onclick="openit()" value="View Assigned Movies">
        <span id="err" style="color:red;font-weight: bold" ></span>
        <br>
        <br>
        <label for="tag3"> Select Hour:</label>
        <select id="tag3" name="hour">
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            
        </select>
        <br>
        <label for="tag4">Select Minutes:</label>
        <select id="tag4" name="minutes">
            <option value="00">00</option>
            <option value="15">15</option>
            <option value="30">30</option>
            <option value="45">45</option>
        </select>
        <br>
        <label for="tag4">Enter a movie name for database</label>
        <input type="text" class="text" onblur="nameValidate(this)" name="dbname">
        <span id="err" style="color:red;font-weight: bold"></span>

        <br>
        <label for="tag5">Enter The Amount for Ticket:</label>
        <input type="text" name="Amt" class="text" >
       
        <%
            String error = request.getParameter("status");

            if (error != null && error.equals("success")) {
                out.println("<span class=\"success-msg\">Assigned Successfully</span>");
            } else if (error != null && error.equals("invalid")) {
                out.println("<span class=\"error-msg\">Failed To Assign. Either Time, Movie Already Assigned, Or DB Name is Already Set. Please check 'View Assigned Movie'</span>");
            }
            out.println("<br>");
        %>
        <br>
        <input type="submit" value="Assign">
    </form>
         
    <div class='homediv'>
        <form action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AdminOptions.jsp" method="post">
            <button id="home">Admin Home</button>
        </form>
    </div>

</body>
</html>
