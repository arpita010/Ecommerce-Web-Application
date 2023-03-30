
<%
	session.removeAttribute("cartcount");
	session.removeAttribute("current_user"); 
	session.removeAttribute("cart");
	session.setAttribute("message", "You have successfully logged out !!"); 
	response.sendRedirect("Login.jsp"); 
%>
