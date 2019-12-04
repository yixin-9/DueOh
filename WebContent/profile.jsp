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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	
<title>DueOh! Profile</title>

<style>
body {
	margin: 0;
	padding: 0;
	position: relative;
	font-family: "Gill Sans", "Gill Sans MT", Calibri, sans-serif;
}

.logo {
	width: 40%;
	height: 40%;
	margin-left: 20%;
	margin-bottom: 5%;
}

.content {
	background-image: url("DueOh_Background.png");
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
	width: 80%;
	background: white;
	margin-left: 8%;
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
	background-color: #f7a46b;
	color: white;
}
</style>

</head>
<script>
	function sendAssign(className, assignName) {
		var r;
		r = confirm("Are you sure you want to remove the assignment?");
		if(r == true){
			var xhttp = new XMLHttpRequest();
			xhttp.open("GET", "RemoveAssignment?className=" + className
					+ "&assignName=" + assignName, false);
			xhttp.send();
			window.location.assign("profile.jsp");			
		}
	}
	function doneCheck(className, assignName, submitStatus) {
		console.log(submitStatus);
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "DoneAssign?className=" + className + "&assignName="
				+ assignName + "&submitStatus=" + submitStatus, false);
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

	
	<%
	for (Map.Entry<String, ArrayList<AssignmentData>> entry : classList.entrySet()) {
		for (int i = 0; i < entry.getValue().size(); i++) {
			long timeLeft = entry.getValue().get(i).getDueDate().getTime() - System.currentTimeMillis();
			if (timeLeft <= 604800000 && timeLeft >= 0) {
			GUIShapeThreads guit = new GUIShapeThreads(entry.getValue().get(i).getAssignmentName(), entry.getValue().get(i).getDueDate().getTime());
				guit.setTitle(entry.getValue().get(i).getAssignmentName());
				guit.setVisible(true);
			}
		}
	}
	%>


	
	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/profile.jsp"> <img
			src="DueOh_logo3.png"
			style="margin-top: 10px; margin-left: 75%; width: 180px; height: 180px;" />
		</a>
		<a class="nav-link active" style=" margin-top: 10px; margin-left: -500px; margin-right: 150px; display: inline-block; color: grey; font-size: 20px;"href="${pageContext.request.contextPath}/profile.jsp"">Profile</a>
	</nav>

 <div class="pos-f-t">
  <div class="collapse" id="navbarToggleExternalContent">
    <div class="bg-dark p-4">
      <h4 class="text-white h4" style="margin-left: 120px; margin-bottom: 10px; color: white;"><%=username%></h4>
       <a  style="margin-left: 120px; margin-bottom: 10px; color: white;font-size:15px;" href="${pageContext.request.contextPath}/AddAssignment.jsp" >Add Assignment</a><h6></h6>
      <span class="text-muted"><a style="margin-left: 120px; margin-bottom: 10px; font-size:15px; color: white;" href="${pageContext.request.contextPath}/Calendar.jsp">Calendar</a></span><h6></h6>
       <a  style="margin-left: 120px; margin-bottom: 10px; color: white;font-size:15px;" href="${pageContext.request.contextPath}/Metrics.jsp" >Analytics</a><h6></h6>
      <a  style="margin-left: 120px; margin-bottom: 10px; color: white;" href="${pageContext.request.contextPath}/SignOut" id="signOut" >Sign Out</a> 
      
    </div>
  </div>
  <nav class="navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation" style="margin-left: 130px;">
      <span class="navbar-toggler-icon"></span>
    </button>
    <h3 style="margin-right: 150px; margin-bottom: 10px; color: white;">Welcome,<%=username%></h3>
  </nav>
</div>
	
	
		<div class="form-content content">
			<br>
			<%
	if(table.isEmpty()) {
		%>
		<br>
		<br>
		<br>
		<br>
		<h1>Please add an assignment from the top left tab!</h1>
	<%
	}
	%>
			<div>
				<%
					for (Map.Entry<String, ArrayList<AssignmentData>> entry : classList.entrySet()) {
				%>
		
				
				
					
					<div id="accordion"> <div class="card" style="width: 75%;margin-left:10%" > <div class="card-header" id="headingOne" style="background-color: #353a40; ">
      					<h5 class="mb-0">
       				 <button class="btn btn-link" data-toggle="collapse" data-target="#collapse<%entry.getKey();%>" aria-expanded="true" aria-controls="collapseOne" style="color:white; font-size: 18px;">
          				<%=entry.getKey()%>
        			</button>
      				</h5></div>
						
					
					
					<div id="collapse<%entry.getKey();%>" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion"><div class="card-body" style="background-color: white; ">
       					<table id="class"><tr>
       					<th> Assignment </th>
						<th> Deadline </th>
						<th> Submit Status </th>
						<th> Submission Link </th>
						<th> Done! </th>
						<th id="">Remove</th>
						
					</tr>
					
					<%
						for (int i = 0; i < entry.getValue().size(); i++) {
					%>
					<tr>

						<td><%=entry.getValue().get(i).getAssignmentName()%></td>
						<td><%=entry.getValue().get(i).getDueDate()%></td>
						<td><%=entry.getValue().get(i).getSubmitStatus()%></td>
						<td><a href=<%=entry.getValue().get(i).getAssignLink()%>
							target="_blank" rel="noopener" style=" color:grey; font-size: 15px; "> Click me to submit!</a></td>
						<td>
							<%
								session.setAttribute("username", username);
							%>
							<button style="border-radius: 4px; font-size: 12px; " type="submit"
								onclick="doneCheck('<%=entry.getKey()%>', 
							'<%=entry.getValue().get(i).getAssignmentName()%>',
							'<%=entry.getValue().get(i).getSubmitStatus()%>')">Done!</button>
						</td>
						<div id = "myDIV"></div>
							<td>
									<button style="border-radius: 4px; font-size: 12px; "type="submit"
										onclick="sendAssign('<%=entry.getKey()%>',
								'<%=entry.getValue().get(i).getAssignmentName()%>')">Remove</button>
							</td>
					</tr>
</table>
					<%
						}
					%>
</div></div></div></div>
				<br> <br>
				<%
					}
				%>
			</div>
			<!-- <form method="POST" action="AddAssignment.jsp">
				<input class="button-small" type="submit" value="Add Assignment"
					style="margin-left: 900px; border-radius: 8px; font-size: 12px; border-color: black;">
			</form> -->
		</div>
	</div>

 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 

</body>
</html>
