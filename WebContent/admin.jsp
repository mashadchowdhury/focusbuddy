<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
</head>
<body>

<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>

<%

// Print out total order amount by day
String sql = "SELECT year(orderDate), month(orderDate), day(orderDate), SUM(totalAmount) FROM OrderSummary GROUP BY year(orderDate), month(orderDate), day(orderDate)";

String sql2 = "SELECT firstName,lastName FROM Customer";

NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try 
{	
	//customer names
	out.println("<h3>Current Customers</h3>");
	
	getConnection();
	Statement s = con.createStatement(); 
	s.execute("USE orders");
	ResultSet r = s.executeQuery(sql2);	

	while (r.next())
	{
		out.print("<td>"+r.getString(1)+" "+r.getString(2)+"</td><br>");
	}
	
	//date sales
	out.println("<h3>Administrator Sales Report by Day</h3>");
	
	getConnection();
	Statement stmt = con.createStatement(); 
	stmt.execute("USE orders");

	ResultSet rst = stmt.executeQuery(sql);		
	out.println("<table class=\"table\" border=\"1\">");
	out.println("<tr><th>Order Date</th><th>Total Order Amount</th>");	

	while (rst.next())
	{
		out.println("<tr><td>"+rst.getString(1)+"-"+rst.getString(2)+"-"+rst.getString(3)+"</td><td>"+currFormat.format(rst.getDouble(4))+"</td></tr>");
	}
	out.println("</table>");
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
finally
{	
	closeConnection();	
}
%>

</body>
</html>

