<%@ page import="java.sql.*" %>
<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

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

<div style="margin:0 auto;text-align:center;display:inline"></div>

    <div class="add-prod">
      <h1>Add New Product</h1>
        <form method="get" action="admin.jsp" class="login-form">
            <%
            String invalid = request.getParameter("invalid");
            if (invalid != null)
                out.println("<h3>Invalid login information: " + request.getParameter("invalid") + "</h3>");
            %>
			<input type="text" name="id" placeholder="Product Id" required /><br/>
            <input type="text" name="name" placeholder="Product Name" required /><br/>
            <input type="number" name="price" placeholder="Product Price" required /><br/>
            <input type="text" name="desc" placeholder="Product Desc" required /><br/>
			<input type="number" name="cate" placeholder="Product Category" required /><br/>

            <br/>
            <button type="submit" class="sub-button">Add Product</button>
        </form>
    </div>
    </body>
</html>

<%

String sql = "SELECT year(orderDate), month(orderDate), day(orderDate), SUM(totalAmount) FROM OrderSummary GROUP BY year(orderDate), month(orderDate), day(orderDate)";

String sql2 = "SELECT firstName,lastName FROM Customer";

String sql3 = "INSERT INTO product(productId, productName, productPrice, productDesc, categoryId) VALUES (?, ?, ?, ?, ?);";

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

	//add new product

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

