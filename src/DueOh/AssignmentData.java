package DueOh;
import java.sql.Timestamp;

public class AssignmentData {
	private String assignmentName;
	private Timestamp dueDate;
	private String className;
	private String username;
	
	public AssignmentData(String assignmentNameVal, Timestamp dueDateVal, String classNameVal, String usernameVal) {
		// TODO Auto-generated constructor stub
		this.assignmentName = assignmentNameVal;
		this.dueDate = dueDateVal;
		this.className = classNameVal;
		this.username = usernameVal;
	}

	public String getAssignmentName() {
		return assignmentName;
	}

	public void setAssignmentName(String assignmentName) {
		this.assignmentName = assignmentName;
	}

	public Timestamp getDueDate() {
		return dueDate;
	}

	public void setDueDate(Timestamp dueDate) {
		this.dueDate = dueDate;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	

}
