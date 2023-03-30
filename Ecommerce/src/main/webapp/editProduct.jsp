<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="java.util.*,com.Infopackage.User,com.Infopackage.Product,com.Infopackage.ProductDao"%>
<%
    User editProductUser=(User)session.getAttribute("current_user");
    if(editProductUser==null||editProductUser.getUsertype().equals("Normal"))
    {
    	session.setAttribute("message","You are not an admin,Hence you cannot access this page..");
    	response.sendRedirect("Login.jsp");
    	return;
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
<%@include file="common_components/common.jsp"%>
</head>
<body>
	<%@include file="common_components/nav.jsp"%>
	<h4 class="text-center">
		<i>Products</i>
	</h4>
	<table
		class="table table-responsive-sm table-striped table-hover text-center">
		<tr>
			<th>Product Title</th>
			<th>Price</th>
			<th>Discount(in percent)</th>
			<th>Quantity</th>
			<th>Action</th>
		</tr>
		<%List<Product> productList=ProductDao.getProductList();
for(Product p:productList)
{
%>
		<tr>
			<td style="max-width: 20vw;"><%=p.getpTitle() %></td>
			<td><%=p.getpPrice() %></td>
			<td><%=p.getpDiscount() %></td>
			<td><%=p.getQuantity() %></td>
			<td>
				<button type="button" class="btn" data-toggle="modal"
					data-target="#editProductModal"
					style="background-color: transparent;"
					onclick='setProductId("<%=p.getPid()%>")'>
					<i class="fa fa-pencil"></i>
				</button>
				<form action="editProduct" method="post" hidden
					id="deleteProductForm">
					<input type="hidden" name="delPid" id="delPid" value="">
				</form>
				<button type="button" class="btn"
					style="background-color: transparent"
					onclick='submitDeleteProductForm("<%=p.getPid()%>")'>
					<i class="fa fa-trash"></i>
				</button>
			</td>
		</tr>
		<%} %>
	</table>
	<%@include file="modals/editProductModal.jsp"%>
</body>
</html>