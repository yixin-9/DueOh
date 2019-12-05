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
<title>DueOh! Register</title>
<style>
.error{
color:grey;

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
	String username_error = (String) session.getAttribute("username_error");
	String password_error = (String) session.getAttribute("password_error");
	if (username_error == null) {
		username_error = "";
	}
	if (password_error == null) {
		password_error = "";
	}
	session.setAttribute("password_error", null);
	session.setAttribute("username_error", null);
%>

<body>

	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/Login.jsp"> <img
			src="DueOh_logo3.png"
			style="margin-top: 10px; margin-left: 75%; width: 180px; height: 180px;" />
		</a>
		<a class="nav-link active" style=" margin-top: 10px; margin-left: 350px; display: inline-block; color: grey; font-size: 20px;"href="${pageContext.request.contextPath}/profileGuest.jsp">Guest</a>
		<a class="nav-link active" style=" margin-top: 10px; margin-left: -500px; margin-right: 150px; display: inline-block; color: grey; font-size: 20px;"href="${pageContext.request.contextPath}/Login.jsp"">Login</a>
	</nav>


<div class="container" style="background-size: 65%; background-image: url(new_reg.jpeg);">
  <div class="row">
    <div class="col-sm back">
      
    </div>
    <div class="col-sm offset-md-3 content">
      
		<div class="form-content">

			<form method="POST" action="Register">
				<table>
					<tr>
					<br>
						<p
							style="margin-left: 30px; margin-bottom: 10px; color: white;font-size: 35px;">
							Sign Up 
						</p>
						<p
							style="margin-left: -70px; margin-bottom: 10px; color: white;font-size: 20px;">
							<b>Welcome! Let's do our homework &#9996; </b>
						</p>
					</tr>
					
					<tr>
						<td><input type="text" name="username" placeholder="Username" class="form-control"
							style="position: relative; font-size: 20px; top: 50%; margin-top: 25px; width: 350px; height: 40px; margin-left: -80px; border-radius: 4px; border: 2px solid white;"required></td>
						</td>
					</tr>
					<tr>
						<span class="error" id="usernameMessage"><%=username_error%></span>
						<span class="error" id="passwordMessage"><%=password_error%></span>
						<br>
					</tr>
					<tr>
						<td><input type="password" name="password"
							placeholder="Password" class="form-control"
							style="position: relative; font-size: 20px; top: 50%;  margin-top: 20px; width: 350px; height: 40px; margin-left: -80px; border-radius: 4px; border: 2px solid white;"required>
						</td>
					</tr>
					<tr>
						<td><input type="password" name="confirm_password"
							placeholder="Confirm Password" class="form-control"
							style="position: relative; font-size: 20px; top: 50%;  margin-top: 20px; width: 350px; height: 40px; margin-left: -80px; border-radius: 4px; border: 2px solid white;"required>
						</td>
					</tr>

					<tr>

						<td><button class="button-small grey_dark rounded3"
								name="registerSubmit" onclick="submit"
								style="position: relative; top: 50%; margin-top: 25px; display: inline-block; margin-left: 50px; border-radius: 5px; font-size: 16px;">
								Sign Up</button></td>
								
							
					</tr>
				</table>
			</form>
		</div>
	
    </div>
    
  </div>
</div>



	
</body>
</html>