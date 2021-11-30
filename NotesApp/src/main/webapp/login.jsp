<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="all_components/allcss.jsp"%>
</head>
<body>


	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 offset-md-4">
				<div class="card mt-4"></div>
				<div class="card-header text-center text-white bg_custom">
					<i class="fa fa-user-plus fa-3x "></i>
					<h4>Login Page</h4>
				</div>

				<%
				String invalidMsg = (String) session.getAttribute("login-failed");
				if (invalidMsg != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=invalidMsg%></div>
				<%
				session.removeAttribute("login-failed");
				}
				%>
				
				<%
				String withoutLogin = (String) session.getAttribute("login-error");
				if (withoutLogin != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=withoutLogin%></div>
				<%
				session.removeAttribute("login-error");
				}
				%>
				<%
				String logoutMsg=(String)session.getAttribute("logoutMsg");
				if(logoutMsg!=null){
					%>
					<div class="alert alert-success" role="alert"><%=logoutMsg%>
					
				</div>
					<%
					session.removeAttribute("logoutMsg");
				}
				
				%>






				<div class="card-body">
					<form action="loginServlet" method="post">

						<div class="form-group">

							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								name="uemail" aria-describedby="emailHelp">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" name="upassword" class="form-control"
								id="exampleInputPassword1">
						</div>

						<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>