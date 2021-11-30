<%@page import="User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-light">
  <a class="navbar-brand" href="#"><i class="fa fa-book"></i>ENotes</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="home.jsp"><i class="fa fa-home"></i>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addNotes.jsp"><i class="fa fa-plus-circle"></i>Add Notes</a>
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="showNotes.jsp"><i class="fa fa-address-book"></i>Show Notes</a>
      </li>
    </ul>
		<%
		UserDetails user = (UserDetails) session.getAttribute("userD");
		if (user != null) {
		%>
		<a   data-toggle="modal" data-target="#exampleModal" class="btn btn-dark text-white my-2 my-sm-0 mr-2" type="submit"><i
			class="fa fa-user-circle"></i><%=user.getName() %></a>
			 <a href="LogoutServlet"
			class="btn btn-dark my-2 my-sm-0" type="submit"><i
			class="fa fa-user-plus"></i>Logout</a>
			

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
              <div class ="contianer text-center">
       						<i class="fa fa-user fa-3x"></i>
								<h5></h5>
								<table class="table">
									<tbody>
										<tr>
											<th>ID</th>
											<td><%=user.getId()%></td>
										</tr>
										<tr>
											<th>Full Name</th>
											<td><%=user.getName()%></td>
										</tr>
										<tr>
											<th>Email Id</th>
											<td><%=user.getEmail()%></td>
										</tr>
									</tbody>
								</table>
								</div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
			
		<%
		} else {
		%>
		<a  class="btn btn-dark my-2 my-sm-0 mr-2" type="submit" href="login.jsp"><i
			class="fa fa-user-circle"></i>Login</a> <a href="register.jsp"
			class="btn btn-dark my-2 my-sm-0" type="submit"><i
			class="fa fa-user-plus"></i>Register</a>
				
		<%
		
		}
		%>


	</div>
	
	<!-- Button trigger modal -->

	
</nav>