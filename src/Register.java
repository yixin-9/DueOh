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
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		String cpass = request.getParameter("confirm_password").trim();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		if(username == null || username.length() == 0) {
			invalid = true;
			session.setAttribute("username_error", "Username can't be empty. ");
		}else {
			session.setAttribute("username_error", null);
		}
		
		if(!password.equals(cpass)) {
			session.setAttribute("password_error", "The passwords do not match. ");
			invalid = true;
		}else if(password==null || password.length()==0 || 
					cpass==null || cpass.length()==0) {
			invalid = true;
			session.setAttribute("password_error", "Passwords can't be empty. ");
		}else {
			session.setAttribute("password_error", null);
		}
		
		try {
			if(!invalid) {
				// connect to database
				conn = DriverManager.getConnection("jdbc:mysql://google/DueOh"
												 + "?cloudSqlInstance=dueoh-259203:us-central1:dueoh"
												 + "&socketFactory=com.google.cloud.sql.mysql.SocketFactory"
												 + "&useSSL=false"
												 + "&user=user"
												 + "&password=user");
				ps = conn.prepareStatement("SELECT * FROM User WHERE Username=?");
				ps.setString(1, username);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					session.setAttribute("username_error", "This username is already taken.");
					invalid = true;
				}else {
					session.setAttribute("username_error", null);
				}
			}
		
			if(invalid) {
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Register.jsp");
				dispatch.forward(request, response);
				
			}else {
				// connect to database; parameter: URI+URL(server)
				ps = conn.prepareStatement("INSERT INTO User (Username, Password) VALUES (?, ?)");
				ps.setString(1, username);
				ps.setString(2, password);
				ps.executeUpdate();

				// Login after registered
				boolean loggedIn = true;
				session.setAttribute("loggedIn", loggedIn);
				session.setAttribute("loggedInUser", username);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Login.jsp");
				dispatch.forward(request, response);
			}
		}catch(SQLException e){
			e.printStackTrace();
			
		}finally {
			try {
				if (rs!= null) {
					rs.close();
				}
				if (ps!= null) {
					ps.close();
				}
				if (conn!= null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}
		}
	}

}
