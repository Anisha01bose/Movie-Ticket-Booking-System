<%-- 
    Document   : PrintFromDatabaseImg
    Created on : 29 Apr, 2023, 8:23:05 PM
    Author     : dbuname dbpass
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("dburl", "dbuname", "dbpass");

            // Retrieve movies for the selected city from the database
            String query = "SELECT * FROM testimg";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Loop through the results and display each movie in a table row
            while (rs.next()) {
        %>
        <table>
            <thead>
            </thead>
            <tbody>
                <tr>
                <tr> <th><%= rs.getString(1)%></th></tr>
                <tr>
                    <td ><% //to show the image
                        Blob imageBlob = rs.getBlob("img");
                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        out.write("<img style='width:140px;height:235px'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                        %>
                    </td>
                </tr>
            </tbody>
        </table>
<%}%>
</body>
</html>
