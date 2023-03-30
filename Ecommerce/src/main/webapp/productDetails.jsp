<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.Infopackage.Product,com.Infopackage.ProductDao"%>
<%@include file="common_components/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Details</title>
</head>
<body>
	<%@include file="common_components/nav.jsp"%>
	<% String pid=request.getParameter("pid");
Product p=ProductDao.getProduct(Integer.parseInt(pid));
%>
	<div class="container">
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card">
					<div class="card-header">
						<h5 class="text-center">
							<i><%= p.getpTitle()%></i>
						</h5>
					</div>
					<div class="card-body text-center">
						<img class="card-img-top img-fluid"
							src="dynamicImages/<%=p.getpPhoto() %>" style="height: 60vh;"
							alt="Card image cap">
					</div>
					<div class="card-footer text-center">
						<a href="AddCart.jsp?pid=<%=pid %>" class="btn btn-danger">Add
							to Cart</a>
					</div>

				</div>
				<!-- card1 ends -->
			</div>
			<!-- column1 -->
			<div class="col-md-6 ml-3">
				<div class="card">
					<div class="card-body ">
						<caption>
							<h4 class="text-center">Description</h4>
						</caption>
						<table class="table table-striped table-hover text-center mt-4">
							<tr>
								<td>Title</td>
								<td><%=p.getpTitle() %></td>
							</tr>

							<tr>
								<td>Price</td>
								<td><%=p.getpPrice() %></td>
							</tr>
							<tr>
								<td>Discount Rate</td>
								<td><%=p.getpDiscount()%></td>
							</tr>
							<tr>
								<td>Stock Available</td>
								<td><%=p.getQuantity() %></td>
							</tr>
							<tr>
								<td>Description</td>
								<td><%=p.getpDesc() %></td>
							</tr>
						</table>

					</div>
				</div>
				<!-- card ends  -->
			</div>
			<!-- column2 -->
		</div>
	</div>
</body>
</html>