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
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        // regex for phone number validation
        String phoneRegex = "^[0-9]{10}$";
        // regex for strong password
        String passRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,20}$";
        
        getConnection();
        con.createStatement().execute("use orders;");
        PreparedStatement ps = con.prepareStatement("insert into customer(userid,password,firstName,lastName,email,phonenum,address,city,state,postalCode,country) values(?,?,?,?,?,?,?,?,?,?,?)");
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