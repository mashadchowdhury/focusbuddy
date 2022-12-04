<%@ page import="java.sql.*" %>
<%@ include file="jdbc.jsp" %>

<% 
if (request.getParameter("userid") != null) {
    String pass = "",address = "";
    
    pass = request.getParameter("pass");
    address = request.getParameter("address");

    // regex for password
    String passRegex = "^(?=.*[0-9])(?=.*[a-z]).{6,}$";

    if (!pass.matches(passRegex)) {
        response.sendRedirect("signup.jsp?invalid=Password&redirect=" + (request.getParameter("redirect") != null ? request.getParameter("redirect") : "account.jsp"));
        return;
    }

    getConnection();
    con.createStatement().execute("use orders;");
    PreparedStatement ps = con.prepareStatement("UPDATE customer SET password=? AND address=?");
    ps.setString(2, pass);
    ps.setString(7, address);
    ps.executeUpdate();
    closeConnection();
    response.sendRedirect(request.getParameter("redirect") == null ? request.getParameter("redirect") : "index.jsp");
    
}
%>