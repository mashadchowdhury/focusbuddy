<!DOCTYPE html>
<html>
<head>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href ="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">   
	<link href ="https://cdn.jsdelivr.net/npm/boxicon@latest/css/boxicon.min.css" rel="stylesheet">         
	<title>FocusBuddy Main Page</title>
</head>
<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>
<body>
	<script type ="text/javascript" src = "css/script.js"></script>
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
	<br/>		
<h1 align="center">Welcome to FocusBuddy</h1>
<br/>	<br/>
<h2 align="center"><a href="login.jsp">Login</a></h2>
<br/>	
<h2 align="center"><a href="userinfo.jsp">User's Information</a></h2>
<br/>	
<h2 align="center"><a href="listuserorder.jsp">User's Orders</a></h2>
<br/>	
<h2 align="center"><a href="edit.jsp">Edit User Information</a></h2>
<br/>	
<h2 align="center"><a href="listprod.jsp">Begin Shopping</a></h2>
<br/>	
<h2 align="center"><a href="listorder.jsp">List All Orders</a></h2>
<br/>	
<h2 align="center"><a href="admin.jsp">Administrators</a></h2>
<br/>	
<h2 align="center"><a href="signup.jsp">New User! Sign up here</a></h2>
<br/>	
<h2 align="center"><a href="logout.jsp">Log out</a></h2>
<br/>	<br/>

<%
	if (userName != null)
		out.println("<h3 align=\"center\">Signed in as: "+userName+"</h3>");
%>
</body>
</head>


