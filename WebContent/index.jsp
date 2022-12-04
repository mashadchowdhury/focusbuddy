<!DOCTYPE html>
<html>
<head>
        <title>FocusBuddy Main Page</title>
</head>
<body>
	<header>
		<div class="container">
			<nav class = "navbar">
				<a href ="/" class="nav-branding">FocusBuddy</a>
				<u1 class="nav-menu">
					<li class = "nav-link"><a href="index.jsp">Home</a></li>
					<li class = "nav-link"><a href="login.jsp">Login</a></li>
					<li class = "nav-link"><a href="userinfo.jsp">User's Information</a></li>
					<li class = "nav-link"><a href="listprod.jsp">Begin Shopping</a></li>
					<li class = "nav-link"><a href="admin.jsp">Administrators</a></li>
					<li class = "nav-link"><a href="logout.jsp">Logout</a></li>


				</u1>

			</nav>
		</div>
	</header>

<h1 align="center">Welcome to FocusBuddy</h1>

<h2 align="center"><a href="login.jsp">Login</a></h2>
	
<h2 align="center"><a href="userinfo.jsp">User's Information</a></h2>
	
<h2 align="center"><a href="listprod.jsp">Begin Shopping</a></h2>

<h2 align="center"><a href="listorder.jsp">List All Orders</a></h2>

<h2 align="center"><a href="admin.jsp">Administrators</a></h2>

<h2 align="center"><a href="logout.jsp">Log out</a></h2>

<h2 align="center"><a href="signup.jsp">I'm new! Let's Sign Up</a></h2>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
	if (userName != null)
		out.println("<h3 align=\"center\">Signed in as: "+userName+"</h3>");
%>
</body>
</head>


