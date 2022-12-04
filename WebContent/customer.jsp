<!DOCTYPE html>
<html>
<head>
<title>Customer Page</title>
</head>
<body>

<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<%String userName = (String) session.getAttribute("authenticatedUser"); %>

<%


        String url= "jdbc:sqlserver://cosc304_sqlserver:1433;databasename=Orders;TrustCertificate=True";
        String uid= "sa";
        String pw="304#sa#pw";


        try{
            getConnection();
            if (userName != null) {
                String sql = "SELECT * FROM customer";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    out.println("<h1>Customer Information</h1>");
                    out.println("<table>");
                    out.println("<p>Customer ID: " + rs.getInt("customerId") + "</p>");
                    out.println("<p>Customer Name: " + rs.getString("firstName")+ " "+rs.getString("lastName") +"</p>");
                    out.println("<p>Customer Address: " + rs.getString("address") + "</p>");
                    out.println("<p>Customer City: " + rs.getString("city") + "</p>");
                    out.println("<p>Customer Province: " + rs.getString("state") + "</p>");
                    out.println("<p>Customer Postal Code: " + rs.getString("postalCode") + "</p>");
                    out.println("<p>Customer Country: " + rs.getString("country") + "</p>");
                    out.println("<p>Customer Phone: " + rs.getString("phonenum") + "</p>");
                    out.println("<p>Customer Email: " + rs.getString("email") + "</p>");
                    out.println("</table>");
                }
                rs.close();
                ps.close();
		    }
	        else {
                out.println("<h1>Customer Profile</h1>");
                out.println("<p>You must be logged in to view this page.</p>");
            }
        } catch (Exception e) {
            out.println(e.getMessage());
        }
        finally{
            try{
                closeConnection();
            }
            catch (SQLException e) {
                out.println(e);
            }
        }
        
%>