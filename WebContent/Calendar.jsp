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
			margin: 40px 10px;
			padding: 0;
			font-family: "Gill Sans", "Gill Sans MT", Calibri, sans-serif;
			font-size: 14px;
			background-color: #ffb37d;
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
		<div>
		<table>
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}/profile.jsp"><img class="logo" src="DueOh_logo.png" style="margin-top: 30px; width: 150px; height: 150px;" />
				</td>
				<!--
				<td>
					<img src="7fypsQy.gif"/ style="width: 150px; height: 150px; margin-left: 900px; margin-top: 35px; border-radius: 100px;">
				</td>
				-->
			</tr>
		</table>
		</div>
		<hr>
		<h1></h1>
		<div id='calendar' style="margin-top:30px"></div>
	</div>


</body>
</html>
