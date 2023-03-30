<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="com.Infopackage.Card,com.Infopackage.CardDao,com.Infopackage.User,com.Infopackage.ProductDao,com.Infopackage.Product"%>
<%@page import="java.util.*"%>
<%@include file="common_components/common.jsp"%>
<!-- java code -->
<% Map<Integer,Integer> cart=(HashMap<Integer,Integer>)session.getAttribute("cart"); 
	double sum=0;
	%>

<%	User user=(User)session.getAttribute("current_user");
		String removeid=(String)request.getParameter("removeid");
		if(user==null)
		{
			session.setAttribute("message", "You are not allowed to add item in cart!Login first to do so!");
			response.sendRedirect("Login.jsp");
			return;
		}
		else if(removeid!=null)
		{
			int rid=Integer.parseInt(removeid);
			if(cart.get(rid)>1)
			{
				cart.put(rid,cart.get(rid)-1);
			}
			else
			cart.remove(rid,1);
			int c=Integer.valueOf((String)session.getAttribute("cartcount"));
			session.setAttribute("cartcount",String.valueOf(c-1));
			session.removeAttribute("removeid");
		}
		else
		{
			if(request.getParameter("pid")!=null)
			{
			int pid=Integer.parseInt(request.getParameter("pid"));
			Product p=ProductDao.getProduct(pid);
			if(cart.containsKey(pid))
			{
				if(cart.get(pid)<p.getQuantity()){
				cart.put(pid,cart.get(pid)+1);

				int c=Integer.valueOf((String)session.getAttribute("cartcount"));
				session.setAttribute("cartcount",String.valueOf(c+1));
				}
				else
				{
					session.setAttribute("message","You cannot add this item because It is out of stock now.");
					response.sendRedirect("index.jsp");
					return;
				}
			}
			else if(p.getQuantity()>0)
			{
				cart.put(pid,1);
				int c=Integer.valueOf((String)session.getAttribute("cartcount"));
				session.setAttribute("cartcount",String.valueOf(c+1));
			}
			else
			{
				//message will be displayed !;
				session.setAttribute("message","no item available in the store !");
				response.sendRedirect("index.jsp");
				return;
			}
			}
		}
	
	%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add to Cart</title>
</head>
<body style="background-color: #e2e2e2;">
	<%@include file="common_components/nav.jsp"%>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-8">
				<div class="card">

					<div class="card-header">
						<h4>Your Cart Details</h4>

					</div>
					<!-- end of header1 -->
					<div class="card-body">
						<% if(cart==null||cart.size()==0){%>
						<h4>Cart is empty now....!</h4>
						<%}
					else{%>

						<table class="table table-sm ">
							<thead>
								<tr>
									<th>Product ID</th>
									<th>Product Name</th>
									<th>Product Description</th>
									<th>Product Price(per item)</th>
									<th>Quantity</th>
									<th>Total Price</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<% 
					for(int i:cart.keySet())
					{
						Product p=ProductDao.getProduct(i);
						double amount=p.getpPrice()-(p.getpDiscount()*p.getpPrice())/100; 
						
					%>

								<tr>
									<td><%=i %></td>
									<%String pt=p.getpTitle(); 
								if(pt.length()>=30)
									pt=pt.substring(0,30)+"...";
								%>
									<td><%=pt %></td>
									<% String descp=p.getpDesc();
								if(descp.length()>=30)
								descp=descp.substring(0,30)+"...";%>
									<td><%=descp %></td>
									<td><%=amount %></td>
									<td><%=cart.get(i) %></td>
									<td><%=amount*cart.get(i) %></td>
									<td><a href='AddCart.jsp?removeid=<%=i%>'
										class="btn btn-danger">Remove</a></td>
								</tr>
								<%
					sum+=(amount*cart.get(i));
					} %>

							</tbody>
						</table>
						<%} %>
					</div>
					<!-- end of card-body1 -->

					<div class="card-footer">
						<h6 class="text-right">
							Total Amount :
							<%= sum%></h6>
						<div class="text-center">
							<a href="index.jsp" class="btn btn-primary">Continue Shopping</a>

						</div>
						<!-- button div end -->


					</div>
					<!-- end of card-footer-1 -->



				</div>
				<!-- end of card1 -->


			</div>
			<!-- end of column1 -->
			<%if(user!=null){ %>
			<div class="col-md-4">
				<div class="card">

					<div class="card-header">
						<h3>Your Shipping Details</h3>

					</div>
					<!-- end of header2 -->
					<div class="card-body">
						<form action="Order.jsp" method="post">
							<input type="hidden" name="total" value="<%=sum %>"> <input
								type="hidden" name="userid" value="<%=user.getUserID() %>">
							<div class="form-group">
								<label for="username">Username</label> <input name="username"
									type="text" class="form-control" id="username"
									value="<%=user.getUsername() %>">
							</div>
							<!-- field 2 -->
							<div class="form-group">
								<label for="useremail">User Email</label> <input
									name="useremail" type="email" class="form-control"
									id="useremail" value="<%=user.getEmail() %>">
							</div>
							<!-- field 3 -->
							<div class="form-group">
								<label for="phonenumber">Phone Number</label> <input
									name="phonenumber" type="number" class="form-control"
									id="phonenumber" value="<%=user.getPhoneNumber() %>">
							</div>
							<!-- field 4 -->
							<div class="form-group">
								<label for="payment">Payment</label> <select id="payment"
									name="payment" class="form-control">
									<!-- list of categories -->
									<%List<Card> cardlist=CardDao.getCardsList(user.getUserID());
  		for(Card c:cardlist){
  		
  		%>

									<option value=<%=c.getCardid() %>><%=c.getFutureCardName() %></option>

									<%} %>
								</select> <span class="text-center" style="color: red;"> <small>**If
										you haven't add any card,Go to Payments to add card first.</small></span>
							</div>
							<!-- field 5 -->
							<div class="form-group">
								<textarea name="address" class="form-control"
									placeholder="Enter your Address"></textarea>
							</div>
							<!-- field 5 -->


							<div style="text-align: center; margin: auto;">
								<button type="submit" class="btn btn-outline-primary">Order
									now</button>
							</div>
						</form>

					</div>
					<!-- end of card-body2 -->

				</div>
				<!-- end of card2 -->


			</div>
			<!-- end of column2 -->
			<%} %>

		</div>
		<!-- end of row -->



	</div>

</body>
</html>