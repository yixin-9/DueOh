


<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Balkan Dashboard</title>

	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Titillium+Web:400,600,700" rel="stylesheet">

	<link rel="stylesheet" href="assets/styles.css">
	<style>
	body {
		
			font-family: "Gill Sans", "Gill Sans MT", Calibri, sans-serif;
			font-size: 14px;
			background-color: white;
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
			</a> <a class="nav-link active"
				style="margin-top: 10px; margin-left: -500px; margin-right: 150px; display: inline-block; color: grey; font-size: 20px;"
				href="${pageContext.request.contextPath}/profile.jsp">Profile</a>
		</nav>
<div class="content">
		<div class="pos-f-t">
			<div class="collapse" id="navbarToggleExternalContent">
				<div class="bg-dark p-4">
					
					<h4 class="text-white h4">	
					<a style="margin-left: 130px; margin-bottom: 10px; color: white;"
						href="${pageContext.request.contextPath}/profile.jsp">Back to Profile</a></h4>
					<h6></h6>
					<span class="text-muted"><a
						style="margin-left: 130px; margin-bottom: 10px; font-size:18px;color: white;"
						href="${pageContext.request.contextPath}/AddAssignment.jsp">Add Assignment</a></span>
					<h6></h6>
					     <a  style="margin-left: 130px; margin-bottom: 10px; color: white;font-size:18px;" href="${pageContext.request.contextPath}/Calendar.jsp" >Calendar</a><h6></h6>
    
					<a style="margin-left: 130px; margin-bottom: 10px; font-size:18px; color: white;"
						href="${pageContext.request.contextPath}/SignOut" id="signOut">Sign
						Out</a>

				</div>
			</div>
			<nav class="navbar navbar-dark bg-dark">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarToggleExternalContent"
					aria-controls="navbarToggleExternalContent" aria-expanded="false"
					aria-label="Toggle navigation" style="margin-left: 130px;">
					<span class="navbar-toggler-icon"></span>
				</button>
			</nav>


	<div id="wrapper">

		<div class="content-area">
			<div class="container-fluid">
				<div class="main">

					<div class="row mt-5 mb-4">
						<div class="col-md-6">
							<div class="box">
								<div id="bar"> </div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="box">
								
								<div id="donut"> </div>
							</div>
						</div>
					</div>

					
				</div>
			</div>
		</div>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.slim.min.js"></script>
	<script src="assets/data.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts@latest"></script>
	<script src="assets/scripts.jsp"></script>

	<script>

	</script>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 
	
</body>

</html>