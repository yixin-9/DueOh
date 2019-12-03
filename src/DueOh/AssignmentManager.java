package DueOh;

import java.sql.*;
import java.util.ArrayList;

public class AssignmentManager {
	public static ArrayList<AssignmentData> populateField(String Username) {
		// Connect to database
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<AssignmentData> data = new ArrayList<AssignmentData>();

		String sql = "jdbc:mysql://google/DueOh" + "?cloudSqlInstance=cs201dueoh:us-central1:dueoh"
				+ "&socketFactory=com.google.cloud.sql.mysql.SocketFactory" + "&useSSL=false" + "&user=user"
				+ "&password=user";

		// SQL Queries
		String searchString = "SELECT * FROM Assignment WHERE Username = ?";

		try {
			conn = DriverManager.getConnection(sql);
			ps = conn.prepareStatement(searchString);
			ps.setString(1, Username);
			rs = ps.executeQuery();
			while (rs.next()) {
				String AssignmentNameVal = rs.getString("AssignmentName");
				Timestamp DueDateVal = rs.getTimestamp("DueDate");
				String ClassNameVal = rs.getString("ClassName");
				String AssignLinkVal = rs.getString("AssignLink");
				String UsernameVal = rs.getString("Username");
				boolean submitStatus = rs.getBoolean("submitStatus");

				AssignmentData table = new AssignmentData(AssignmentNameVal, DueDateVal, ClassNameVal, AssignLinkVal,
						UsernameVal, submitStatus);
				data.add(table);
			} // while
		} // try
		catch (SQLException sqle) {
			System.out.println(sqle.getMessage());
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
		return data;
	}
}
