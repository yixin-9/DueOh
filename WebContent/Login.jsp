<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="login.css">
<title>DueOh! Login</title>
<style>
#usernameMessage{
margin-left:30.5%;
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

	<div class="header">
		<table>
			<tr>
				<td><a href="${pageContext.request.contextPath}/Login.jsp"><img class="logo" src="DueOh_logo.png" style="margin-top: 30px;" /></td>
			</tr>
		</table>
	</div>

	<div class="content">
		<div class="form-content">

			<form method="POST" action="Login">
				<table>
					<tr>
						<span id="usernameMessage"><%=username_error%></span>
						<span id="passwordMessage"><%=password_error%></span>
						<br>
					</tr>
					<tr>
						<td><input type="text" name="username" placeholder="username"
							style="position: relative; font-size: 20px; top: 50%; left: 100%; margin-top: 20px; width: 400px; height: 30px;">
						</td>
					</tr>
					<tr>
						<td><input type="password" name="password" placeholder="password"
							style="position: relative; font-size: 20px; top: 50%; left: 100%; margin-top: 20px; width: 400px; height: 30px;">
						</td>
					</tr>

					<tr>
						<td><button class="button-small grey_dark rounded3" type="submit"
								style="position: relative; top: 50%; left: 100%; margin-top: 20px; display: inline-block">
								Login</button>
						</td>
						<td>
						
						<button class="button-small grey_dark rounded3" 
							style="position: relative; top: 50%; left: 100%; margin-top: 20px; margin-left: 42px; display: inline-block">
							<a style="color: white; text-decoration: none;"href="${pageContext.request.contextPath}/Register.jsp">Create new account</a></button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>