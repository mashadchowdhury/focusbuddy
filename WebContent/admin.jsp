<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>


<%@ include file="jdbc.jsp" %>
<%@ include file="auth.jsp" %>
<%@ page import="java.sql.*,java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>

<h2>Adminstrator Sales Report by Day</h2>



<%
String sql = "SELECT YEAR(orderDate) AS year, MONTH(orderDate) AS month, DAY(orderDate) AS day, SUM(totalAmount) AS amountSold FROM ordersummary GROUP BY YEAR(orderDate), MONTH(orderDate), DAY(orderDate) ORDER BY 1, 2, 3;";
NumberFormat currFormat = NumberFormat.getCurrencyInstance();
getConnection();
Statement stmt = con.createStatement();
stmt.execute("USE ORDERS;");
ResultSet result = stmt.executeQuery(sql);

out.println("<table>");
out.println("<tr><th>Order Date</th>");
out.println("<th>Total Order Amount</th></tr>");

while (result.next()) {

    String orderDate = result.getString("year") + "-" + result.getString("month") + "-" + result.getString("day");
    String amountSold = currFormat.format(result.getDouble("amountSold"));
    out.println("<tr><td>" + orderDate + "</td><td>" + amountSold + "</td></tr>");
}
out.println("</table>");
%>

</body>
</html>