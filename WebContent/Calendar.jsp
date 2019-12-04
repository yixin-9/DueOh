<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="DueOh.AssignmentManager" import="DueOh.AssignmentData"
    %>
<%
		int mapSize = 0;
    	String username = (String) session.getAttribute("username");
    	ArrayList<AssignmentData> table = AssignmentManager.populateField(username);
    	Map<String, ArrayList<AssignmentData> > classList = new HashMap<String, ArrayList<AssignmentData> >();
    	for (int i = 0; i < table.size(); i++) {
    		String className = table.get(i).getClassName();
    		if (classList.get(className) == null) {
    			ArrayList<AssignmentData> thisClass = new ArrayList<AssignmentData>();
    			classList.put(className, thisClass);
    		}//if
    		classList.get(className).add(table.get(i));
    		mapSize++;
    	}//for
    %>    
    
    
    
    <html lang='en'>
<head>
    <meta charset='utf-8' />
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

	
	<link href='fullcalendar/packages/core/main.css' rel='stylesheet' />
	<link href='fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
	<link href='fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
	<link href='fullcalendar/packages/list/main.css' rel='stylesheet' />
	
	<script src='fullcalendar/packages/core/main.js'></script>
	<script src='fullcalendar/packages/interaction/main.js'></script>
	<script src='fullcalendar/packages/daygrid/main.js'></script>
	<script src='fullcalendar/packages/timegrid/main.js'></script>
	<script src='fullcalendar/packages/list/main.js'></script>

    <script>

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'rrule'],
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			},
		nextDayThreshold: '03:00:00',
		eventBorderColor: '#000000',
		eventColor: '#d86850',
		editable: true,
		events: [
<%		for (Map.Entry<String, ArrayList<AssignmentData> > entry : classList.entrySet()) {
			mapSize--;
			for (int i = 0; i < entry.getValue().size(); i++) {%>
				{
					title: '<%= entry.getValue().get(i).getAssignmentName()%>',
					start: '<%= entry.getValue().get(i).getDueDate()%>'
				}
<%				if (mapSize > 0 && i >= entry.getValue().size()-1) {%>
					, 
<% 				}%>
<% 			}%>
<%		}%>
	],
		
		eventClick: function(arg) {
			//TODO: implemnt RemoveAssignment funcionality here.
	        if (confirm('delete event?')) {
	          arg.event.remove()
	        }
	      }
	    });
	    calendar.render();
	  });
	

	</script>

	<style>
		body {
			font-family: "Gill Sans", "Gill Sans MT", Calibri, sans-serif;
			font-size: 14px;
			background-color: white;
		}
  
		thead.fc-head {
			background-color: #fffff1;
		}
	
		tbody.fc-body {    
			background-color: #fffff1;
		}

		#calendar {
			max-width: 900px;
			margin: 0 auto;
		}

	</style>
</head>

<body>
	<div class="header">
		<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/Login.jsp"> <img
			src="DueOh_logo3.png"
			style="margin-top: 10px; margin-left: 75%; width: 180px; height: 180px;" />
		</a>
		<a class="nav-link active" style=" margin-top: 10px; margin-left: -500px; margin-right: 150px; display: inline-block; color: grey; font-size: 20px;"href="${pageContext.request.contextPath}/profile.jsp"">Profile</a>
	</nav>

		<br>
		<div class="container" style="background-image: url(DueOh_Background.png);">
  <div class="row">
  
    <div class="col-sm back">
		<div id='calendar' style="margin-top:30px"></div><br></div>
	</div>
</div></div>

</body>
</html>
