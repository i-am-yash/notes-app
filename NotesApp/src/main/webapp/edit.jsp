<%@page import="DAO.PostDAO"%>
<%@page import="User.Post"%>
<%@page import="Db.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_components/allcss.jsp"	 %>
</head>
<body>
<%
int noteid= Integer.parseInt( request.getParameter("note_id"));
System.out.println(noteid);
PostDAO  post = new PostDAO( DBConnect.getConn() );
Post p= post.getDataById(noteid); 

%>


<div class="container-fluid"	>
<%@include file="all_components/navbar.jsp" %>
<h1 class="text-center"> Edit your Notes</h1>
<div class="container">

<div class="row"	>
<div class="col-md-12">

<form action="NotesEditServlet" method="post"> 
  <div class="form-group">
 

  
    <label for="exampleInputEmail1">Enter Title</label>
    <input type="hidden" value=<%=noteid	 %>  name="note_id"/>
    <input type="text"  name="title"   value=<%=p.getTitle() %> class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" >
   
  </div>
  <div class ="form-group">
  <label for="exampleInputEmail1">Enter Notes</label>
  <textarea rows="8 " cols=""class="form-control" name="content" required="required"><%=p.getContent() %> </textarea>
  </div>
  
 <div class="container text-center">
   <button type="submit" class="btn btn-primary">Edit Notes</button>
  </div>

</form>

</div>
</div>

</div>
 
</div>



</body>
</html>