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
<link rel='stylesheet' href="../navbar.css">
</head>
<body>

	<ul>
		<li><a class="active" href="../PassMain.jsp">Home</a></li>
		<li><a href="Booking/PassBookingFrm.jsp">Booking details</a></li>
		<li><a href="../PassengerReg/PassRegFrm.jsp">Passenger
				Registration</a></li>
		<li><a href="../PassTravelDetail/PassTravelDetFrm.jsp">Passenger
				Travel Detail</a></li>
		<li><a href="../PaymentDetail/PassPaymentFrm.jsp">Passenger
				Payment</a></li>
	</ul>
	
	<h3>Select Number Of Seats</h3>

	<form name="frmPassBooking" method="POST" action="AddPassBooking.jsp">
		<table width=50% border=1>
			<tr>
			<th>Airline Code</th><th>Source Code</th><th>Destination Code</th><th>Date</th><th>Number Of Passengers</th>
			</tr>
			<%
			try
			{
				String source_code = request.getParameter("hidsrc");
				String destination_code = request.getParameter("hiddes");
				String bdate = request.getParameter("hiddate");
				
				AdminFlight stflight = new AdminFlight();
				stflight.setFlightSource(source_code);
				stflight.setFlightDest(destination_code);
				stflight.setBdate(bdate);
				
				AdminFlightOper afo = new  AdminFlightOper();
				ResultSet rs = afo.ShowAllSelectFlight(stflight);
				while(rs.next())
				{
					
				
			%>			
			<tr>
				<td><%=rs.getString("airline_code")%></td>
				<td><%=rs.getString("source_code")%></td>
				<td><%=rs.getString("destination_code")%></td>
				<td><%=rs.getString("bdate")%></td>
				<td><input type="text" placeholder="Number of Bookings" name="NoBooking"></td>
			</tr>
			
		<%		}
			} 
			catch(Exception ex)
			{
				System.out.println(ex);
			}
			
			
			%>
			<tr>
			<td><input type="submit" /></td>
			</tr>
		</table>
		
		
		
	    
		
		
	</form>
</body>
</html>