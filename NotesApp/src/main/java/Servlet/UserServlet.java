package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import DAO.UserDAO;
import Db.DBConnect;
import User.UserDetails;

/**
 * Servlet implementation class UserServlet
 */
@jakarta.servlet.annotation.WebServlet("/UserServlet")
public class UserServlet extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws  IOException {
		// TODO Auto-generated method stub
		  response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws  IOException {
		String name=request.getParameter("fname");
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		UserDetails us =new UserDetails();
		us.setEmail(email);
		us.setName(name);
		us.setPassword(password);
		//System.out.println("connection is "+DBConnect.getConn());
		UserDAO dao= new UserDAO(DBConnect.getConn());
		boolean f=dao.addUser(us);
		HttpSession session= request.getSession();
		
		if(f) {
			session.setAttribute("register_success", "Registration Successful..."	);
			response.sendRedirect("register.jsp");
			
		}else {
			session.setAttribute("register_failed", "Something went wrong on server..");
			response.sendRedirect("register.jsp");
			
		}
		doGet(request, response);
	}

}
