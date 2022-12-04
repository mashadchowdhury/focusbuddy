<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.*,java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>

<html>
<head>
<title>Ray's Grocery - Product Information</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp" %>

<%
// TODO: If there is a productImageURL, display using IMG tag
		
// TODO: Retrieve any image stored directly in database. Note: Call displayImage.jsp with product id as parameter.
		
// TODO: Add links to Add to Cart and Continue Shopping
// Get product name to search for
// TODO: Retrieve and display info for the product
String productId = request.getParameter("id");
boolean hasParameter = false;
	String sql = "";

	if (productId == null)
		productId = "";

	
		sql = "SELECT productId, productName, productPrice, productImageURL FROM Product WHERE productId = ?";


NumberFormat currFormat = NumberFormat.getCurrencyInstance(Locale.US);
			
		getConnection();
    	Statement stmt = con.createStatement(); 
		stmt.execute("USE orders");

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, productId);

		ResultSet rst = pstmt.executeQuery();
		String imagey = "";


            if (rst.next()) 
            {
				imagey = rst.getString(4);
                out.println("<h1>" +rst.getString(2)+"</h1>");
                out.println("<table>");
                out.println("<tr><th>Id</th><td>" + rst.getInt(1)+ "</td></tr>");
                out.println("<tr><th>Price</th><td>" + currFormat.format(rst.getDouble(3))+ "</td></tr>");
                out.print("<tr><td><a href= \"addcart.jsp?id=" + rst.getInt(1) + "&name=" + rst.getString(2)
                    + "&price=" + rst.getDouble(3) + "\">Add to Cart</a></td>");
                out.print("<tr><td><a href= \"listprod.jsp\">Continue Shopping</a></td>");
            out.println("</table>");
				}
	
		closeConnection(); 
%>


<img src="<%= imagey %>" width="300px" />
<img width=300px alt="Picture" src="displayImage.jsp?id=<%= productId %>"/></div>

</body>
</html>




