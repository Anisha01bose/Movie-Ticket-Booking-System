<%-- 
    Document   : LogOut
    Created on : 17 Apr, 2023, 5:29:25 PM
    Author     : dbuname dbpass
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%session.invalidate();
            response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Homepage.jsp");
        %>



        <h1>Hello World!</h1>
    </body>
</html>
