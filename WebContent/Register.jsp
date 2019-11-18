<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="login.css">
<title>DueOh! Register</title>
<style>
#usernameMessage{
margin-left:30.5%;
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

	<div class="header">
		<table>
			<tr>
				<td><a href="${pageContext.request.contextPath}/Login.jsp"><img class="logo" src="DueOh_logo2.jpg"
					style="margin-top: 30px; width: 150px; height: 150px;" /></td>
				<!-- <td><img src="7fypsQy.gif"/ style="width: 150px; height: 150px; margin-left: 900px; margin-top: 35px; border-radius: 100px;"></td> -->
			</tr>
		</table>
	</div>



	<div class="content">
		<div class="form-content">

			<form method="POST" action="Register">
				<table>
					<tr>
						<span id="usernameMessage"><%=username_error%></span>
						<span id="passwordMessage"><%=password_error%></span>
						<br>
					</tr>
					<tr>
						<p style="margin-top: -30px; margin-left: 310px;margin-bottom: -15px; color: white;"><b>Welcome! Let's do our homework &#9996; </b></p>
					</tr>
					<tr>
						<td><input type="text" name="username" placeholder="username"
							style="position: relative; font-size: 20px; left: 100%; margin-top: 20px; width: 400px; height: 30px; margin-left: -50px; border-radius: 5px; border: 2px solid white;"></td>
					</tr>
					<tr>
						<td><input type="password" name="password"
							placeholder="password"
							style="position: relative; font-size: 20px; top: 50%; left: 100%; margin-top: 20px; width: 400px; height: 30px; margin-left: -50px; border-radius: 5px; border: 2px solid white;"></td>
					</tr>
					<tr>
						<td><input type="password" name="confirm_password"
							placeholder="confirm password"
							style="position: relative; font-size: 20px; top: 50%; left: 100%; margin-top: 20px; width: 400px; height: 30px; margin-left: -50px; border-radius: 5px; border: 2px solid white;"></td>
					</tr>

					<tr>

						<td><button class="button-small grey_dark rounded3"
								name="registerSubmit" onclick="submit"
								style="position: relative; top: %50; left: 100%; margin-top: 20px; display: inline-block; margin-left: 100px; border-radius: 8px; font-size: 16px;">
								REGISTER!</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>