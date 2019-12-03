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

	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean invalid = false;
		HttpSession session = request.getSession(true);

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean loggedIn = false;

		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String cpass = request.getParameter("confirm_password").trim();

		if (username == null || username.length() == 0) { // If the username is empty
			invalid = true;
			session.setAttribute("username_error", "Username can't be empty. ");
		} // if
		else { // If the username is not empty
			session.setAttribute("username_error", null);
		} // else

		if (!password.equals(cpass)) { // If the password is not the same as the confirmed password
			session.setAttribute("password_error", "The passwords do not match. ");
			invalid = true;
		} // else
		else if (password == null || password.length() == 0 || cpass == null || cpass.length() == 0) { // If the
																										// password or
																										// confirmed
																										// password is
																										// empty
			invalid = true;
			session.setAttribute("password_error", "Passwords can't be empty. ");
		} // else if
		else { // If password is the same as the confirmed password
			session.setAttribute("password_error", null);
		} // else

		// if got here, means password already checked
		if (!password.isEmpty()) {
			password = HashPass.calculateHash(password);
		}

		try {
			if (!invalid) {
				// If the user typed in valid username, password and confirmed password
				// Check whether the username exists

				// connect to database
				conn = DriverManager
						.getConnection("jdbc:mysql://google/DueOh" + "?cloudSqlInstance=cs201dueoh:us-central1:dueoh"
								+ "&socketFactory=com.google.cloud.sql.mysql.SocketFactory" + "&useSSL=false"
								+ "&user=user" + "&password=user");
				ps = conn.prepareStatement("SELECT * FROM User WHERE Username=?");
				ps.setString(1, username);
				rs = ps.executeQuery();

				if (rs.next()) { // If the username has been taken
					session.setAttribute("username_error", "This username is already taken.");
					invalid = true;
				} // if
				else { // If the username hasn't been taken
					session.setAttribute("username_error", null);
				} // else
			} // if

			if (invalid) { // If the username has been taken, refresh the page and ask the user to type in
							// again
				session.setAttribute("loggedIn", false);
				session.setAttribute("loggedInUser", "");
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Register.jsp");
				dispatch.forward(request, response);
			} // if
			else {
				// If the username doesn't exist
				// Insert the new user information to the database

				// connect to database; parameter: URI+URL(server)
				ps = conn.prepareStatement("INSERT INTO User (Username, HashedPass) VALUES (?, ?)");
				ps.setString(1, username);
				ps.setString(2, password);
				ps.executeUpdate();

				// Login after registered
				loggedIn = true;
				session.setAttribute("loggedIn", loggedIn);
				session.setAttribute("loggedInUser", username);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Login.jsp"); // Go to the login
																										// page if the
																										// user register
																										// successfully
				dispatch.forward(request, response); // Forward the request
			} // else
		} // try
		catch (SQLException e) {
			e.printStackTrace();
		} // catch
		finally {
			try {
				if (rs != null) {
					rs.close();
				} // if
				if (ps != null) {
					ps.close();
				} // if
				if (conn != null) {
					conn.close();
				} // if
			} // try
			catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			} // catch
		} // finally
	}// doPost

}// Register
