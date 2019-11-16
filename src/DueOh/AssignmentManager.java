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
		
		String sql = "jdbc:mysql://google/DueOh"
				+ "?cloudSqlInstance=dueoh-259203:us-central1:dueoh"
				+ "&socketFactory=com.google.cloud.sql.mysql.SocketFactory"
				+ "&useSSL=false"
				+ "&user=user"
				+ "&password=user";
				
		//SQL Queries
		String searchString = "SELECT * FROM Assignment WHERE Username = ?";
		
		try {
			conn = DriverManager.getConnection(sql);
			ps = conn.prepareStatement(searchString);
			ps.setString(1, Username);
			rs = ps.executeQuery();
			while(rs.next()) {
				String AssignmentNameVal = rs.getString("AssignmentName");
				Timestamp DueDateVal = rs.getTimestamp("DueDate");
				String ClassNameVal = rs.getString("ClassName");
				String UsernameVal = rs.getString("Username");
				
				AssignmentData table = new AssignmentData(AssignmentNameVal, DueDateVal, ClassNameVal, UsernameVal);
				data.add(table);
				
			}
			
		}catch (SQLException sqle) {
			System.out.println(sqle.getMessage());
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}
		}
		return data;
	}
}
