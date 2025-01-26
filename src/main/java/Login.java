import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String myemail = request.getParameter("email");
        String mypwd = request.getParameter("pwd");

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD", "root", "807280");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM reg WHERE email=? AND password=?");
            ps.setString(1, myemail);
            ps.setString(2, mypwd);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Valid user, fetch and set session attributes
                HttpSession session = request.getSession();
                session.setAttribute("session_name", rs.getString("name"));      // Name
                session.setAttribute("user_id", rs.getInt("id"));                // User ID
                session.setAttribute("user_name", rs.getString("name"));         // Name
                session.setAttribute("user_email", rs.getString("email"));       // Email
                session.setAttribute("user_password", rs.getString("password")); // Password (Optional to display)
                session.setAttribute("user_phone", rs.getString("phone"));       // Phone
                session.setAttribute("user_address", rs.getString("address"));   // Address

                // Redirect to profile page
                response.sendRedirect("Profile.jsp");
            } else {
                // Invalid credentials
                request.setAttribute("errorMessage", "Email Id and Password didn't match");
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.forward(request, response);
        }
    }
}
