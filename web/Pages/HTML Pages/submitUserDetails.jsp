<%-- 
    Document   : submitUserDetails
    Created on : 14 Apr, 2023, 9:01:34 PM
    Author     : dbuname dbpass
--%>

<%@page import="javax.mail.Address"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.Instant"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.mail.util.ByteArrayDataSource"%>
<%@page import="javax.activation.DataSource"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.Multipart"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="Project.QR"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!String fintime;%>
        <%
            
            HttpSession sess = request.getSession(false);
            String em1=sess.getAttribute("loggedInMail").toString();
            String mov = sess.getAttribute("mov").toString();
            String tb = sess.getAttribute("usertb").toString();
            Connection conn = null;
            PreparedStatement stmt = null, pst = null;
            ResultSet r;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("dburl", "dbuname", "dbpass");
            String em = sess.getAttribute("email").toString();
            String arr[] = (String[]) sess.getAttribute("seats");
            String st = arr[0];
            int cid = Integer.valueOf(sess.getAttribute("cid").toString());
            for (int i = 1; i < arr.length; i++) {
                st = st + ", " + arr[i];
            }
            stmt = conn.prepareStatement("Select * from users where email='" + em + "'");
            String city = tb.substring(0, tb.indexOf('_')).toUpperCase();
            String phno = sess.getAttribute("phone").toString();
            String name = sess.getAttribute("name").toString();
            String amt = sess.getAttribute("amt").toString();;
            ResultSet rs = stmt.executeQuery();
//            while (rs.next()) {
//
//            }
            stmt = conn.prepareStatement("Select max(tickid) from customers");
            rs = stmt.executeQuery();
            int id = 2523;

            if (rs.next()) {
                id = rs.getInt(1);
            }
            System.out.println(id);
            id++;
            System.out.println(id);

            System.out.println("insert into " + tb + " (name,phno,email,bookedseats)");

            stmt = conn.prepareStatement("insert into " + tb + " (name,phno,email,bookedseats) values(?,?,?,?)"); //customer details booking table
            stmt.setString(1, name);
            stmt.setString(2, phno);
            stmt.setString(3, em);
            stmt.setString(4, st);
            stmt.executeUpdate();

            stmt = conn.prepareStatement("insert into " + tb + "_seats(bookedseats) values(?)");
            int i = 0;
            while (i < arr.length) {
                stmt.setString(1, arr[i]);
                i++;
                stmt.addBatch();
            }
            pst = conn.prepareStatement("Select * from " + city + " where movie='" + mov + "'");
            r = pst.executeQuery();
            if (r.next()) {
                int h = Integer.valueOf(r.getString(3).substring(11, 13));
                String m = r.getString(3).substring(13, 16);
                String timety = "A.M.";
                System.out.println(h);
                System.out.println(m);
                if (h > 12) {
                    h = h - 12;
                    timety = "P.M.";
                }
                fintime = String.valueOf(h) + m + " " + timety;
                long t = System.currentTimeMillis();
                t = t + 86400000;
                LocalDate date = Instant.ofEpochMilli(t).atZone(ZoneId.systemDefault()).toLocalDate();
                DateTimeFormatter fm = DateTimeFormatter.ofPattern("dd-MM");
                fintime = fm.format(date) + "  " + fintime;
            }

            QR obj = new QR();
            BufferedImage bImage = obj.generateQRCodeImage("#" + String.valueOf(id) + "\n" + name + "\n" + st);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(bImage, "jpg", baos);
            baos.flush();
            byte[] imageInByteArray = baos.toByteArray();
            ByteArrayInputStream inStream = new ByteArrayInputStream(imageInByteArray);
            baos.close();

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            // Set up authenticator for SMTP
            Authenticator auth = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("gmailid", "gmailpass");
                }
            };

            // Get a session for SMTP
            Session ses = Session.getInstance(props, auth);

            // Set up message
            Message message = new MimeMessage(ses);
            message.setFrom(new InternetAddress("gmailid"));
            message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(em));
            message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(em1));
            message.setSubject("Ticket Booked Successfully!!!!");

            Multipart multipart = new MimeMultipart();
            MimeBodyPart textPart = new MimeBodyPart();
            MimeBodyPart imagePart = new MimeBodyPart();
            textPart.setText("Hello " + name.toUpperCase() + ". Your Ticket for the movie: " + mov.toUpperCase() + " has been successfully booked for seats: " + st + ".\n Your show time is:" + fintime);
            multipart.addBodyPart(textPart);
            DataSource dataSource = new ByteArrayDataSource(imageInByteArray, "image/png");
            imagePart.setDataHandler(new DataHandler(dataSource));
            imagePart.setFileName("Ticket_QR.png");
            multipart.addBodyPart(imagePart);

// add the multipart message to the email message
            message.setContent(multipart, "text/html; charset=utf-8");
            Transport transport = ses.getTransport("smtp");
            transport.connect("smtp.gmail.com", "gmailid", "gmailpass");
            transport.sendMessage(message, message.getAllRecipients());

            stmt.executeBatch();
            String paymd = request.getParameter("paymd").replace('_', ' ');
            stmt = conn.prepareStatement("insert into customers(name,phno,email,bookedseats,amt,movie,city,paymd,tickid,cid,qr,time) values(?,?,?,?,?,?,?,?,?,?,?,?)"); //customer details booking table
            stmt.setString(1, name);
            stmt.setString(2, phno);
            stmt.setString(3, em);
            stmt.setString(4, st);
            stmt.setString(5, amt);
            stmt.setString(6, mov);
            stmt.setString(7, city);
            stmt.setString(8, paymd);
            stmt.setInt(9, id);
            stmt.setInt(10, cid);
            stmt.setBinaryStream(11, inStream, inStream.available());
            stmt.setString(12, fintime);
            System.out.println(name);
            System.out.println(phno);
            System.out.println(em);
            System.out.println(st);
            System.out.println(mov);
            System.out.println(city);
            System.out.println(paymd);
            System.out.println(id);
            stmt.executeUpdate();
            String idd = String.valueOf(id);
            System.out.println(idd);
            response.sendRedirect("Ticket.jsp?tickid=" + idd);
        %>
        <h1>Your Ticket</h1>
    </body>
</html>
