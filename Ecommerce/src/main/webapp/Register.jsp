<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="common_components/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Form Page</title>
</head>
<body style="background-color: #e2e2e2;">
	<%@include file="common_components/nav.jsp"%>
	<div class="container mt-2 ">
		<div class="row ">
			<div class="col-md-6 offset-md-3">
				<%@include file="common_components/message.jsp"%>
				<div class="card" style="background-color: #e2e2e2;">
					<div class="card-header text-center">
						<i class="fa fa-user-plus" style="font-size: 70px; color: purple;"></i>
					</div>
					<!-- end of card header -->
					<div class="card-body">
						<!-- start card-body -->
						<form action="register" method="post"
							onsubmit=" return validateRegistration()">
							<div class="form-group">
								<label for="username">Username</label> <input name="username"
									type="text" class="form-control" id="username"
									placeholder="Enter your name"> <small
									id="usernameWarning"
									style="color: red; font-weight: bold; margin-left: 5px;"></small>
							</div>
							<div class="form-group">
								<label for="email">Email address</label> <input name="email"
									type="text" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter your email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small> <small
									id="emailWarning"
									style="color: red; font-weight: bold; margin-left: 5px;"></small>
							</div>
							<div class="form-group">
								<label for="phonenumber">Phone Number</label> <input
									name="phonenumber" type="text" class="form-control"
									id="phonenumber" placeholder="Enter your Phone Number">
								<small id="phoneWarning"
									style="color: red; font-weight: bold; margin-left: 5px;"></small>

							</div>
							<div class="form-group">
								<label for="password">Password</label> <input name="password"
									type="password" class="form-control" id="password"
									placeholder="Password"> <small id="passwordWarning"
									style="color: red; font-weight: bold; margin-left: 5px;"></small>

							</div>
							<div class="form-group">
								<label for="usertype">User Type</label> <select name="usertype"
									class="form-control" id="usertype">
									<option value="Admin">Admin</option>
									<option value="Normal">Normal</option>
								</select>
							</div>

							<div class="text-center ">
								<input type="submit" class="btn btn-outline-success"
									value="Register"> <a href="Login.jsp" class="ml-2"
									style="color: #431552;">Existing User? Login....</a>
							</div>

							<!--  
  <div class="text-center mt-1">
  <button type="submit" class="btn btn-success">Register</button></div>-->
						</form>
					</div>
					<!-- card body end  -->



				</div>
				<!-- card-end -->

			</div>
			<!-- column end  -->
		</div>
		<!-- row end -->

	</div>
	<!-- container's end -->








</body>
</html>