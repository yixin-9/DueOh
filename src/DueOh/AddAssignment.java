package DueOh;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddAssignment")
public class AddAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddAssignment() {
		super();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String className = request.getParameter("className").trim();
		String assignmentName = request.getParameter("assignmentName");
		String dueDate = request.getParameter("dueDate");
		String assignExist = null;
		String nextPage = "/profile.jsp";

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "jdbc:mysql://google/DueOh" + "?cloudSqlInstance=dueoh-259203:us-central1:dueoh"
				+ "&socketFactory=com.google.cloud.sql.mysql.SocketFactory" + "&useSSL=false" + "&user=user"
				+ "&password=user";

		// SQL Queries
		String newEntryString = "INSERT INTO Assignment(AssignmentName, DueDate, ClassName, Username, SubmitStatus) VALUES "
				+ "(?, ?, ?, ?, 0);";
		String searchString = "SELECT * FROM Assignment WHERE Username = ? AND ClassName = ? "
				+ " AND AssignmentName = ?";
		
		try {
			conn = DriverManager.getConnection(sql);
			ps = conn.prepareStatement(searchString);
			ps.setString(1, username);
			ps.setString(2,  className);
			ps.setString(3, assignmentName);
			rs = ps.executeQuery();
			if(rs.next()) {
				// that means assignment already exist
				assignExist = "Assignment Already Exists!";
				request.setAttribute("assignExist", assignExist);
				nextPage = "/AddAssignment.jsp";
				
			}
			ps = conn.prepareStatement(newEntryString);
			ps.setString(1, assignmentName);
			ps.setString(2, dueDate);
			ps.setString(3, className);
			ps.setString(4, username);
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

		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}
