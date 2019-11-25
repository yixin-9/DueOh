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
 * Servlet implementation class RemoveAssignment
 */
@WebServlet("/RemoveAssignment")
public class RemoveAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveAssignment() {
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
		System.out.println("Hello, I am in java file11111");
		System.out.println(className);
		System.out.println(assignmentName);
		System.out.println("Hello, I am in java file");
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "jdbc:mysql://google/DueOh"
				+ "?cloudSqlInstance=cs201dueoh:us-central1:dueoh"
				+ "&socketFactory=com.google.cloud.sql.mysql.SocketFactory"
				+ "&useSSL=false"
				+ "&user=user"
				+ "&password=user";
		
		//SQL Queries
		// SQL Queries
		String deleteString = "DELETE FROM Assignment WHERE ClassName = ? AND AssignmentName = ? AND Username = ?";
		
		try {
			System.out.println("222");
			conn = DriverManager.getConnection(sql);
			ps = conn.prepareStatement(deleteString);
			ps.setString(1, className);
			ps.setString(2, assignmentName);
			ps.setString(3, username);
			ps.executeUpdate();
			System.out.println("3333");
		}//try
		catch(SQLException e) {
			e.printStackTrace();
		}//catch
		finally {
			try {
				if (rs != null) {
					rs.close();
				}//if
				if (ps != null) {
					ps.close();
				}//if
				if (conn != null) {
					conn.close();
				}//if
			}//try
			catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}//catch
		}//finally
	}//service

}//RemoveAssignment