<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="DueOh.AssignmentManager" import="DueOh.*"%>

<!DOCTYPE html>
<html>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<head>
<meta charset="UTF-8">
<title>DueOh! Guest</title>

<% 
	Vector<String> parameters = new Vector<String>();
	parameters.add((String)session.getAttribute("className"));
	parameters.add((String)session.getAttribute("assignmentName"));
	parameters.add((String)session.getAttribute("dueDate"));

%>


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

#Welcome{
	text-align: center;
}

</style>

</head>
<script>

	$.ajax({
		url: "AddAssignmentGuest",
		data: {
			
		},
		
		success: function(result){
			var className = "<%=session.getAttribute("className")%>";
			var assignmentName = "<%=session.getAttribute("assignmentName")%>";
			var dueDate = "<%=session.getAttribute("dueDate")%>";
			console.log(className);
			console.log(assignmentName);
			console.log(dueDate);
			
		 	var content = "<table>";
			content += '<tr><td>' + className + '</td>';
			content += '<td>' + assignmentName + "</td>";
			content += '<td>' + dueDate + '</td>';
			content += '</tr></table>';
			
			$('#my-table').append(content);
		}
	})
</script>
<body>


	<div class="header">
		<table>
			<tr>
				<td><a href="${pageContext.request.contextPath}/Login.jsp"><img
						class="logo" src="DueOh_logo2.jpg"
						style="margin-top: 30px; width: 150px; height: 150px;" /></td>
			</tr>
		</table>
	</div>

	<div class="content">
		<div class="form-content">
			<table>
				<tr>
					<td id="Welcome"><p style="margin-left: 450px;">
							Welcome, Guest</p></td>
				</tr>
			</table>
			<div id = "my-table">
				<table id="class">
					<tr>
						<th style="width: 40%;">
							<%= parameters.get(0) %></th>
						<th></th>
					</tr>
					<tr>
						<th>Assignment</th>
						<th>Deadline</th>
						
					</tr>
				
					<tr>

						<td><%= parameters.get(1) %></td>
						<td><%= parameters.get(2) %></td>
						
					</tr>

					

				</table>
				
				<h3>Please Register or Login to add more classes and assignments :)</h3>
				
				<form method="POST" action="Login.jsp">
					<input class="button-small" type="submit" value="Login"
						style="margin-left: 900px; border-radius: 8px; font-size: 12px; border-color: black;">
				</form>
				
			</div>
		</div>
	</div>

</body>
</html>