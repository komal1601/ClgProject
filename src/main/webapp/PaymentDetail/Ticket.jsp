<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<%@page import="java.sql.*"%>

<%
session = request.getSession();
session.setMaxInactiveInterval(60 * 60);

String airlineCode = (String) session.getAttribute("airlineCode");
String sourceCode = (String) session.getAttribute("sourceCode");
String destinationCode = (String) session.getAttribute("destinationCode");
String seatsAvailable = (String) session.getAttribute("seatsAvailable");
String bookingDate = (String) session.getAttribute("bookingDate");
String fid = (String) session.getAttribute("fid");
float price = (Float) session.getAttribute("price");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 20px;
}

.ticket {
	max-width: 600px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	box-sizing: border-box;
}

.ticket table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.ticket table th, .ticket table td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: left;
}

.ticket table th {
	background-color: #f0f0f0;
}

.ticket h2 {
	margin-top: 0;
}
</style>

</head>
<body class="bg-image"
	style="background-image: url('../2.jpg'); background-repeat: no-repeat; background-position: top; background-size: cover;">


	<h1 style="color: white; text-align: center">Your Ticket Confirm</h1>
	<br>
	<h2 style="color: white; text-align: center">Below your Ticket..!!</h2>
	<br>
	<br>


	<div class="ticket">
		<h2>Flight Ticket</h2>
		<table>
			<tr>
				<th>Passenger Name</th>
				<th>Airline</th>
				<th>Flight ID</th>
				<th>From</th>
				<th>To</th>
				<th>Price</th>

			</tr>

			<%
			try {
				String airlineCode1 = (String) session.getAttribute("airlineCode");
				PassReg pr = new PassReg();
				pr.setAirline_code(airlineCode1);

				PassRegOper pro = new PassRegOper();
				ResultSet res = pro.ShowSelectPassRegDetail(pr);

				while (res.next()) {
			%>

			<tr align="center">
				<td><%=res.getString("pname")%></td>

				<td><%=session.getAttribute("airlineCode")%></td>
				<td><%=session.getAttribute("fid")%></td>
				<td><%=session.getAttribute("sourceCode")%></td>
				<td><%=session.getAttribute("destinationCode")%></td>
				<td><%=session.getAttribute("price")%></td>
				<%
				}
				} catch (Exception ex) {
				System.out.print(ex);
				}
				%>
			</tr>
		</table>
	</div>
</body>
</html>