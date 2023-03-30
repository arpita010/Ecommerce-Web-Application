<%@page
	import="com.Infopackage.*,java.util.*,com.Infopackage.ProductDao"%>
<!-- internal css styling -->
<style>
.dropdown:hover {
	cursor: pointer;
}
</style>
<!--internal css styling ends-->
<%User user5=(User)session.getAttribute("current_user"); %>
<nav class="navbar navbar-expand-lg navbar-dark "
	style="background-color: #5c6169;">
	<div class="container">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbar">
			<ul class="navbar-nav mr-4 ml-4">
				<li class="nav-item active mr-4 ml-4"><a class="nav-link"
					href="#" data-toggle="modal" data-target="#orderlist">My orders
				</a></li>


				<li class="nav-item active mr-4 ml-4"><a class="nav-link"
					href="#" data-toggle="modal" data-target="#myprofile">My
						Profile </a></li>

				<li class="nav-item active mr-4 ml-4"><a class="nav-link"
					href="#" data-toggle="modal" data-target="#editProfile">Edit
						Profile </a></li>
				<li class="nav-item active mr-4 ml-4">

					<div class="dropdown">
						<a class="nav-link active dropdown-toggle" id="dropdownMenuButton"
							data-toggle="dropdown"> Payments </a>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#" data-toggle="modal"
								data-target="#addcard">Add a card</a> <a class="dropdown-item"
								href="#" data-toggle="modal" data-target="#mycards">My cards</a>
						</div>
					</div>
					<!-- dropdown ends -->
				</li>


				<li class="nav-item active mr-4 ml-4"><a class="nav-link"
					href="#exampleModal" data-toggle="modal"
					data-target="#deactivateModal">Deactivate Your Account </a></li>

			</ul>
		</div>









	</div>
	<!-- container1 ends  -->
</nav>

<!-- modals -->

<!-- Modal deactivate account-->
<div class="modal fade" id="deactivateModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="background-color: #e2e2e2;">
			<div class="modal-header">
				<h5 class="modal-title">Are You sure to deactivate your
					account?</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<!--
      <div class="modal-body">
        ...
      </div>  -->

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<a class="btn btn-danger" href="normal?action=1">Yes! I'm sure.</a>
			</div>
		</div>
	</div>
</div>
<!-- modaldeactivateaccount ends  -->

<!-- modal for edit profile -->
<div class="modal fade" id="editProfile">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="background-color: #e2e2e2;">
			<div class="modal-header">
				<h5 class="modal-title">Edit Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<form action="normal?action=2" method="post">
					<div class="form-group">
						<label for="newusername">New Username</label> <input type="text"
							class="form-control" name="newusername" id="newusername"
							value="<%=user5.getUsername()%>">
					</div>
					<div class="form-group">
						<label for="newemail">New Email</label> <input type="email"
							class="form-control" name="newemail" id="newemail"
							value="<%=user5.getEmail()%>">
					</div>
					<div class="form-group">
						<label for="newphonenumber">New Phone Number</label> <input
							type="text" class="form-control" name="newphonenumber"
							id="newphonenumber" value="<%=user5.getPhoneNumber()%>">
					</div>
					<div class="form-group">
						<label for="newpassword">New Password</label> <input
							type="password" class="form-control" name="newpassword"
							id="newpassword" value="<%=user5.getPassword()%>">
					</div>
					<input type="hidden" name="olduserid"
						value="<%=user5.getUserID()%>">
					<div class="text-right">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancel</button>
						<input type="submit" class="btn btn-success"
							value="Commit changes">
					</div>
					<!-- div for buttons -->

				</form>
			</div>



		</div>
		<!-- modal content -->
	</div>
	<!-- modal dailog -->
</div>
<!-- modal -->





<!-- modal for editprofile ends  -->

<!-- modal for view profile/myprofile -->
<div class="modal fade" id="myprofile" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="background-color: #e2e2e2;">
			<div class="modal-header ">
				<h5 class="modal-title " id="exampleModalLabel">Profile Details</h5>
			</div>
			<!-- header ends -->

			<div class="modal-body">
				<table class="table table-hover">
					<tr class="table-danger">
						<td>User ID :</td>
						<td><%=user5.getUserID() %></td>
					</tr>
					<tr class="table-success">
						<td>Username :</td>
						<td><%=user5.getUsername() %></td>
					</tr>
					<tr class="table-primary">
						<td>User Email :</td>
						<td><%=user5.getEmail() %></td>
					</tr>
					<tr class="table-info">
						<td>User Phone Number :</td>
						<td><%=user5.getPhoneNumber() %></td>
					</tr>
				</table>
			</div>
			<!-- modal body ends  -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- end myprofile modal -->

