package DueOh;
import java.sql.Timestamp;

public class AssignmentData {
	private String assignmentName;
	private Timestamp dueDate;
	private String className;
	private String assignLink;
	private String username;
	private boolean submitStatus;
	
	public AssignmentData(String assignmentNameVal, Timestamp dueDateVal, String classNameVal, 
			String assignLinkVal, String usernameVal, boolean submitStatus) {
		// TODO Auto-generated constructor stub
		this.assignmentName = assignmentNameVal;
		this.dueDate = dueDateVal;
		this.className = classNameVal;
		this.setAssignLink(assignLinkVal);
		this.username = usernameVal;
		this.submitStatus = submitStatus;
	}//Constructor

	public String getAssignmentName() {
		return assignmentName;
	}//getAssignmentName

	public void setAssignmentName(String assignmentName) {
		this.assignmentName = assignmentName;
	}//setAssignmentName

	public Timestamp getDueDate() {
		return dueDate;
	}//getDueDate

	public void setDueDate(Timestamp dueDate) {
		this.dueDate = dueDate;
	}//setDueDate

	public String getClassName() {
		return className;
	}//getClassName

	public void setClassName(String className) {
		this.className = className;
	}//setClassName

	public String getUsername() {
		return username;
	}//getUsername

	public void setUsername(String username) {
		this.username = username;
	}//setUsername
	
	public String getSubmitStatus() {
		if (this.submitStatus) {
			return "Submitted!";
		}//if
		else  {
			return "Not submitted yet";
		}//else
	}//getSubmitStatus
	
	public void setSubmitStatus(boolean submitStatus) {
		this.submitStatus = submitStatus;
	}//setSubmitStatus

	public String getAssignLink() {
		return assignLink;
	}

	public void setAssignLink(String assignLink) {
		this.assignLink = assignLink;
	}
	
}//AssignmentData
