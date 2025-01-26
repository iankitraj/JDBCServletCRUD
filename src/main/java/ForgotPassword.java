import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ForgotPassword() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpValue = 0;
        HttpSession mySession = request.getSession();

        if (email != null && !email.trim().isEmpty()) {
            Random rand = new Random();
            otpValue = rand.nextInt(1255650);

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            javax.mail.Session session = javax.mail.Session.getInstance(props, new javax.mail.Authenticator() {
                protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                    return new javax.mail.PasswordAuthentication("iankitraj18@gmail.com", "zoevaanfoccnvptw");
                }
            });

            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("iankitraj18@gmail.com"));
                message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(email));
                message.setSubject("Your OTP for Password Reset");
                message.setText("Your OTP is: " + otpValue);
                Transport.send(message);
                System.out.println("Message sent successfully");
            } catch (MessagingException e) {
                e.printStackTrace();
                request.setAttribute("error", "Failed to send OTP. Please try again.");
                dispatcher = request.getRequestDispatcher("ForgotPassword.jsp");
                dispatcher.forward(request, response);
                return;
            }

            dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
            request.setAttribute("message", "OTP is sent to your email id");
            mySession.setAttribute("otp", otpValue);
            mySession.setAttribute("email", email);
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("error", "Invalid email address.");
            dispatcher = request.getRequestDispatcher("ForgotPassword.jsp");
            dispatcher.forward(request, response);
        }
    }
}