<!-- my orders list modal -->
<div class="modal fade" id="orderlist">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="background-color: #e2e2e2;">
			<div class="modal-header">
				<h5 class="modal-title">Your orders</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<%List<Order> list=OrderDao.getSameUserOrder(user5.getUserID());
      if(list.size()==0)
      {
      %>
				<h5 class="text-center">You haven't place any order yet !</h5>
				<%}else{ %>
				<table class="table table-hover table-striped">
					<thead>
						<tr class="table-info">
							<th>Order ID</th>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<% 
      for(Order o:list){
    	  String pmap=o.getProductIDs();
    	  pmap=pmap.substring(1,pmap.length()-1);
    	  String[] pl=pmap.split(",");
      	String[] arr=new String[2];
      %>
						<tr>
							<td><%=o.getOrderid() %></td>
							<td>
								<ul>
									<% for(String s:pl){
    	  arr=s.split("=");
    	  Product p=ProductDao.getProduct(Integer.parseInt(arr[0].trim()));
      %>
									<li><%=p.getpTitle() %></li>
									<%} %>
								</ul>
							</td>
							<!-- inner for loop -->
							<!-- 3rd column -->
							<td>
								<ul>
									<%for(String s:pl){
    	  arr=s.split("=");%>
									<li><%=arr[1] %></li>
									<%} %>
								</ul>
							</td>
							<td>
								<!-- <a href="#" class="btn btn-danger">Cancel</a> -->
								<form action="order" method="post">
									<input type="hidden" name="orderId" value=<%=o.getOrderid() %>>
									<button type="submit" class="btn btn-danger">Cancel
										Order</button>
								</form>
							</td>
						</tr>
						<%} %><!-- outer for lopp ends -->

					</tbody>


				</table>
				<%} %>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

			</div>
		</div>
	</div>
</div>



<!-- my orders list modal ends  -->

<!-- add a card modal -->
<div class="modal fade" id="addcard" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="background-color: #e2e2e2;">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Edit Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<form action="card" method="post">
					<input type="hidden" name="userID" value=<%=user5.getUserID() %>>
					<div class="form-group">
						<label for="cardnumber">Card Number</label> <input type="text"
							class="form-control" name="cardnumber" id="cardnumber"
							placeholder="Enter Card no. ">
					</div>
					<div class="form-group">
						<label for="nameOnCard">Name On Card</label> <input type="text"
							class="form-control" name="nameOnCard" id="nameOnCard"
							placeholder="Enter Card Holder's Name">
					</div>
					<div class="form-group">
						<label for="futureCardName">Name this card for future use</label>
						<input type="text" class="form-control" name="futureCardName"
							id="futureCardName"
							placeholder=" Enter name of card for future reference">
					</div>
					<div class="text-right">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancel</button>
						<input type="submit" class="btn btn-danger" value="Save this Card">
					</div>
					<!-- div for buttons -->

				</form>
			</div>



		</div>
		<!-- modal content -->
	</div>
	<!-- modal dailog -->
</div>
<!-- modal -->

<!-- add a card modal ends -->

<!-- my cards modal -->
<div class="modal fade" id="mycards" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="background-color: #e2e2e2;">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Your Cards</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<%List<Card> clist=CardDao.getCardsList(user5.getUserID()); 
        if(clist.size()==0){
        %>
				<h5 class="text-center">No card available !!</h5>
				<%}else{%>
				<table class="table table-striped">
					<tr>
						<th>Card Number</th>
						<th>Name On Card</th>
						<th>Future Name of Card</th>
						<th>Action</th>
					</tr>
					<tbody>
						<% for(Card c:clist){%>
						<tr>
							<td><%=c.getCardnumber() %></td>
							<td><%=c.getNameOnCard() %></td>
							<td><%=c.getFutureCardName() %></td>
							<td><a href="card?cardid=<%=c.getCardid()%>"
								class="btn btn-danger">Delete</a></td>
						</tr>
						<%} %>
					</tbody>



				</table>
				<%} %>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>









<!-- my cards modal ends  -->