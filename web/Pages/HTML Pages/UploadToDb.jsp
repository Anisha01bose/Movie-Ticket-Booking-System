<%@page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.text.SimpleDateFormat, java.util.logging.Level, java.util.logging.Logger, javax.servlet.ServletException, javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.sql.ResultSet, java.text.ParseException, javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
            private static final String DB_URL = "dburl";
            private static final String USER = "dbuname";
            private static final String PASS = "dbpass";%>
        <%HttpSession sess = request.getSession(false);
            String name = sess.getAttribute("name").toString();
            String phone = sess.getAttribute("phone").toString();
            String dob = sess.getAttribute("dob").toString();
            String email = sess.getAttribute("email").toString();
            String password = sess.getAttribute("password").toString();
            String gender = sess.getAttribute("gender").toString();
            sess.removeAttribute("otp");
            ResultSet rs = null;
            Connection conn = null;
            PreparedStatement stmt = null;

            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = dt.parse(dob);
            SimpleDateFormat dt1 = new SimpleDateFormat("dd-MM-yyyy");
            dob = dt1.format(date);

            // Prepare statement
            stmt = conn.prepareStatement("Select max(id) from users");
            rs = stmt.executeQuery();
            int id = 0;

            if (rs.next()) {
                id = rs.getInt(1);
            } else {
                id = 0;}
            System.out.println(id);
            id = id + 1;
            System.out.println(id);
            String sql = "INSERT INTO users (id,email, password,name, phone, dob, gender) VALUES (?,?, ?, ?, ?, ?,?)";
            stmt = conn.prepareStatement(sql);

            stmt.setInt(1, id);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, name);
            stmt.setString(5, phone);
            stmt.setString(6, dob);
            stmt.setString(7, gender);

            // Execute statement
            int rows = stmt.executeUpdate();
            response.sendRedirect("Login.jsp?error=success");
        %>
    </body>
</html>
