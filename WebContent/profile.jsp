<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="DueOh.AssignmentManager" import="DueOh.*"%>

<%
	String username = (String) session.getAttribute("username");
	ArrayList<AssignmentData> table = AssignmentManager.populateField(username);
	Map<String, ArrayList<AssignmentData>> classList = new HashMap<String, ArrayList<AssignmentData>>();
	for (int i = 0; i < table.size(); i++) {
		String className = table.get(i).getClassName();
		if (classList.get(className) == null) {
			ArrayList<AssignmentData> thisClass = new ArrayList<AssignmentData>();
			classList.put(className, thisClass);
		} //if
		classList.get(className).add(table.get(i));
	} //for
	boolean clicked = false;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DueOh! Profile</title>

<style>
body {
	margin: 0;
	padding: 0;
	position: relative;
	font-family: Helvetica;
}

.logo {
	width: 40%;
	height: 40%;
	margin-left: 20%;
	margin-bottom: 5%;
}

.content {
	background-image: url("background.png");
	background-repeat: no-repeat;
	background-size: cover;
	height: 100vh;
}

p {
	font-family: "Courier New", Courier, monospace;
	font-size: 30px;
	margin-left: 20%;
}

h1 {
	font-family: "Verdana", Geneva, sans-serif;
	font-weight: normal;
	font-size: 40px;
	margin-left: 20%;
	margin-bottom: 10%;
}

.button-small {
	color: #fff !important;
	word-spacing: 0.25em;
	font-family: 'Open Sans', sans-serif;
	text-transform: uppercase;
	line-height: 22px;
	padding: 10px 10px 10px;
	text-align: center;
	display: inline-block;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background: #474747;
}

.button-small:active {
	-webkit-box-shadow: inset 0 2px 2px rgba(0, 0, 0, 0.3), inset 0 10px
		20px rgba(0, 0, 0, 0.08);
	-moz-box-shadow: inset 0 2px 2px rgba(0, 0, 0, 0.3), inset 0 10px 20px
		rgba(0, 0, 0, 0.08);
	box-shadow: inset 0 2px 2px rgba(0, 0, 0, 0.3), inset 0 10px 20px
		rgba(0, 0, 0, 0.08);
}

#class {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 70%;
	background: white;
	margin-left: 10%;
}

#class td, #class th {
	border: 1px solid #ddd;
	padding: 8px;
}

#class tr:nth-child(even) {
	background-color: #f2f2f2;
}

#class tr:hover {
	background-color: #ddd;
}

#class th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #ED7F61;
	color: white;
}
</style>

</head>
<script>
function sendAssign(className, assignName) {
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", "RemoveAssignment?className=" + className + "&assignName=" + assignName, false);
	xhttp.send();
	window.location.assign("profile.jsp");
}
function doneCheck(className, assignName, assignLink, submitStatus) {
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", "DoneAssign?className=" + className + "&assignName=" + assignName 
			+ "&assignLink=" + assignLink + "&submitStatus=" + submitStatus, false);
	xhttp.send();
	window.location.assign("profile.jsp");
}
function myFunction() {
	  var x = document.getElementById("myDIV");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
</script>
<body>


	<div class="header">
		<table>
			<tr>
				<td><a href="${pageContext.request.contextPath}/profile.jsp"><img
						class="logo" src="DueOh_logo2.jpg"
						style="margin-top: 30px; width: 150px; height: 150px;" /></td>
			</tr>
		</table>
	</div>

	<div class="content">
		<div class="form-content">
			<table>
				<tr>
					<td><p style="margin-left: 150px;">
							Welcome,<%=username%></p></td>
					<td>
						<form method="GET" action="Login.jsp">
							<td><input class="button-small" type="submit"
								value="Sign Out"
								style="position: relative; top: 50%; left: 100%; margin-top: -5px; display: inline-block; margin-left: 2px; border-radius: 8px; font-size: 12px; border-color: black; height: 38px;"></td>
						</form>
					</td>
				</tr>
		</table>		 
			<div>
			<a href="${pageContext.request.contextPath}/Calendar.jsp">Click here to see calendar!</a>
				<%
					for (Map.Entry<String, ArrayList<AssignmentData>> entry : classList.entrySet()) {
				%>
				<table></table>
				<table id="class">
					<tr>
						<th style="width: 40%;"><%=entry.getKey()%></th>
						<th></th>
					</tr>
					<tr>
						<th>Assignment</th>
						<th>Deadline</th>
						<th>Submit Status</th>
						<th> Submission Link </th>
						<th>Done!</th>
						<th id="">Remove</th>
					</tr>
					<%
						for (int i = 0; i < entry.getValue().size(); i++) {
					%>
					<tr>
						
						<td><%=entry.getValue().get(i).getAssignmentName()%></td>
						<td><%=entry.getValue().get(i).getDueDate()%></td>
						<td><%=entry.getValue().get(i).getSubmitStatus()%></td>
						<td><a href=<%=entry.getValue().get(i).getAssignLink()%> target="_blank" rel="noopener">
						 Click me to submit!</a></td>
						<td>
							<%
								session.setAttribute("username", username);
							%>
							<button type="submit" onclick="doneCheck('<%=entry.getKey()%>', 
							'<%=entry.getValue().get(i).getAssignmentName()%>',
							'<%=entry.getValue().get(i).getAssignLink()%>',
							'<%=entry.getValue().get(i).getSubmitStatus()%>')">Done!</button> 
						
						</td>
						
						<td>
							<div id ="myDIV">
							<button type="submit" onclick="sendAssign('<%=entry.getKey()%>',
							'<%=entry.getValue().get(i).getAssignmentName()%>')">Remove</button>
							</div>
						</td>
					</tr>
					
					<%
						}
					%>
					
				</table>
				<br>
				<br>
				<%
					}
				%>
			</div>
			<form method="POST" action="AddAssignment.jsp">
				<input class="button-small" type="submit" value="Add Assignment"
					style="margin-left: 900px; border-radius: 8px; font-size: 12px; border-color: black;">
			</form>
			<button class="button-small" onclick="myFunction()"
			style="margin-left: 900px; border-radius: 8px; font-size: 12px; border-color: black;">Remove Assignment</button>
		</div>
	</div>

</body>
</html>