<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="java.util.*,com.Infopackage.User,com.Infopackage.UserDao"%>
<% User thisUser=(User)session.getAttribute("current_user"); 
if(thisUser==null||thisUser.getUsertype().equals("Normal"))
{
	session.setAttribute("message","You are not admin...You cannot access this page..");
	response.sendRedirect("Login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Users</title>
<%@include file="common_components/common.jsp"%>
</head>
<body>
	<%@include file="common_components/nav.jsp"%>
	<h1 class="text-center" style="font-style: italic; color: #937487">Active
		Users</h1>
	<table
		class="table table-striped table-hover table-responsive-sm text-center">
		<tr>
			<th>Username</th>
			<th>Email</th>
			<th>Phone Number</th>
			<th>User Type</th>
			<th>Action</th>
		</tr>
		<%
List<User> ulist=UserDao.getAllUsersList();
for(User u:ulist)
{
%>
		<tr>
			<td><%=u.getUsername() %></td>
			<td><%=u.getEmail() %></td>
			<td><%=u.getPhoneNumber() %></td>
			<td><%=u.getUsertype() %></td>
			<td>
				<form action="editUser" method="post">
					<input type="hidden" name="userId" value="<%=u.getUserID()%>">
					<button type="submit" class="btn"
						style="background-color: transparent;">
						<i class="fa fa-trash"></i>
					</button>
				</form>
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>