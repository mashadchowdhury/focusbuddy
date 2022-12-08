<!DOCTYPE html>
<html>
<head>
<title>Ray's Grocery CheckOut Line</title>
</head>
<body>

<h1>Enter your customer id to complete the transaction:</h1>
//checkout with customer id
<form method="get" action="order.jsp">
<input type="text" name="customerId" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>

//checkout with payment/shipment info
<form method="get" action="order.jsp">
<input type="text" name="paymentInfo" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>


</body>
</html>
