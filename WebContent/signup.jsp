<%@ page import="java.sql.*" %>
<%@ include file="jdbc.jsp" %>
<html lang="en">
<head>
<title>Sign Up Page</title>
</head>
<center>
<div style="margin:0 auto;text-align:center;display:inline"></div>

    <div class="create-account">
      <h1>Create New Account</h1><hr> <br>
        <form method="get" action="createUser.jsp" class="login-form">
            <%
            String invalid = request.getParameter("invalid");
            if (invalid != null)
                out.println("<h3>Invalid login information: " + request.getParameter("invalid") + "</h3>");
            %>
            <input type="text" name="userid" placeholder="Username" required /><br/><br>
            <input type="password" name="pass" placeholder="Password" required /><br/><br>
            <input type="text" name="firstName" placeholder="First Name" required /><br/><br>
            <input type="text" name="lastName" placeholder="Last Name" required /><br/><br>
            <input type="text" name="email" placeholder="Email" required /><br/><br>
            <input type="text" name="phone" placeholder="Phone Number" required /><br/><br>
            <input type="text" name="address" placeholder="Address" required /><br/><br>
            <input type="text" name="city" placeholder="City" required /><br/><br>
            <input type="text" name="state" placeholder="State" required /><br/><br>
            <input type="text" name="postalCode" placeholder="Postal Code" required /><br/><br>
            <input type="text" name="country" placeholder="Country" required /><br/><br>
            <br/>
            <button type="submit" class="login-button">Create Account</button>
        </form>
    </div>
</center>
    </body>
</html>