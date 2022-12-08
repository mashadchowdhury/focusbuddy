<%@ page import="java.sql.*" %>
<%@ include file="jdbc.jsp" %>

<% 

try{
    String sql3 = "INSERT INTO product(productName, productPrice, productDesc, categoryId) VALUES (?, ?, ?, ?);";
    String name = "", price = "", desc = "", cate = "";    

    name = request.getParameter("name");
    price = request.getParameter("price");
    desc = request.getParameter("desc");
    cate = request.getParameter("cate");

    getConnection();
    con.createStatement().execute("use orders;");
    PreparedStatement ps = con.prepareStatement(sql3);
    ps.setString(1, name);
    ps.setString(2, price);
    ps.setString(3, desc);
    ps.setString(4, cate);
    ps.executeUpdate();
    response.sendRedirect(request.getParameter("redirect") != null ? request.getParameter("redirect") : "listprod.jsp");
}
catch (SQLException ex) 
{ 	
    out.println(ex); 
}
finally
{	
	closeConnection();	
}
%> 

%>