<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="DueOh.AssignmentManager" import="DueOh.*"%>

<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>DueOh! Guest</title>

<%
	Vector<String> parameters = new Vector<String>();
	parameters.add((String) session.getAttribute("className"));
	parameters.add((String) session.getAttribute("assignmentName"));
	parameters.add((String) session.getAttribute("dueDate"));
%>


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
	width: 100%;
	background: white;
	
}

#class td, #class th {
	border: 1px solid #ddd;
	padding: 8px;
}

/* #class tr:nth-child(even) {
	background-color: #f2f2f2;
}
#class tr:nth-child(odd) {
	background-color: #f2f2f2;
} */
#class tr:hover {
	background-color: #ddd;
}

#class th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #f2f2f2;
	color: black;
}


.content {
	background-image: url("DueOh_Background.png");
	background-repeat: no-repeat;
	background-size: cover;
	height: 100vh;
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
			var dueDate = "<%=session.getAttribute("dueDate")%>
	";
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


	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/Login.jsp"> <img
			src="DueOh_logo3.png"
			style="margin-top: 10px; margin-left: 75%; width: 180px; height: 180px;" />
		</a> <a class="nav-link active"
			style="margin-top: 10px; margin-left: 350px; display: inline-block; color: grey; font-size: 20px;"
			href="${pageContext.request.contextPath}/Login.jsp">Login</a> <a
			class="nav-link active"
			style="margin-top: 10px; margin-left: -500px; margin-right: 150px; display: inline-block; color: grey; font-size: 20px;"
			href="${pageContext.request.contextPath}/Register.jsp"">Register</a>
	</nav>

	<div class="pos-f-t">
		<div class="collapse" id="navbarToggleExternalContent">
			<div class="bg-dark p-4">
				<h4 class="text-white h4">
					<a style="margin-left: 130px; margin-bottom: 10px; color: white;"
						href="${pageContext.request.contextPath}/Login.jsp">Please
						Login</a>
				</h4>
				<span class="text-muted"><a
					style="margin-left: 130px; margin-bottom: 10px; font-size:15px; color: white;font-size: 20px;"
					href="${pageContext.request.contextPath}/Register.jsp">Register</a></span>
			</div>
		</div>
		<nav class="navbar navbar-dark bg-dark">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarToggleExternalContent"
				aria-controls="navbarToggleExternalContent" aria-expanded="false"
				aria-label="Toggle navigation" style="margin-left: 130px;">
				<span class="navbar-toggler-icon"></span>
			</button>
			<h3 style="margin-right: 150px; margin-bottom: 10px; color: white;">Welcome,
				Guest</h3>
		</nav>

		<div class="content">
			<div class="form-content">
			<br><br>
			<div id="accordion"> <div class="card" style="width: 75%;margin-left:10%" > <div class="card-header" id="headingOne" style="background-color: #353a40; ">
      					<h5 class="mb-0">
       				 <button class="btn btn-link" data-toggle="collapse" data-target="#collapse1" aria-expanded="true" aria-controls="collapseOne" style="color:white; font-size: 18px;">
          				<%=parameters.get(0)%>
        			</button>
      				</h5></div>
      				
      				<div id="collapse1" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion"><div class="card-body" style="background-color: white; ">
       					<table id="class"><tr>
       					<th> Assignment </th>
						<th> Deadline </th>
						
					</tr>
				

						<tr>

							<td><%=parameters.get(1)%></td>
							<td><%=parameters.get(2)%></td>

						</tr>



					</table>

					

				</div>
			</div></div><br>
			<h3 style="margin-left: 150px; margin-bottom: 10px; color: black;">Please Register or Login to add more classes and
						assignments :)</h3>
						
			
			</div>
			</div>
		</div>
		 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 
</body>
</html>