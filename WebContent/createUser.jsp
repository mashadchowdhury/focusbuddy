<%@ page import="java.sql.*" %>
<%@ include file="jdbc.jsp" %>

<% 
if (request.getParameter("userid") != null) {
    String userid = "", pass = "", firstName = "", lastName = "", email = "", phone = "", address = "", city = "", state = "", postalCode = "", country = "";
    if (request.getParameter("userid") != null) {
        userid = request.getParameter("userid");
        pass = request.getParameter("pass");
        firstName = request.getParameter("firstName");
        lastName = request.getParameter("lastName");
        email = request.getParameter("email");
        phone = request.getParameter("phone");
        address = request.getParameter("address");
        city = request.getParameter("city");
        state = request.getParameter("state");
        postalCode = request.getParameter("postalCode");
        country = request.getParameter("country");
        // regex for email validation
        String emailRegex = "^(.+)@(.+)$";
        // regex for phone number validation
        String phoneRegex = "^[0-9]{10}$";
        // regex for password
        String passRegex = "^(?=.*[0-9])(?=.*[a-z]).{6,}$";

        if (!pass.matches(passRegex)) {
            response.sendRedirect("signup.jsp?invalid=Password&redirect=" + (request.getParameter("redirect") != null ? request.getParameter("redirect") : "account.jsp"));
            return;
        } else if (!email.matches(emailRegex)) {
            response.sendRedirect("signup.jsp?invalid=Email&redirect=" + (request.getParameter("redirect") != null ? request.getParameter("redirect") : "account.jsp"));
            return;
        } else if (!phone.matches(phoneRegex)) {
            response.sendRedirect("signup.jsp?invalid=Phone&redirect=" + (request.getParameter("redirect") != null ? request.getParameter("redirect") : "account.jsp"));
            return;
        }

        getConnection();
        con.createStatement().execute("USE orders;");
        PreparedStatement ps = con.prepareStatement("INSERT INTO customer(userid,password,firstName,lastName,email,phonenum,address,city,state,postalCode,country) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1, userid);
        ps.setString(2, pass);
        ps.setString(3, firstName);
        ps.setString(4, lastName);
        ps.setString(5, email);
        ps.setString(6, phone);
        ps.setString(7, address);
        ps.setString(8, city);
        ps.setString(9, state);
        ps.setString(10, postalCode);
        ps.setString(11, country);
        ps.executeUpdate();
        closeConnection();
        response.sendRedirect(request.getParameter("redirect") != null ? request.getParameter("redirect") : "login.jsp");
    }
}
%>