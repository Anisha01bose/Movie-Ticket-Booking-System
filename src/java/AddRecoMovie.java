/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author dbuname dbpass
 */
@MultipartConfig(maxFileSize = 16177215) // 16 MB
public class AddRecoMovie extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String[] checkboxValues = request.getParameterValues("movtype");
        String ty=checkboxValues[0];
        for (int i=1;i<checkboxValues.length;i++) {
                        ty=ty+"/"+checkboxValues[i];
}
        int l=ty.length();
        ty=ty.substring(0,l);

        Connection conn = null;
        String message = null;

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Open a connection
            conn = DriverManager.getConnection("dburl", "dbuname", "dbpass");

            // Insert the movie into the database
            String sql = "INSERT INTO reco(name, type,movie_type,poster) values (?, ?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, type);
            statement.setString(3, ty);
            Part filePart = request.getPart("Poster"); // Retrieves <input type="file" name="file">
            InputStream fileContent = filePart.getInputStream();
            String fileName = filePart.getSubmittedFileName();
            long fileSize = filePart.getSize();
            System.out.println(fileName);
            System.out.println(ty);
            System.out.println(type);
            statement.setBinaryStream(4, fileContent, (int) fileSize);
            if ("".equals(name) || "".equals(type)) {
                response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AddRecoMovie.jsp?status=empty");

                conn.close();
            } else if (name.length() > 30) {
                response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AddRecoMovie.jsp?status=failed");
                message = "Failed to add movie!";
            } else {
                int row = statement.executeUpdate();

                if (row > 0) {
                    message = "Movie added successfully!";
                    System.out.println(name);
                    response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/AddRecoMovie.jsp?status=success");

                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            message = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        request.setAttribute("message", message);

    }
}

