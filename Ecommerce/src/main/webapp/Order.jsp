<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="common_components/common.jsp"%>
<%@page import="com.Infopackage.OrderDao,com.Infopackage.Order"%>
<%@page import="java.util.*"%>
<%
HashMap<Integer,Integer> map=(HashMap<Integer,Integer>)session.getAttribute("cart");
String userid=request.getParameter("userid");
String username=request.getParameter("username");
String useremail=request.getParameter("useremail");
String phonenumber=request.getParameter("phonenumber");
String address=request.getParameter("address");
String payment=request.getParameter("payment");
String total=request.getParameter("total");
if(map!=null){
OrderDao obj=new OrderDao();
Order order=new Order();
order.setUserid(userid);
order.setUsername(username);
order.setEmail(useremail);
order.setPhonenumber(phonenumber);
order.setAddress(address);
order.setProductIDs(map.toString());
order.setTotal(total);
order.setPayment(payment);
//
obj.saveOrder(order);
obj.updateDatabase(map);
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order</title>
</head>
<body>
	<%@include file="common_components/nav.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-10 mt-4">
				<div class="card">
					<div class="card-header text-center">
						<img class="card-img-top img-fluid rounded-circle"
							src="images/ORDERNOW.jpg" style="height: 100px; width: 100px;"
							alt="Card image cap">

					</div>
					<!-- end of card-header -->
					<div class="card-body">
						<div class="container text-center">
							Your Name :
							<%=request.getParameter("username") %><br> Your Phone Number
							:
							<%=request.getParameter("phonenumber") %><br> Your Email :
							<%=request.getParameter("useremail") %><br> Shipping Address
							:
							<%=request.getParameter("address") %><br>
						</div>
					</div>
					<!-- end of card-body -->
					<div class="card-footer text-center">
						<h3><%=request.getParameter("username")%>
							, Your order will placed soon !!!
						</h3>

					</div>
					<!-- end of card-footer -->

				</div>
				<!-- end of card -->


			</div>
			<!-- end of column -->
		</div>
		<!-- end of row -->


	</div>
	<!-- end of container -->
	<%session.removeAttribute("cart");
	session.removeAttribute("cartcount");%>
</body>
</html>