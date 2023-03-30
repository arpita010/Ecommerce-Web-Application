
<%
if(session.getAttribute("cart")==null)
{
	session.setAttribute("cartcount","0");
	session.setAttribute("cart", new HashMap<Integer,Integer>());
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="com.Infopackage.Category,com.Infopackage.CategoryDao,com.Infopackage.ProductDao,com.Infopackage.Product"%>
<%@page import="java.util.*"%>
<%@include file="common_components/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShoppingStore</title>
<style>
.list-group-item {
	background-color: #e2e2e2;
}

.card {
	background-color: #e2e2e2;
}

.card:hover {
	background-color: #e7d3ed;
}
</style>
</head>
<body style="background-color: #e2e2e2;">
	<%@include file="common_components/nav.jsp"%>
	<div class="container text-center"
		style="max-width: 60%; margin-top: 2px;">
		<%@include file="common_components/message.jsp"%>
	</div>

	<div class="row mt-3 mx-2">
		<div class="col-sm-2">

			<div class="list-group" style="overflow-y: auto; max-height: 100vh;">
				<%if(request.getParameter("category")==null||request.getParameter("category").equals("all")) {%>
				<a href="index.jsp?category=all"
					class="list-group-item list-group-item-actions "
					style="background-color: #431552; color: white;"> All Products
				</a>
				<%}else{ %>
				<a href="index.jsp?category=all"
					class="list-group-item list-group-item-actions "
					style="color: black;"> All Products </a>


				<%} %>
				<%
  		List<Category> list=CategoryDao.getCategories();
  		
		for(Category s:list)
		{
		%>
				<%if((request.getParameter("category")!=null)&&(request.getParameter("category").equals(String.valueOf(s.getcID())))){ %>
				<a href="index.jsp?category=<%=s.getcID() %>"
					id="listbtn<%=s.getcID()%>"
					class="list-group-item list-group-item-action "
					style="background-color: #431552; color: white;"><%=s.getcTitle() %></a>
				<%	
		}else{
		%>
				<a href="index.jsp?category=<%=s.getcID() %>"
					id="listbtn<%=s.getcID()%>"
					class="list-group-item list-group-item-action "><%=s.getcTitle() %></a>

				<%}} %>
			</div>


		</div>
		<div class="col-sm-10">
			<div class="row ">
				<div class="card-columns ml-2 mr-3">
					<!-- card-columns -->

					<%-- 
				
  			</div>
		--%>
					<%
		String str="D:\\eclipse-workspace\\apache-tomcat-7.0.109\\webapps\\ProductImages\\profile.jpg";
		String ltype=request.getParameter("category");
		List<Product> pList=null;
		if(ltype==null||ltype.trim().equals("all"))
		pList=ProductDao.getProductList();
		else
			pList=ProductDao.getSelectedProducts(ltype);
		for(Product p:pList)
		{
		%>

					<div class="card">
						<div class="card-header text-center">
							<a href="productDetails.jsp?pid=<%=p.getPid() %>"><img
								class="card-img-top img-fluid rounded-circle"
								src="dynamicImages/<%=p.getpPhoto()%>"
								style="width: 15vw; height: 15vh;" alt="Card image cap"> </a>
						</div>
						<div class="card-body">
							<%String title="";
    					if(p.getpTitle().length()>=60)
    						title=p.getpTitle().substring(0,60)+"....";
    					else
    						title=p.getpTitle();
    					%>
							<h5 class="card-title">
								<%=title %>
							</h5>
							<%String desc="";
      					if(p.getpDesc().length()<=100)
      						desc=p.getpDesc();
      					else
      						desc=p.getpDesc().substring(0,100)+"....";
      					%>
							<p class="card-text"><%=desc %></p>
						</div>
						<div class="card-footer container text-center">
							<div class="row text-center ml-2">
								<form action="AddCart.jsp" method="post">
									<%double amount=p.getpPrice()-(p.getpDiscount()*p.getpPrice())/100; %>
									<button type="button"
										class="btn btn-outline-secondary ml-2 mr-2 disabled">
										<i class="fa fa-inr"></i><%=amount%>, <i><small><i
												class="fa fa-inr"></i>
											<del><%=Double.valueOf(p.getpPrice())%></del> (<%=p.getpDiscount() %>%
												off)</small></i>
									</button>
									<button type="submit" class="btn btn-primary">Add to
										cart</button>
									<input type="hidden" name="pid" value=<%=p.getPid() %>>


								</form>
								<!-- <button class="btn btn-primary" type="submit">Add to cart</button>-->
							</div>
							<!-- end of row -->

						</div>
						<!-- end of card footer -->
					</div>
					<% }%>
				</div>
				<!-- end of card-columns -->
			</div>



		</div>

	</div>
</body>
</html>