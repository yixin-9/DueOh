<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="DueOh.AssignmentManager" import="DueOh.AssignmentData"
    %><html lang='en'>
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
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list', 'rrule' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      defaultDate: '2019-08-12',
      editable: true,
      events: [
        {
          title: 'rrule event',
          rrule: {
            dtstart: '2019-08-09T13:00:00',
            // until: '2019-08-01',
            freq: 'weekly'
          },
          duration: '02:00'
        }
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