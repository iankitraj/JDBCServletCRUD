

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Login() {
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
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String myemail = request.getParameter("email");
		String mypwd = request.getParameter("pwd");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD", "root", "807280");
			PreparedStatement ps = con.prepareStatement("select * from reg where email=? and password=?");
			ps.setString(1, myemail);
			ps.setString(2, mypwd);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				HttpSession session = request.getSession();
				session.setAttribute("session_name", rs.getString("name"));
				
				RequestDispatcher rd = request.getRequestDispatcher("/Profile.jsp");
				rd.include(request, response);
			} 
			else
			{
				
				out.println("<h3 style='color:red'>Email Id and Password did't matched</h3>");
				RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp"); 
				rd.include(request, response);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			
			out.println("<h3 style='color:red'> "+e.getMessage()+" </h3>");
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.include(request, response);
		}
	}

}
