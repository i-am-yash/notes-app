package Servlet;

import java.io.IOException;

import DAO.UserDAO;
import Db.DBConnect;
import User.UserDetails;
import jakarta.servlet.http.HttpSession;


@jakarta.servlet.annotation.WebServlet("/loginServlet")
public class loginServlet extends jakarta.servlet.http.HttpServlet {
	
	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws  IOException {
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		UserDetails us= new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		UserDAO dao= new UserDAO(DBConnect.getConn());
		UserDetails user=dao.loginUser(us);
		 if(user!=null) {
			 HttpSession session=request.getSession();
			 session.setAttribute("userD", user);
			 response.sendRedirect("home.jsp");
			// session.removeAttribute("userD");
		 }else {
			 HttpSession session=request.getSession();
				session.setAttribute("login-failed", "Invalid Username or Password");
				response.sendRedirect("login.jsp");
		 }
		
		
	}

}
