package Servlet;


import java.io.IOException;

import DAO.PostDAO;
import Db.DBConnect;
import jakarta.servlet.http.HttpSession;
/**
 * Servlet implementation class DeleteServlet
 */
@jakarta.servlet.annotation.WebServlet("/DeleteServlet")
public class DeleteServlet extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public DeleteServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
		int notesid=Integer.parseInt(request.getParameter("notes_id"));
		PostDAO dao = new PostDAO(DBConnect.getConn());
		boolean f= dao.deleteData(notesid);
		HttpSession session;
		if(f) {
			session =request.getSession();
			session.setAttribute("deleteMsg", "Data is deleted Successfully..");
			response.sendRedirect("showNotes.jsp");
		} 
		else {
			session=request.getSession();
			session.setAttribute("delete-failed", "Something went wrong ,Please Try again..."	);
		}
		
	}

	

}
