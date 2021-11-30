package Servlet;

import java.io.IOException;

import DAO.PostDAO;
import Db.DBConnect;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class NotesEditServlet
 */
@jakarta.servlet.annotation.WebServlet("/NotesEditServlet")
public class NotesEditServlet extends jakarta.servlet.http.HttpServlet {
	

	
	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
		
		try {
			int id = Integer.parseInt(request.getParameter("note_id"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			PostDAO dao = new PostDAO(DBConnect.getConn());
			boolean f=dao.PostUpdate(id, title, content);
			if(f) {
				System.out.println("Entry updated Successfully");
				HttpSession session= request.getSession();
				session.setAttribute("updateMsg"," Notes Update Successfully...");
				response.sendRedirect("showNotes.jsp");
			}
				
				
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
	}

}
