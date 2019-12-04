<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	<link rel="stylesheet" href="login.css">
<title>Add Assignment</title>
<%
	String assignExist = (String) request.getAttribute("assignExist");
	if (assignExist == null) {
		assignExist = "";
	}
%>



<link rel="stylesheet" href="login.css">
<style>
#usernameMessage {
	margin-left: 30.5%;
}
.content {
	background-image: url("DueOh_Background.png");
	
	height: 100vh;
}
</style>
</head>
<body>
	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/Login.jsp"> <img
			src="DueOh_logo3.png"
			style="margin-top: 10px; margin-left: 75%; width: 180px; height: 180px;" />
		</a>
			<a class="nav-link active" style=" margin-top: 10px; margin-left: -500px; margin-right: 150px; display: inline-block; color: grey; font-size: 20px;"href="${pageContext.request.contextPath}/profile.jsp"">Profile</a>
	</nav>
	
	<div class="pos-f-t">
  <div class="collapse" id="navbarToggleExternalContent">
    <div class="bg-dark p-4">
      <h4 class="text-white h4"> <a style="margin-left: 120px; margin-bottom: 10px; color: white;" href="${pageContext.request.contextPath}/profile.jsp">Back to Profile</a></h4>
      <span class="text-muted"><a style="margin-left: 120px; margin-bottom: 10px; color: white;" href="${pageContext.request.contextPath}/Calendar.jsp">Calendar</a></span><h6></h6>
      <a  style="margin-left: 120px; margin-bottom: 10px; color: white;" href="${pageContext.request.contextPath}/SignOut" id="signOut" >Sign Out</a> 
      
    </div>
  </div>
  <nav class="navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation" style="margin-left: 130px;">
      <span class="navbar-toggler-icon"></span>
    </button>

  </nav>
  
<div class="container" style="background-size: 200%; background-image: url(DueOh_Background.png);">
  <div class="row">
  <div class="col-sm back">
      
    </div>
    <div class="col-sm content">
		<div class="form-content" >
			<form method="POST" action="AddAssignment">
				<table>
					<tr>
					<p style="margin-left: -250px; margin-bottom: 10px; color: white;font-size: 20px;">
							<b>Add Your Assignment Here &#128521</b>
					</p>
					</tr>
					<tr>
						<td><input type="text" name="className"
							placeholder="Class Name"
							style="position: relative; font-size: 20px; top: 50%;  margin-top: 20px; width: 350px; height: 30px; margin-left: -280px; border-radius: 4px; border: 2px solid white;">
						</td></tr>
					<tr>
						<td><input type="text" name="assignmentName"
							placeholder="Assignment"
							style="position: relative; font-size: 20px; top: 50%;  margin-top: 20px; width: 350px; height: 30px; margin-left: -280px; border-radius: 4px; border: 2px solid white;">
						</td></tr>
					<tr>
						<%=assignExist%>
					</tr>
					<tr>
						<td><input type="datetime-local" name="dueDate"
							style="position: relative; font-size: 20px; top: 50%;  margin-top: 20px; width: 350px; height: 30px; margin-left: -280px; border-radius: 4px; border: 2px solid white;"
						required></td>
					</tr>
					<tr>
						<td><input type="text" name="assignLink"
							placeholder="Assignment Link"
							style="position: relative; font-size: 20px; top: 50%;  margin-top: 20px; width: 350px; height: 30px; margin-left: -280px; border-radius: 4px; border: 2px solid white;">
						</td></tr>
				</table>
				<button class="button-small grey_dark rounded3"
								type="submit"
								style="position: relative; top: 50%; margin-top: 20px; display: inline-block; margin-left: -180px; border-radius: 5px; font-size: 16px;">
								Add Assignment</button>
			</form>
		</div>
		
	</div>
    </div>
  </div>
</body>
</html>