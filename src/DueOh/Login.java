package DueOh;
import DueOh.HashPass;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean invalid = false;
		HttpSession session = request.getSession(true);
		String username = request.getParameter("username").trim();    
		String password = request.getParameter("password").trim();
		
		// to hash the password 
		password = HashPass.calculateHash(password);
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			if(!invalid) {     
				// connect to database
				conn = DriverManager.getConnection("jdbc:mysql://google/DueOh"
						+ "?cloudSqlInstance=cs201dueoh:us-central1:dueoh"
						+ "&socketFactory=com.google.cloud.sql.mysql.SocketFactory"
						+ "&useSSL=false"
						+ "&user=user"
						+ "&password=user");
				
				ps = conn.prepareStatement("SELECT * FROM User WHERE Username = ?");
				ps.setString(1, username);
				rs = ps.executeQuery();
				
				if(rs.next() == false) {          //If the user name doesn't exist
					session.setAttribute("username_error_Login", "This user does not exist. ");
					invalid = true;
					session.setAttribute("loggedIn", false);
					session.setAttribute("username", "");
				}//if
				else {           //If the username exists, check whether the password is correct
					String passwordInput = rs.getString("HashedPass");
					if(passwordInput.equals(password)) {  //If the password is correct
						// login successful	
						session.setAttribute("loggedIn", true);
						session.setAttribute("username", username);
						RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/profile.jsp");
						dispatch.forward(request, response);
					}//if
					else {								//If the password is incorrect
						session.setAttribute("password_error_Login", "Incorrect password. ");
						invalid = true;
						session.setAttribute("loggedIn", false);
						session.setAttribute("username", "");
					}//else
				}//else
				
				//Go back to the homework page
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Login.jsp");
				dispatch.forward(request, response);
			}//if
		}//try
		catch(SQLException e){
			e.printStackTrace();
		}//catch
		finally {
			try {
				if (rs!= null) {
					rs.close();
				}//if
				if (ps!= null) {
					ps.close();
				}//if
				if (conn!= null) {
					conn.close();
				}//if
			}//try
			catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}//catch
		}//finally
	}//doPost
}//Login
