<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="all_components/allcss.jsp"%>
<style type="text/css">
.bg_custom {
	background-color: #666750;
}
</style>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 offset-md-4">
				<div class="card mt-4"></div>
				<div class="card-header text-center text-white bg_custom">
					<i class="fa fa-user-plus fa-3x "></i>
					<h4>Registration</h4>
				</div>
				<%
				String regMsg = (String) (session.getAttribute("register_success"));
				if (regMsg != null) {
				%><div class="alert alert-success" role="alert"><%=regMsg%>
					Login <a href="login.jsp">Click Here</a>
				</div>
				<%
				}
				session.removeAttribute("register_success");
				%>
				<%
				String failedRegister = (String) (session.getAttribute("register_failed"));
				if (failedRegister != null) {
				%>
				<div class="alert alert-danger" role="alert">
					<%=failedRegister%>
				</div>
				<%
				session.removeAttribute("register_failed");
				}
				%>



				<div class="card-body">
					<form action="UserServlet" method="post">
						<div class="form-group">
							<label>Enter Full Name</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="fname">
						</div>
						<div class="form-group">

							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="uemail">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								name="upassword">
						</div>

						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>