<!DOCTYPE html>
<html>
<head>
<title>Logout Screen</title>
</head>
<body>

<h3>Logging out of System</h3>

<%
session.invalidate();
response.sendRedirect("index.jsp");
%>

</body>
</html>