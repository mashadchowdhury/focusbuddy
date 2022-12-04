<%@ page import="java.sql.*" %>
<%@ include file="jdbc.jsp" %>

<% 
if (request.getParameter("userid") != null) {
    String pass = "",address = "";
    
    if (request.getParameter("userid") != null) {
        pass = request.getParameter("pass");
        address = request.getParameter("address");

        // regex for email validation
        String emailRegex = "^(.+)@(.+)$";
        // regex for password
        String passRegex = "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";

        if (!pass.matches(passRegex)) {
            response.sendRedirect("signup.jsp?invalid=Password&redirect=" + (request.getParameter("redirect") != null ? request.getParameter("redirect") : "account.jsp"));
            return;
        } else if (!email.matches(emailRegex)) {
            response.sendRedirect("signup.jsp?invalid=Email&redirect=" + (request.getParameter("redirect") != null ? request.getParameter("redirect") : "account.jsp"));
            return;
        }

        getConnection();
        con.createStatement().execute("use orders;");
        PreparedStatement ps = con.prepareStatement("UPDATE customer(password,address) SET VALUES(?,?)");
        ps.setString(2, pass);
        ps.setString(7, address);
        ps.executeUpdate();
        closeConnection();
        response.sendRedirect(request.getParameter("redirect") != null ? request.getParameter("redirect") : "index.jsp");
    }
}
%>