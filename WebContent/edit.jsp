<%@ page import="java.sql.*" %>
<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<html lang="en">
<head>
<title>Sign Up Page</title>
</head>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>

<div style="margin:0 auto;text-align:center;display:inline"></div>

    <div class="edit-account">
      <h1>Editing Existing Account</h1>
        <form method="get" action="editUser.jsp" class="login-form">
            <%
            String invalid = request.getParameter("invalid");
            if (invalid != null)
                out.println("<h3>Invalid login information: " + request.getParameter("invalid") + "</h3>");
            %>
            <input type="password" name="pass" placeholder="Password" required /><br/>
            <input type="text" name="address" placeholder="Address" required /><br/>
            <br/>
            <button type="submit" class="sub-button">Edit Account</button>
        </form>
    </div>
    </body>
</html>