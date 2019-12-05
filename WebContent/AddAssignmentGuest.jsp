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
body {
	margin: 0;
	padding: 0;
	position: relative;
	font-family: "Gill Sans", "Gill Sans MT", Calibri, sans-serif;
}
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
			<a class="nav-link active" style=" margin-top: 10px; margin-left: 350px; display: inline-block; color: grey; font-size: 20px;"href="${pageContext.request.contextPath}/Login.jsp">Login</a>
		 	<a class="nav-link active" style=" margin-top: 10px; margin-left: -500px; margin-right: 150px; display: inline-block; color: grey; font-size: 20px;"href="${pageContext.request.contextPath}/Register.jsp"">Register</a>
	</nav>
	
	<div class="pos-f-t">
  <div class="collapse" id="navbarToggleExternalContent">
    <div class="bg-dark p-4">
      <h4 class="text-white h4"> <a style="margin-left: 120px; margin-bottom: 10px; color: white;" href="${pageContext.request.contextPath}/Login.jsp">Please Login</a></h4>
      <span class="text-muted"><a style="margin-left: 120px; margin-bottom: 10px; font-size:15px; color: white;" href="${pageContext.request.contextPath}/Register.jsp">Register</a></span>
    
    </div>
  </div>
  <nav class="navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation" style="margin-left: 130px;">
      <span class="navbar-toggler-icon"></span>
    </button>

  </nav>


		<div class="form-content content" >
			<form method="POST" action="AddAssignmentGuest">
				<table>
					<tr>
					  <br><br>
					<p style="margin-left: 500px; margin-bottom: 10px; color: white;font-size: 20px;">
							<b>Add Your Assignment Here &#128521</b>
					</p>
					</tr>
					<tr>
						<td><input type="text" name="className"
							placeholder="Class Name"
							style="position: relative; font-size: 20px; top: 50%;  margin-top: 20px; width: 350px; height: 40px; margin-left: 500px; border-radius: 4px; border: 2px solid white;">
						</td></tr>
					<tr>
						<td><input type="text" name="assignmentName"
							placeholder="Assignment"
							style="position: relative; font-size: 20px; top: 50%;  margin-top: 20px; width: 350px; height: 40px; margin-left: 500px; border-radius: 4px; border: 2px solid white;">
						</td></tr>
					<tr>
						<%=assignExist%>
					</tr>
					<tr>
						<td><input type="datetime-local" name="dueDate"
							style="position: relative; font-size: 20px; top: 50%;  margin-top: 20px; width: 350px; height: 40px; margin-left: 500px; border-radius: 4px; border: 2px solid white;"
						required></td>
					</tr>
						
				</table>
				<button class="button-small grey_dark rounded3"
								type="submit"
								style="position: relative; top: 50%; margin-top: 20px; display: inline-block; margin-left: 500px; border-radius: 5px; font-size: 16px;">
								Add Assignment</button>
			</form>
		</div>
		
	</div>
   
  <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 
</body>
</html>