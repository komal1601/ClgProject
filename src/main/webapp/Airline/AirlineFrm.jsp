<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@page import ="modelGetSet.*" %>	
<%@page import ="operations.*" %>
<%@page import ="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Airline</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
</head>
<body class="bg-image"; style="background-image: url('../1.jpg'); 
background-repeat: no-repeat;
background-position:top;
  	background-size: cover;">

<nav class="navbar navbar-expand-lg bg-light ">
		<div class="container-fluid">
			<ul class="navbar-nav me-autonmy-2 my-lg-0 navbar-nav-scroll"
				style="-bs-scroll-height: 100px;">
				<li class="nav-item"><a class="nav-link active text-dark fs-2"
					aria-current="page" href="../AdminMain.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link text-dark fs-2"
					href="../Airport/AirportFrm.jsp">Add Airports</a></li>
				<li class="nav-item"><a class="nav-link text-dark fs-2"
					href="../Flight/FlightFrm.jsp">Flight</a></li>
				<li class="nav-item"><a class="nav-link text-dark fs-2"
					href="../change_password.jsp">Change Password</a></li>
				<li class="nav-item"><a class="nav-link text-dark fs-2"
					href="../AdminLogin.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>

	<form name="frmAirline" method="POST" action="AddAirline.jsp">
		
		<h2 style="color: White">Add Airline</h2>
		
		<table width='50%' border='1' style='text-align: center; opacity: 0.8'
		class="table table-light table-striped">
		<tr class="table-active">
				<td>Airline Code</td>
				<td><input type = "text" placeholder = "Max 3 Character" name="AirCode" required></td>
			</tr>
			<tr>
				<td>Airline Name</td>
				<td><input type = "text" placeholder = "Airport Name" name="AirName" required></td>
			</tr>
		</table>
		<div class="col-auto">
			<button type="submit" class="btn btn-primary mb-3">Submit</button>
		</div>
	</form>
	
	<br>
    <br>	
	<h2 style="color: white">Airline Details</h2>

	<table width='50%' border='1' style='text-align: center; opacity: 0.8'
		class="table table-light table-responsive" >
		<tr class="table-active">
			<th>Airline Code</th>
			<th>Airline Name</th>
			<th></th>
		</tr>
		<%
		try
		{
			
		AdminAirlinesOper AFO2 = new AdminAirlinesOper();
		ResultSet rs2 = AFO2.ShowAllAirlines();
		while (rs2.next()) {
		%>

		<tr>
			<td><%=rs2.getString("code")%></td>
			<td><%=rs2.getString("name")%></td>
			<td><a href="DeleteAirlines.jsp?AirCode=<%=rs2.getString("code")%>">Delete</a></td>
		</tr>
		<%
		}
		}
		catch(Exception ex)
		{
			System.out.print(ex);
		}
		%>

	</table>
	
	
</body>
</html>



