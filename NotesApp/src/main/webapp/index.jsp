<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back_img {
	background-image: url("img/cover.jpg");
	color: #ffffff;
	height: 100vh;
	background-position: center;
	font-family: 'Gemunu Libre', sans-serif;
	background-repeat: no-repeat;
	background-size:cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="all_components/allcss.jsp" %>
</head>
<body>
<%@include file="all_components/navbar.jsp" %>
 
<div class="container-fluid back_img">
		<div class="text-center pt-4">
			<h1 class="text-white">Save your Notes</h1>
			<a class="btn btn-outline-custom text-white mr-2" href="login.jsp"
				role="button">Login</a>
				 <a
				class="btn btn-outline-custom text-white mr-2" href="register.jsp"
				role="button">SignUp</a> 
		</div>
	</div>

</body>
</html>