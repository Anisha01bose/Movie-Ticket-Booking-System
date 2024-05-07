
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.http.*;

public class ResendOTP extends HttpServlet {


    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // get form data
        HttpSession sess = request.getSession(false);

        String email = sess.getAttribute("email").toString();
        String name = sess.getAttribute("name").toString();

        try {
            // Get the OTP from your database
            Random random = new Random();

            // generate a random number between 100000 and 999999
            String otp = String.valueOf(random.nextInt(900000) + 100000);

// Set up the email session
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("gmailid", "gmailpass");
                }
            });

// Set up the email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("gmailid"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Verify Your Account");
            message.setText("Good Morning, " + name + ".\n Welcome to Movie Lovers! \n Your One-Time Password is " + otp + "\n Keep Watching! Keep Playing.");

// Send the email
            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", "anu.sin1947@gmail", "gmailpass");
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            sess.setAttribute("otp", otp);
            response.sendRedirect("http://localhost:8080/TestProject_1/Pages/HTML%20Pages/verify.jsp?email=" + email + "&again=again");

        } catch (MessagingException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//        } catch (SQLException | IOException | ClassNotFoundException | ParseException se) {
//            System.out.println(se.toString());
}
