
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AssignMovie")
@MultipartConfig(maxFileSize = 16177215) // 16 MB
public class AssignMovie extends HttpServlet {

    private static final long serialVersionUID = 1L;
    PreparedStatement pstmt;
    ResultSet rs, ostm;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String movie = request.getParameter("movie");
        String hour = request.getParameter("hour");
        String minutes = request.getParameter("minutes");
        String db = request.getParameter("dbname");
        int price = Integer.valueOf(request.getParameter("Amt"));
        String dbUrl = "dburl";
        String dbUser = "dbuname";
        String dbPassword = "dbpass";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword)) {
                String sq1 = "select * from vellore where movie=? OR show_time=TO_DATE(?, 'HH24:MI') OR dbname=?";
                
                pstmt = conn.prepareStatement(sq1);
                pstmt.setString(1, movie);
                 pstmt.setString(3, db);
                pstmt.setString(2, hour + ":" + minutes);
                
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AssignMovie.jsp?status=invalid");
                }

                else {
                    String sql = "INSERT INTO vellore (movie,dbname, show_time,amt) values (?, ?, TO_DATE(?, 'HH24:MI'), ?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, movie);
                    pstmt.setString(2, db);
                    pstmt.setString(3, hour + ":" + minutes);
                     pstmt.setInt(4,price);
                    pstmt.executeUpdate();
                    String tb1 = "vellore_" + db;
                    String tb2 = "vellore_" + db + "_seats";
                    pstmt = conn.prepareStatement("Create table " + tb1 + "(name varchar2(20),phno varchar2(12),email varchar2(30),bookedSeats varchar2(20))");
                    System.out.println("Create table " + tb1 + "(name varchar2(20),phno varchar2(12),email varchar2(30),bookedSeats varchar2(20))");
                    pstmt.execute();
                    pstmt = conn.prepareStatement("Create table " + tb2 + "(bookedSeats varchar2(20))");
                    System.out.println("Create table " + tb2 + "(bookedSeats varchar2(20))");
                    pstmt.execute();       
                    response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AssignMovie.jsp?status=success");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
