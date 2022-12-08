<%@ page import="java.sql.*" %>
<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href ="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">   
<link href ="https://cdn.jsdelivr.net/npm/boxicon@latest/css/boxicon.min.css" rel="stylesheet"> 
</head>
<%
	String userName = (String) session.getAttribute("authenticatedUser");
	if(userName.length() == 0){
		userName = "Login";
	}
%>
<body>
	<header>
		<a href = "index.jsp" class = "logo"><i class = "ri-home-heart-fill"></i><span>FocusBuddy</span></a>
		
				<u1 class="navbar">
					<li><a href="userinfo.jsp">User's Information</a></li>
					<li><a href="listprod.jsp">Begin Shopping</a></li>
					<li><a href="logout.jsp">Logout</a></li>
					<li><a href = "userinfo.jsp"><%out.print(userName);%></a></li>
				</u1>

		<div class = "main">
			<a href="showcart.jsp" class="user"><i class="ri-shopping-cart-fill"></i>Shopping Cart</a>
			<a href ="login.jsp" class ="user"><i class ="ri-user-fill"></i>Sign In</a>
			<a href ="signup.jsp" class ="user">Register</a>
			
		</div>
	</header>

<div style="margin:0 auto;text-align:center;display:inline"></div>

    <div class="add-prod">
      <h1>Admin Roles</h1>
        <form method="get" action="admin.jsp" class="login-form">
			<h3>Add New Product</h3><br>
            <%
            String invalid = request.getParameter("invalid");
            if (invalid != null)
                out.println("<h3>Invalid information: " + request.getParameter("invalid") + "</h3>");
            %>
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
String sql3 = "INSERT INTO product(productName, productPrice, productDesc, categoryId) VALUES (?, ?, ?, ?);";
String name = "", price = "", desc = "", cate = "";
NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try 
{	
	//customer names
	out.println("<br><h3>Current Customers</h3><br>");
	
	getConnection();
	Statement s = con.createStatement(); 
	s.execute("USE orders");
	ResultSet r = s.executeQuery(sql2);	

	while (r.next())
	{
		out.print("<td>&emsp;&emsp;"+r.getString(1)+" "+r.getString(2)+"</td><br>");
	}
	
	//date sales
	out.println("<br><h3>Administrator Sales Report by Day</h3><br>");
	
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

