
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Register Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Connect to Oracle database
            String url = "dburl";
            String user = "dbuname";
            String pass = "dbpass";
            conn = DriverManager.getConnection(url, user, pass);

            // Search for matching user in the users table
            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            // If user found, log them in
            if (rs.next()) {
                String uname = rs.getString(4); //takes out the corresponding name of the logged in user
                int id=rs.getInt(1);
                // Set session attribute to mark user as logged in
               HttpSession sess = request.getSession(true);
                sess.setAttribute("loggedInUser", uname);
                 sess.setAttribute("loggedInMail", username);
                sess.setAttribute("cid", id);

                // Set the username as a request attribute
                // Redirect to the homepage or some other secured page
                response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Homepage.jsp");
            } else {
                // If user not found, display error message
                PrintWriter out = response.getWriter();
                response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/Login.jsp?error=invalid");
                out.println("<html><body>");
                out.println("<h2>Incorrect username or password. Please try again.</h2>");
                out.println("</body></html>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
