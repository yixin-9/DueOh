<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="DueOh.AssignmentManager" import="DueOh.AssignmentData"
    %>
    
   
<%
/*
this.assignmentName = assignmentNameVal;
this.dueDate = dueDateVal;
this.className = classNameVal;
this.setAssignLink(assignLinkVal);
this.username = usernameVal;
this.submitStatus = submitStatus;
*/
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



Apex.grid = {
  padding: {
    right: 0,
    left: 0
  }
}

Apex.dataLabels = {
  enabled: false
}

var randomizeArray = function (arg) {
  var array = arg.slice();
  var currentIndex = array.length, temporaryValue, randomIndex;
  
  while (0 !== currentIndex) {

    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;

    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
}

// data for the sparklines that appear below header area
var sparklineData = [47, 45, 54, 38, 56, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46];

// the default colorPalette for this dashboard
//var colorPalette = ['#01BFD6', '#5564BE', '#F7A600', '#EDCD24', '#F74F58'];
var colorPalette = ['#00D8B6','#008FFB',  '#FEB019', '#FF4560', '#775DD0']



var mygroups = _.groupBy([
<%		for (Map.Entry<String, ArrayList<AssignmentData> > entry : classList.entrySet()) {
			mapSize--;
			for (int i = 0; i < entry.getValue().size(); i++) {%>
				'<%= entry.getValue().get(i).getDueDate()%>',
<% 			}%>
<%		}%>

], function (date) {
	return moment(date).format('YYYY-MM-DD');
});




var optionsBar = {
  chart: {
    type: 'bar',
    height: 297,
    width: '100%',
    stacked: true,
    fontFamily: "Gill Sans, Gill Sans MT, Calibri, sans-serif",
    
  },
  plotOptions: {
    bar: {
      columnWidth: '45%',
    }
  },
  colors: colorPalette,
  series: [{
    name: "# of Assignments",
    data: [
    
    <%		for (Map.Entry<String, ArrayList<AssignmentData> > entry : classList.entrySet()) {
			mapSize--;
			for (int i = 0; i < entry.getValue().size(); i++) {%>
			
				mygroups["<%= entry.getValue().get(i).getDueDateJS()%>"].length,
<% 			}%>
<%		}%>


	],
  }],
  xaxis: {
  	type: "datetime",
  	categories: [
  	<%		for (Map.Entry<String, ArrayList<AssignmentData> > entry : classList.entrySet()) {
			mapSize--;
			for (int i = 0; i < entry.getValue().size(); i++) {%>
				'<%= entry.getValue().get(i).getDueDate()%>',
<% 			}%>
<%		}%>
  	],

    labels: {
    	format: 'MM/dd',
      show: true
    },
    axisBorder: {
      show: false
    },
    axisTicks: {
      show: false
    },
  },
  yaxis: {
    axisBorder: {
      show: false
    },
    axisTicks: {
      show: false
    },
    labels: {
      style: {
        color: '#78909c'
      },
      formatter: 
      	(value) => { return parseFloat(value).toFixed() },
      
    }
  },
  title: {
    text: 'Assignments Due This Month:',
    align: 'left',
    style: {
      fontSize: '18px'
    }
  }

}

var chartBar = new ApexCharts(document.querySelector('#bar'), optionsBar);
chartBar.render();


var optionDonut = {
  chart: {
  	  fontFamily: "Gill Sans, Gill Sans MT, Calibri, sans-serif",
      type: 'donut',
      height: 285
      
  },
  dataLabels: {
    enabled: false,
  },
  plotOptions: {
    pie: {
      donut: {
        size: '50%',
      },
      offsetY: 20,
    },
    stroke: {
      colors: undefined
    }
  },
  colors: colorPalette,
  title: {
    text: 'Your Classes:',
    style: {
      fontSize: '18px'
    }
  },
	series: [
<%		for (Map.Entry<String, ArrayList<AssignmentData> > entry : classList.entrySet()) {
			mapSize--;
			%>
				
				<%= entry.getValue().size()%>,
				

<% 			}%>
	],
	labels: [
<%		for (Map.Entry<String, ArrayList<AssignmentData> > entry : classList.entrySet()) {
			mapSize--;
			for (int i = 0; i < 1; i++) {%>
				
				'<%= entry.getValue().get(i).getClassName()%>',
				

<% 			}%>
<%		}%>
	],
  legend: {
    position: 'left',
    offsetY: 80
  }
}

var donut = new ApexCharts(
  document.querySelector("#donut"),
  optionDonut
)
donut.render();


function trigoSeries(cnt, strength) {
  var data = [];
  for (var i = 0; i < cnt; i++) {
      data.push((Math.sin(i / strength) * (i / strength) + i / strength+1) * (strength*2));
  }

  return data;
}



// on smaller screen, change the legends position for donut
var mobileDonut = function() {
  if($(window).width() < 768) {
    donut.updateOptions({
      plotOptions: {
        pie: {
          offsetY: -15,
        }
      },
      legend: {
        position: 'bottom'
      }
    }, false, false)
  }
  else {
    donut.updateOptions({
      plotOptions: {
        pie: {
          offsetY: 20,
        }
      },
      legend: {
        position: 'left'
      }
    }, false, false)
  }
}

$(window).resize(function() {
  mobileDonut()
})