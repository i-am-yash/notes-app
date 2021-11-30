 package Servlet;

import java.io.IOException;

import DAO.PostDAO;
import Db.DBConnect;


/**
 * Servlet implementation class addNotesServlet
 */
@jakarta.servlet.annotation.WebServlet("/AddNotesServlet")
public class AddNotesServlet extends jakarta.servlet.http.HttpServlet {

	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
	int uid=Integer.parseInt(request.getParameter("uid")); 
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	PostDAO dao= new PostDAO(DBConnect.getConn());
	System.out.println(title+" "+content+" "+uid);
boolean  f=	dao.AddNotes(title, content, uid);
if(f) {
	System.out.println("data inserted successfully");
	response.sendRedirect("showNotes.jsp");
}
else {
	System.out.println("data inserted  un successfully");
}
	}
	

}
