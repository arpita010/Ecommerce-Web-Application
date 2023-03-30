<%@page import="com.Infopackage.User"%>
<%
User user1=(User)session.getAttribute("current_user");
%>
<nav class="navbar navbar-expand-lg navbar-dark "
	style="background-color: #431552;">
	<a class="navbar-brand" href="index.jsp"> <img
		src="images/shoppingmall.jpg" width="30" height="30" alt="">
	</a> <a class="navbar-brand" href="index.jsp">MittalStore</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent">
		<span class="navbar-toggler-icon"></span>
	</button>
	<!-- this button is useful for collapsing the options on small devices -->
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa fa-home"></i> Home</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="Aboutus.jsp"><i class="fa fa-info-circle"></i> About us </a></li>
			<li class="nav-item active"><a class="nav-link"
				href="Contactus.jsp"><i class="fa fa-phone"></i> Contact us </a></li>
		</ul>

		<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link"
				href="AddCart.jsp"> <i class="fa fa-cart-plus"
					style="font-size: 25px;"></i> <%if(session.getAttribute("cartcount")==null){ %>
					<%="0"%>
					<%}else{ %> (<%=session.getAttribute("cartcount") %> <%}%>)
			</a></li>
			<%if(user1==null){ %>
			<li class="nav-item active"><a class="nav-link" href="Login.jsp"
				title="login"><i class="fa fa-sign-out"></i> Login </a></li>
			<li class="nav-item active"><a class="nav-link"
				href="Register.jsp"><i class="fa fa-user-circle-o"></i> Register
			</a></li>
			<%} else{%>
			<li class="nav-item active"><a class="nav-link"
				<%if(user1.getUsertype().equals("Normal")){ %> href="index.jsp"
				<%}else{ %> href="Admin.jsp" <%} %>> <i class="fa fa-user-o"></i>
					<%=user1.getUsername() %>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="Logout.jsp"><i class="fa fa-sign-out"></i> Logout </a></li>
			<%} %>
		</ul>
	</div>
</nav>
<%if(user1!=null){ %>
<%@include file="navNormal.jsp"%>
<%} %>