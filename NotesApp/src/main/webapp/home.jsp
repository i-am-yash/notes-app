<%@page import="User.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
     <%
    UserDetails user2=(UserDetails)session.getAttribute("userD");
    if(user2==null){
    response.sendRedirect("login.jsp");	
    session.setAttribute("login-error","Please Login...");
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_components/allcss.jsp" %>
</head>
<body>
<%@include file="all_components/navbar.jsp" %>

<div class="container-fluid p-0">
		<div class="card py-3">
			<div class="card-body text-center">
				<img alt="" src="img/Notes.png" class="img-fluid mx-auto"
					style="max-width: 350px;">
				<h1>START TAKING YOUR NOTES</h1>
				<a href="addNotes.jsp" class="btn btn-info my-4">Start Here</a>

			</div>
		</div>
	</div> 

</body>
</html>