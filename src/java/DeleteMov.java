/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;

/**
 *
 * @author dbuname dbpass
 */
public class DeleteMov extends HttpServlet {
    String vUserName, query;
    OracleConnection oconn;
    OraclePreparedStatement ost;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteReco</title>");
            out.println("</head>");
            out.println("<body>");
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

            //STEP 2: INSTANTIATING THE CONNECTION OBJECT 
            oconn = (OracleConnection) DriverManager.getConnection("dburl", "dbuname", "dbpass");
            String mov = request.getParameter("mov");

            //STEP 3: CREATING THE QUERY
            query = "delete from movies where name = ?";
            System.out.println(query);

            //STEP 4: INSTANTIATING STATEMENT OBJECT FOR EXECUTING SQL QUERIES
            ost = (OraclePreparedStatement) oconn.prepareStatement(query);

            //STEP 6: FILLING THE BLANK VALUES OF THE QUERY MARKED WITH ? 
            ost.setString(1, mov);

            //STEP 7: EXECUTING THE QUERY
            int ra = ost.executeUpdate();

            out.println("<h2>Rows affected is : " + ra + "</h2>");
            out.println("<h2 style='color:green'>Data saved successfully.........</h2>");

            ost.close();
            oconn.close();

            out.println("</body>");
            out.println("</html>");
            response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/deleteMov.jsp");
            } catch (SQLException ex) {
            Logger.getLogger(Deassign.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        }
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteReco.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteReco.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
