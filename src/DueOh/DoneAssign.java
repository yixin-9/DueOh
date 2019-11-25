package DueOh;

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
 * Servlet implementation class DoneAssign
 */
@WebServlet("/DoneAssign")
public class DoneAssign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoneAssign() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String className = request.getParameter("className");
		String assignmentName = request.getParameter("assignName");
		String assignLink = request.getParameter("assignLink");
		String done = request.getParameter("submitStatus");
		int doneAssign = 1;
		
		// if it was previously set to "submitted", and we want to change
		// the submit status to not submitted, change doneAssign to false
		if(done.equals("Submitted!")) {
			doneAssign = 0;
		}
		
		// to see what is being saved into database
				System.out.println(username);
				System.out.println(className);
				System.out.println(assignmentName);
				System.out.println(done);
				System.out.println(assignLink);
				System.out.println(doneAssign);
		
		// Connect to database
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "jdbc:mysql://google/DueOh"
				+ "?cloudSqlInstance=cs201dueoh:us-central1:dueoh"
				+ "&socketFactory=com.google.cloud.sql.mysql.SocketFactory"
				+ "&useSSL=false"
				+ "&user=user"
				+ "&password=user";
		
		// SQL Queries
		String updateString = "UPDATE Assignment "
				+ "SET SubmitStatus = ? "
				+ "WHERE Username = ? AND ClassName = ? AND AssignmentName = ? AND AssignLink = ?";
		
		// update 
		try {
			conn = DriverManager.getConnection(sql);
			ps = conn.prepareStatement(updateString);
			ps.setInt(1, doneAssign);
			ps.setString(2, username);
			ps.setString(3,  className);
			ps.setString(4, assignmentName);
			ps.setString(5, assignLink);
			ps.executeUpdate();
		} catch (SQLException sqle) {
			System.out.println(sqle.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}
		}

		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/profile.jsp");
		dispatch.forward(request, response);
	}

}
