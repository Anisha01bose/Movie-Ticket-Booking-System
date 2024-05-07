
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Logger;
import java.util.logging.Level;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String DB_URL = "dburl";
    private static final String USER = "dbuname";
    private static final String PASS = "dbpass";

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // get form data
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String dob = request.getParameter("dob");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");

            // insert data into database
            Connection conn = null;
            PreparedStatement stmt = null;

            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.prepareStatement("Select * from users where email='" + email + "'");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Register.jsp?error=invalid");
            } else {
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
                    id = 0;
                }
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
                response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Login.jsp?error=success");
//        } catch (SQLException | IOException | ClassNotFoundException | ParseException se) {
//            System.out.println(se.toString());
            }

        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
