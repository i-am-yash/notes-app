<%@page import="java.util.*"%>
<%@page import="Db.DBConnect"%>
<%@page import="DAO.PostDAO"%>
<%@page import="User.Post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");
if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please Login...");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="all_components/allcss.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	
	<%
	String updateMsg= (String)session.getAttribute("updateMsg");
	if(updateMsg!=null){
		%>
		<div class="alert alert-success" role="alert"><%=updateMsg%></div>
		<%
		session.removeAttribute("updateMsg");
	}
	%>
	
	<%
	String deleteMsg= (String)session.getAttribute("deleteMsg");
	if(deleteMsg!=null){
		%>
		<div class="alert alert-success" role="alert"><%=deleteMsg%></div>
		<%
		session.removeAttribute("deleteMsg");
	}
	%>
	
	<%
	String delete_failed= (String)session.getAttribute("delete-failed");
	if(delete_failed!=null){
		%>
		<div class="alert alert-success" role="alert"><%=delete_failed%></div>
		<%
		session.removeAttribute("delete_failed");
	}
	%>
	





	<div class="container">
		<h2 class="text-center mt-2">Your Notes</h2>
		<div class="row">
			<div class="col-md-12">
				<%
				//System.out.println(user3 + "is user3");
				if (user3 != null) {

					PostDAO ob = new PostDAO(DBConnect.getConn());
					List<Post> post = ob.getData(user3.getId());
					System.out.println("Use3 notnull ");
					System.out.println(post);
					for (Post po : post) {   
				%>


				<div class="card mt-3 md-2">
					<img alt="" src="img/Notes.png" class="card-img-top mt-2 mx-auto"
						style="max-width: 150px;">
					<div class="card-body p-4">
						<h5 class="card-title"><%=po.getTitle() %></h5>
						<p><%=po.getContent() %></p>
						<p>
							<b class="text-success"> Published By:-  <%=user3.getName() %></b> <b
								class="text-primary"></b>
						</p>
						<p>
							<b class="text-success">Date:- </b> <b class="text-primary"><%=po.getPdate() %></b>
						</p>
						<div class="container text-center mt-2">
							<a href="edit.jsp?note_id=<%=po.getId() %>" class="btn btn-primary">Edit</a> <a
								href="DeleteServlet?notes_id=<%=po.getId()%>" class="btn btn-danger">Delete</a>
						</div>
					</div>
				</div>



				<%
				}
				}
				%>





			</div>

		</div>


	</div>

</body>
</html>