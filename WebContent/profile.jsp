<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="DueOh.AssignmentManager" import="DueOh.AssignmentData"%>
    
    <%
    	String username = (String) session.getAttribute("username");
    	ArrayList<AssignmentData> table = AssignmentManager.populateField(username);
    	Map<String, ArrayList<AssignmentData> > classList = new HashMap<String, ArrayList<AssignmentData> >();
    	for (int i = 0; i < table.size(); i++) {
    		String className = table.get(i).getClassName();
    		if (classList.get(className) == null) {
    			ArrayList<AssignmentData> thisClass = new ArrayList<AssignmentData>();
    			classList.put(className, thisClass);
    		}
    		classList.get(className).add(table.get(i));
    	}
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>DueOh! Profile</title>
		
	<style>
		.logo {
			width: 40%;
			height: 40%;
			margin-left: 20%;
			margin-bottom:5%;
			
		}
		.content {
			background-image: url("background.png");
			background-repeat: no-repeat;
			background-size: cover;
			height: 100vh;
			
		}
		p{
			font-family: "Courier New", Courier, monospace;
			font-size: 30px;
			margin-left:20%;
		}
		h1{
			font-family: "Verdana", Geneva, sans-serif;
			font-weight: normal;
			font-size: 40px;
			margin-left:20%;
			margin-bottom:10%;
		}
		.button-small{
			color: #fff !important;
			word-spacing: 0.25em;
			font-family: 'Open Sans', sans-serif;
			text-transform: uppercase;
			line-height: 22px;
			padding: 10px 10px 10px;
			text-align: center;
			display:inline-block; 
			-webkit-border-radius: 3px;
			-moz-border-radius: 3px;
			border-radius: 3px;
			background: #474747;    
		}
		.button-small:active {
			-webkit-box-shadow: inset 0 2px 2px rgba(0,0,0, 0.3), inset 0 10px 20px rgba(0,0,0, 0.08);
			-moz-box-shadow: inset 0 2px 2px rgba(0,0,0, 0.3), inset 0 10px 20px rgba(0,0,0, 0.08);
			box-shadow: inset 0 2px 2px rgba(0,0,0, 0.3), inset 0 10px 20px rgba(0,0,0, 0.08);
		}
		#class {
		  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
		  border-collapse: collapse;
		  width: 70%;
		  background: white;
		  margin-left:10%;
		}
		
		#class td, #class th {
		  border: 1px solid #ddd;
		  padding: 8px;
		}
		
		#class tr:nth-child(even){background-color: #f2f2f2;}
		
		#class tr:hover {background-color: #ddd;}
		
		#class th {
		  padding-top: 12px;
		  padding-bottom: 12px;
		  text-align: left;
		  background-color: #ED7F61;
		  color: white;
		}
		
	</style>
	
	</head>
	<body>
		<table>
		<tr>
			<td><img class="logo" src="DueOh_logo.png" style="margin-top:30px;"/></td>
		</tr>
		<tr>
		<td><p>Welcome</p></td>
		</tr>
		<tr>
		<td><h1>Tommy Trojan</h1></td>
		<td><input class="button-small" type="submit" value="Sign Out"></td>
		</tr>
		</table>
		
		<div>
		<% for (Map.Entry<String, ArrayList<AssignmentData> > entry : classList.entrySet()) { %>
		<table></table>
			<table id="class">
			  <tr>
			    <th style="width:60%;"><%= entry.getKey() %></th><th></th>
			  </tr>
			  <tr>
			    <th>Assignment</th><th>Deadline</th>
			  </tr>
			  <% for (int i = 0; i < entry.getValue().size(); i++) { %>
			  <tr>
			    <td><%= entry.getValue().get(i).getAssignmentName() %></td><td><%= entry.getValue().get(i).getDueDate() %></td>
			  </tr>
			  <% } %>
			</table>
			<br><br>
		<% } %>
		</div>
		
	</body>
</html>