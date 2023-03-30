<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="java.util.*,com.Infopackage.Category,com.Infopackage.CategoryDao,com.Infopackage.User"%>
<%User editUser=(User)session.getAttribute("current_user");
if(editUser==null||editUser.getUsertype().equals("Normal"))
{
	session.setAttribute("message", "You are not an admin.You cannot access this page.");
	response.sendRedirect("Login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Categories</title>
<%@include file="common_components/common.jsp"%>
</head>
<body>
	<%@include file="common_components/nav.jsp"%>
	<h4 class="text-center" style="color: #947355">
		<i>Categories</i>
	</h4>
	<table
		class="table table-responsive-sm table-striped table-hover text-center">
		<tr>
			<th style="max-width: 30vw;">Category Name</th>
			<th>Action</th>
		</tr>
		<%
List<Category> catList=CategoryDao.getCategories();
for(Category c:catList)
{
%>
		<tr>
			<td><%=c.getcTitle() %></td>

			<td>
				<button data-toggle="modal" data-target="#editCategoryModal"
					onclick='setCID("<%=c.getcID() %>")' class="btn"
					style="background-color: transparent;">
					<i class="fa fa-pencil"></i>
				</button>
				<form action="editCategory" method="post" id="deleteCategoryForm"
					hidden>
					<input type="hidden" name="delId" value="" id="delId">
				</form>
				<button type="button" class="btn"
					onclick='submitCategoryDeleteForm("<%=c.getcID() %>")'
					style="background-color: transparent;">
					<i class="fa fa-trash"></i>
				</button>
			</td>
		</tr>
		<%} %>
	</table>
	<%@include file="modals/editCategoryModal.jsp"%>
</body>
</html>