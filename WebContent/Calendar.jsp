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
			plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list', 'rrule'],
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			},
		nextDayThreshold: '03:00:00',
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
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  
  thead.fc-head {
    background-color: #ED7F61;
   }
  tbody.fc-body {    
    background-color: #fcf5f2;
   }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>