<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="common_components/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
</head>
<body style="background-color: #e2e2e2;">
	<%@include file="common_components/nav.jsp"%>

	<div class="container mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-3 ">
				<div class="container mt-1">
					<%@include file="common_components/message.jsp"%></div>
				<div class="card mt-3" style="background-color: #e5e5e5;">
					<div class="card-header text-center">
						<!-- <div class="container text-center">Login here !!</div>
						<div class="container text-center">
							<img class="card-img-top" src="images/girllogin.jpg"  style="height:10vh;width:20vw;" alt="Card image cap">
						</div>-->
						<i class="fa fa-user" style="font-size: 90px;"></i>
						<h1>Login</h1>
					</div>
					<div class="card-body">
						<form action="login" method="post"
							onsubmit="return validateLogin()">

							<div class="form-group">
								<label for="email">Email</label> <input name="email" type="text"
									class="form-control" id="email" aria-describedby="emailHelp"
									placeholder="Enter your email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small> <small id="emailWarning"
									style="color: red; font-weight: bold; margin-left: 5px;"></small>
							</div>

							<div class="form-group">
								<label for="password">Password</label> <input name="password"
									type="password" class="form-control" id="password"
									placeholder="Password"> <small id="passwordWarning"
									style="color: red; font-weight: bold; margin-left: 5px;"></small>
							</div>


							<div class="container text-center">
								<button type="submit" class="btn btn-warning"
									style="width: 100px;">Login</button>
							</div>
						</form>



					</div>
					<div class="card-footer">
						<div class="container text-center ">
							<a href="Register.jsp" style="color: red;">New to
								ShoppingStore? Create an account...</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>