<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>

<%
// Get the current list of products

@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

// If the list is empty, create a new one
if (productList == null) {
    productList = new HashMap<String, ArrayList<Object>>();
}
// Read product details from the form
String productID = request.getParameter("productID");
String productName = request.getParameter("productName");
String productPrice = request.getParameter("productPrice");
String productCategory = request.getParameter("productCategory");
// delete the product selected
if (request.getParameter("delete") != null) {
    productList.remove(productID);
}
// update the product selected
if (request.getParameter("update") != null) {
    ArrayList<Object> product = new ArrayList<Object>();
    product.add(productName);
    product.add(productPrice);
    product.add(productCategory);
    productList.put(productID, product);
}

// Store the product list in the session
session.setAttribute("productList", productList);
%>

<!--
<jsp:forward page="showcart.jsp" />
        -->
