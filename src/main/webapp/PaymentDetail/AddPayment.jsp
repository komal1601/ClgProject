<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<%@page import="java.sql.*"%>
<% 
session = request.getSession();
session.setMaxInactiveInterval(60 * 60);


String P_id = request.getParameter("ddlPId");
String Amt = request.getParameter("amt");
session.setAttribute("Amt", Amt);
String Transaction_type = request.getParameter("TransType");
String Transaction_Date = request.getParameter("pymttime");


PassPayment sc = new PassPayment();

sc.setP_id(Integer.parseInt(P_id));
sc.setAmt(Float.parseFloat(Amt));
sc.setTranType(Transaction_type);
sc.setTranDate(Transaction_Date);

PassPaymentOper ppo = new PassPaymentOper();
String str = ppo.AddNewPassPayment(sc);


if(str.equals("Success"))
{
	response.sendRedirect("Ticket.jsp");
}	
else
{
	
	response.sendRedirect("PassPaymentFrm.jsp");
}

%>