<%-- 
    Document   : DelReco
    Created on : 27 Apr, 2023, 6:06:16 PM
    Author     : dbuname dbpass
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script> function funSub()
            {
                if (confirm("Are you sure to remove this movie???") === true)
                    return true;
                else
                    return false;
            }
        </script>
        <style>
            /* Set styles for the table */
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Recommended Movies</title>
    </head>
    <body>

        <h1>Delete Recomended Movies</h1>
        <table>
            <tr>
                <th>Name</th>
                <th>Time</th>
                <th>Remove</th>
            </tr>

            <%
                Class.forName("oracle.jdbc.driver.OracleDriver");
                // Connect to the database
                Connection conn = DriverManager.getConnection("dburl", "dbuname", "dbpass");

                // Retrieve movies for the selected city from the database
                String query = "SELECT * FROM reco";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                // Loop through the results and display each movie in a table row
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString(1)%></td>
                <td><%= rs.getString(2)%></td>

                <td><form method="POST" action="http://localhost:8080/TestProject_1/DeleteReco?mov=<%=rs.getString(1)%>" onsubmit="return funSub()">
                        <button type="submit">Remove</button>
                    </form>
                </td>
            </tr>
        </form>
        <%
            }

            // Close the database connection
            conn.close();
        %>
    </table>
    <div class="homediv" style="text-align:center;margin-top: 15px">
        <form action="http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AdminOptions.jsp" method="post">
            <button id="home">Admin Home</button>
        </form>
    </div>
</body>
</html>
