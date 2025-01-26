

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		PrintWriter out = response.getWriter(); // Get the writer object to output HTML content
        String myname = request.getParameter("name");       // Retrieve the 'name' input value
        String myemail = request.getParameter("email"); // Retrieve the 'email' input value
        String mypwd = request.getParameter("pwd");         // Retrieve the 'password' input value
        String myphone = request.getParameter("phone");   // Retrieve the 'phone' input value
        String myaddress = request.getParameter("address");       // Retrieve the 'address' input value

        response.setContentType("text/html"); // Set response content type to HTML

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish a connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD", "root", "807280");

            // Prepare an SQL query to insert form data into the database
            PreparedStatement ps = con.prepareStatement("INSERT INTO reg (name, email, password, phone, address) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, myname);   // Set 'name' value
            ps.setString(2, myemail); // Set 'email' value
            ps.setString(3, mypwd);     // Set 'password' value
            ps.setString(4, myphone);  // Set 'phone' value
            ps.setString(5, myaddress);    // Set 'address' value

            int count = ps.executeUpdate(); // Execute the SQL query

            // Check if the insertion was successful
            if (count > 0) {
                // Output success JSP page with a "Go Back" button
                out.println("<html><head>");
                out.println("<style>");
                out.println("body { display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #f0f8ff; font-family: Arial, sans-serif; }");
                out.println(".container { text-align: center; }");
                out.println(".container h1 { color: green; }");
                out.println(".button { text-decoration: none; color: white; background-color: #6a11cb; padding: 10px 20px; border-radius: 5px; font-size: 16px; transition: all 0.3s ease; }");
                out.println(".button:hover { background-color: #9400d3; transform: scale(1.1); }");
                out.println("</style>");
                out.println("</head><body>");
                out.println("<div class='container'>");
                out.println("<h1>User Registered Successfully!</h1>");
                out.println("<a href='Login.jsp' class='button'>Go to Log In Page</a>");
                out.println("</div>");
                out.println("</body></html>");
            } 
            else
            {
            	
                // Output failure HTML page with a "Go Back" button
                out.println("<html><head>");
                out.println("<style>");
                out.println("body { display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #f8d7da; font-family: Arial, sans-serif; }");
                out.println(".container { text-align: center; }");
                out.println(".container h1 { color: red; }");
                out.println(".button { text-decoration: none; color: white; background-color: #dc3545; padding: 10px 20px; border-radius: 5px; font-size: 16px; transition: all 0.3s ease; }");
                out.println(".button:hover { background-color: #c82333; transform: scale(1.1); }");
                out.println("</style>");
                out.println("</head><body>");
                out.println("<div class='container'>");
                out.println("<h1>Registration Failed. Please Try Again.</h1>");
                out.println("<a href='Register.jsp' class='button'>Go Back</a>");
                out.println("</div>");
                out.println("</body></html>");
            }
        } 
        catch (Exception e) 
        {
        	
            // Handle exceptions and output an error page
            e.printStackTrace();
            out.println("<html><head>");
            out.println("<style>");
            out.println("body { display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #f8d7da; font-family: Arial, sans-serif; }");
            out.println(".container { text-align: center; }");
            out.println(".container h1 { color: red; }");
            out.println(".button { text-decoration: none; color: white; background-color: #dc3545; padding: 10px 20px; border-radius: 5px; font-size: 16px; transition: all 0.3s ease; }");
            out.println(".button:hover { background-color: #c82333; transform: scale(1.1); }");
            out.println("</style>");
            out.println("</head><body>");
            out.println("<div class='container'>");
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
            out.println("<a href='Register.jsp' class='button'>Go Back</a>");
            out.println("</div>");
            out.println("</body></html>");
        }
    }
}

