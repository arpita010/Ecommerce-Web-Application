<%@page import="com.Infopackage.User"%>
<%@page import="com.Infopackage.ProductDao,com.Infopackage.Category"%>
<%@page import="com.Infopackage.CategoryDao,com.Infopackage.UserDao"%>
<%@page import="java.util.*"%>
<%
User user=(User)session.getAttribute("current_user");
if(user==null)
{
	session.setAttribute("message","You are not allowed to visit this page..Login as 'Admin' First!!" );
	response.sendRedirect("Login.jsp");
	return;
}
else if(user.getUsertype().equals("Normal"))
{
	String msg="You are not an admin.You cannot access this page!!";
	session.setAttribute("message",msg);
	response.sendRedirect("Login.jsp");
	return;
}
else if(user.getUsertype().equals("Admin")!=true)
{
	String msg="We are not able to identify your identity, Login again !";
	session.setAttribute("message",msg);
	response.sendRedirect("Login.jsp");
	return;
}

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="common_components/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<style>
.card {
	background-color: #e2e2e2;
}
</style>
</head>
<body style="background: #e2e2e2;">
	<%@include file="common_components/nav.jsp"%>


	<div class="container text-center mt-3">
		<%@include file="common_components/message.jsp"%>
	</div>
	<%--<h1>Admin User page... welcome <%=user.getUsername() %></h1>
	 --%>
	<div class="container admin">
		<%--row1 --%>
		<div class="row mt-2 mb-4">
			<%--row1 col1 --%>
			<div class="col-sm-4">

				<div class="card">

					<div class="card-body ">
						<div class="container text-center ">
							<i class="fa fa-users" style="font-size: 10vh;"></i>
							<h1 class="mt-4"><%=UserDao.getUsersCount() %></h1>
							<h2 class="mt-4">Total Active Users</h2>
						</div>
					</div>

					<div class="card-footer text-center">
						<a href="EditUsers.jsp" class="btn btn-warning px-3">Edit
							Users</a>
					</div>
				</div>
			</div>
			<%--row1 col2 --%>
			<div class="col-sm-4">
				<div class="card">

					<div class="card-body">
						<div class="container text-center">
							<i class="fa fa-suitcase" style="font-size: 10vh;"></i>
							<h1 class="mt-4"><%= CategoryDao.getCategoriesCount() %></h1>
							<h2 class="mt-4">Total Categories</h2>
						</div>

					</div>

					<div class="card-footer text-center">
						<a href="EditCategories.jsp" class="btn btn-warning px-3">Edit
							Categories</a>
					</div>
				</div>

			</div>
			<%--row1 col3 --%>
			<div class="col-sm-4">
				<div class="card">

					<div class="card-body">
						<div class="container text-center">
							<i class="fa fa-star" style="font-size: 10vh;"></i>

							<h1 class="mt-4"><%=ProductDao.getProductsCount() %></h1>
							<h2 class="mt-4">Total Products</h2>
						</div>

					</div>

					<div class="card-footer text-center">
						<a href="editProduct.jsp" class="btn btn-warning px-3">Edit
							Products</a>
					</div>
				</div>
			</div>
		</div>
		<%--row1 ended --%>
		<%--row 2 --%>
		<div class="row  mb-4">
			<%--row2 col1 --%>
			<div class="col-sm-6">
				<div class="card" data-toggle="modal" data-target="#categoryModal">
					<div class="card-body">
						<div class="container text-center">
							<i class="fa fa-cloud-upload" style="font-size: 10vh;"></i>
							<h2 class="mt-4">Add Category</h2>

						</div>
					</div>
				</div>
			</div>


			<%--row2 col2 --%>
			<div class="col-sm-6">
				<div class="card" data-toggle="modal" data-target="#productModal">
					<div class="card-body">
						<div class="container text-center">
							<i class="fa fa-plus-square-o" style="font-size: 10vh;"></i>
							<h2 class="mt-4">Add Products</h2>

						</div>

					</div>
				</div>
			</div>
		</div>
		<%--row2 ended --%>

		<%--container ends --%>
	</div>

	<%--modal --%>
	<!-- Product Modal -->
	<div class="modal fade" id="productModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="background-color: #e2e2e2;">
				<div class="modal-header">
					<h5 class="modal-title" >Add product</h5>

				</div>
				<div class="modal-body">
					<form action="addItem" method="post">
						<input type="hidden" name="operation" value="product">
						<div class="form-group">

							<input name="pTitle" type="text" class="form-control"
								placeholder="Enter your Product title">
						</div>

						<div class="form-group">
							<textarea name="pDesc" class="form-control"
								placeholder="Enter Product Description"></textarea>
						</div>
						<div class="form-group">
							<small>Select image of your Product</small><input name="pPhoto"
								type="file" class="form-control">
						</div>
						<div class="form-group">

							<input name="pPrice" type="text" class="form-control"
								placeholder="Enter Price of your Product">
						</div>
						<div class="form-group">

							<input name="pDiscount" type="number" class="form-control"
								placeholder="Enter Discount rate">
						</div>
						<div class="form-group">

							<input name="Quantity" type="text" class="form-control"
								placeholder="Enter Quantity">
						</div>
						<div class="form-group">
							<select name="type" class="form-control">
								<!-- list of categories -->
								<%List<Category> l=CategoryDao.getCategories();
  		for(Category s:l){
  		%>
								<option value=<%=s.getcID()%>><%=s.getcTitle() %></option>

								<%} %>
							</select>
						</div>
						<div class="container text-center">
							<input type="submit" class="btn btn-success" value="Add Product">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>

						</div>

					</form>

				</div>
			</div>
		</div>
	</div>
	<%--productmodal ends --%>

	<!-- category modal -->
	<div class="modal fade" id="categoryModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="background-color: #e2e2e2;">
				<div class="modal-header">
					<h5 class="modal-title">Add Category</h5>
				</div>
				<div class="modal-body">
					<form action="addItem" method="post">
						<input type="hidden" name="operation" value="category">
						<div class="form-group">
							<input name="cTitle" type="text" class="form-control"
								placeholder="Enter your category title">
						</div>

						<div class="form-group">
							<textarea name="cDesc" class="form-control"
								placeholder="Enter your category description"></textarea>
						</div>
						<div class="container text-center">
							<input type="submit" class="btn btn-success" value="Add Category">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- category modal ends -->
</body>
</html>