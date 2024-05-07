<%-- 
    Document   : showAssigned
    Created on : 26 Apr, 2023, 1:17:22 AM
    Author     : dbuname dbpass
--%>

<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleStatement"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Assigned Movies</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                color: #333;
            }

            /* Set styles for the table header */
            .table-header {
                background-color: #333;
                color: #fff;
                height: 50px;
                line-height: 50px;
                padding: 0 20px;
                font-size: 18px;
            }

            /* Set styles for table rows */
            tr:hover {
                background-color: #f5f5f5;
            }

            /* Set styles for alternating table rows */
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            #home
            {
                background-color: #0069d9;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
                color: #ffffff;
            }
            #back
            {
                background-color: #4CAF50;;;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
                color: #ffffff;
            }
            #btn
            {
                text-align: center;
            }
            </style>
    <body>
        <%! OracleConnection oconn;
            OracleStatement ost;
            OracleResultSet ors, ostm;
            String q;
        %>
        <% String q = request.getParameter("cityy");
            String qu = "Select * from " + q;
            //STEP 1 : REGISTERING OF THE REQUIRED DRIVER WITH THE JAVA PROGRAM
            DriverManager.registerDriver(
                    new oracle.jdbc.OracleDriver());

            //STEP 2: INSTANTIATING THE CONNECTION OBJECT 
            oconn = (OracleConnection) DriverManager.getConnection("dburl", "dbuname", "dbpass");

            ost = (OracleStatement) oconn.createStatement();

            //STEP 5: EXECUTING THE STATEMENT AND FILL UP THE RESULTSET
            ors = (OracleResultSet) ost.executeQuery(qu);%>
            <table>
                <tr>
                    <th>Name</th>
                    <th>DB Name</th>
                    <th>Time</th>
                    <th>Amount</th>
                </tr>
       <%
                    while(ors.next())
                    {
                    %>
                <tr>
                    <%
                            for(int i = 1; i <= 4; i ++)
                            {
                        %>
                        <td><%=ors.getString(i)%></td>
                        <%
                            }
                            %>
                </tr>
                <%
                    }
                %>
        </table>
    </body>
</html>
