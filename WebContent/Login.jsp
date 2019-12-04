
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
<title>DueOh! Login</title>
<style>
#usernameMessage {
	margin-left: 30.5%;
}
.content {
	background-image: url("DueOh_Background.png");
	background-repeat: no-repeat;
	background-size: cover;
	height: 100vh;
}
</style>
</head>

<%
	String username_error = (String) session.getAttribute("username_error_Login");
	String password_error = (String) session.getAttribute("password_error_Login");
	if (username_error == null) {
		username_error = "";
	}
	if (password_error == null) {
		password_error = "";
	}
	session.setAttribute("password_error_Login", null);
	session.setAttribute("username_error_Login", null);
%>

<body>

	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/Login.jsp"> <img
			src="DueOh_logo3.png"
			style="margin-top: 10px; margin-left: 75%; width: 180px; height: 180px;" />
		</a>
		<a class="nav-link active" style=" margin-top: 10px; margin-left: 350px; display: inline-block; color: grey; font-size: 20px;"href="${pageContext.request.contextPath}/profile.jsp">Guest</a>
		<a class="nav-link active" style=" margin-top: 10px; margin-left: -500px; margin-right: 150px; display: inline-block; color: grey; font-size: 20px;"href="${pageContext.request.contextPath}/Register.jsp"">Register</a>
	</nav>


<div class="container" style="background-image: url(bg-01.jpg);">
  <div class="row">
    <div class="col-sm back">
      
    </div>
    <div class="col-sm offset-md-3 content">
      
		<div class="form-content">

			<form method="POST" action="Login">
				<table>
					<tr>
						<span id="usernameMessage"><%=username_error%></span>
						<span id="passwordMessage"><%=password_error%></span>
						<br>
					</tr>
					<tr>
						<p
							style="margin-left: 45px; margin-bottom: 10px; color: white;font-size: 35px;">
							Login 
						</p>
						<p
							style="margin-left: -50px; margin-bottom: 10px; color: white;font-size: 20px;">
							<b>Hello! Let's do our homework &#9996; </b>
						</p>
					</tr>
					<tr>
					
						<td><input type="text" name="username" placeholder="Username" class="form-control"
							style="position: relative; font-size: 20px; top: 50%; margin-top: 25px; width: 350px; height: 30px; margin-left: -80px; border-radius: 4px; border: 2px solid white;">
						</td>
					</tr>
					<tr>
						<td><input type="password" name="password"
							placeholder="Password" class="form-control"
							style="position: relative; font-size: 20px; top: 50%;  margin-top: 20px; width: 350px; height: 30px; margin-left: -80px; border-radius: 4px; border: 2px solid white;">
						</td>
					</tr>

					<tr>
					
						<td><button class="button-small grey_dark rounded3"
								type="submit"
								style="position: relative; top: 50%; margin-top: 20px; display: inline-block; margin-left: 50px; border-radius: 5px; font-size: 16px;">
								Login</button></td>
					</tr>
					<tr>
						<td><a class="nav-link active" 
							style="position: relative; top: 50%; margin-top: 10px; margin-left: 40px; display: inline-block; color: white;"
							href="${pageContext.request.contextPath}/Register.jsp"><b>Sign Up</b></a> </td>
					</tr>
				</table>
			</form>
		</div>
	
    </div>
    
  </div>
</div>
</body>
</html>