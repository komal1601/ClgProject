<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="operations.*"%>
<%@page import="java.sql.*"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<body class="bg-image" style="background-image: url('../1.jpg'); 
	background-repeat: no-repeat;
	background-position:top;
  	background-size: cover;">
<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<ul class="navbar-nav me-autonmy-2 my-lg-0 navbar-nav-scroll"
				style="-bs-scroll-height: 100px;">
				<li class="nav-item"><a class="nav-link active text-dark fs-2"
					aria-current="page" href="../AdminMain.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link text-dark fs-2"
					href="../Airport/AirportFrm.jsp">Add Airports</a></li>
				<li class="nav-item"><a class="nav-link text-dark fs-2"
					href="FlightFrm.jsp">Flights</a></li>
				<li class="nav-item"><a class="nav-link text-dark fs-2"
					href="../Airline/AirlineFrm.jsp">Airlines</a></li>
				<li class="nav-item"><a class="nav-link text-dark fs-2"
					href="../change_password.jsp">Change Password</a></li>
				<li class="nav-item"><a class="nav-link text-dark fs-2"
					href="../Home.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>

	<form name="frmPassBooking" method="POST" action="FlightPerDayBack.jsp">
		<h3 style="color:white">Assign Flights Per Day</h3>
		
		<table width='50%' border='1' style='text-align: center'
			class="table table-light table-striped">
			<tr class="table-active">
				<td>Airline Code</td>
				<td>
				<select name="ddlAirlineCode">
				<option>Airline Code Select</option>
					<%
					try{						
						AdminFlightOper afo = new  AdminFlightOper();
						ResultSet rs = afo.ShowAllFlights();
		
						while(rs.next()){
					%>
				<option value='<%=rs.getString("airline_code") %>'><%=rs.getString("airline_code") %></option>
					<% 
						}
					}
					catch(Exception ex)
					{
							System.out.println(ex);
					}
					%>
		</select>
				</td>
				<tr>
					<td>Date </td>
					<td><input type = "date" name = "BookDate"></td>
				</tr>
				
				<tr>
					<td>Number Of Bookings</td>
					<td><input type="text" placeholder="Number of Bookings" name="NoBooking"></td>
				</tr>
				<tr>
					<td><input type = "Submit" value = "Assign Flights"></td>
					<td><input type = "reset" value = "Clear"></td>
				</tr>
		</table>
	</form><br><br>
	
	<h2 style="color: white">FlightPerDay Details</h2>
	<table width='50%' border='1' style='text-align: center; opacity: 0.8'
		class="table table-light table-striped">
		<tr class="table-active">
			<th>Airline Code</th>
			<th>Booking Date</th>
			<th>Number of Booking</th>
			<th>Bookings Done</th>
			<th></th>
		</tr>
		<%
			try {
				AdminFlightOper AFO1 = new AdminFlightOper();
				ResultSet rs1 = AFO1.ShowAllFlight();

				while (rs1.next()) {
			%>

		<tr>
			<td><%=rs1.getString("airline_code")%></td>
			<td><%=rs1.getString("bdate")%></td>
			<td><%=rs1.getString("noofbookings")%></td>
			<td><%=rs1.getString("booked")%></td>
			<td><a
				href="DeleteAirport.jsp?a_code=<%=rs1.getString("id")%>">Delete</a></td>
		</tr>
		<%
			}
			} catch (Exception ex) {
			System.out.print(ex);
			}
			%>

	</table>
		</body>
</html>