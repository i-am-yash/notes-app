package Servlet;


import java.io.IOException;

import jakarta.servlet.http.HttpSession;


@jakarta.servlet.annotation.WebServlet("/LogoutServlet")
public class LogoutServlet extends jakarta.servlet.http.HttpServlet {

	protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
		
		try {
		HttpSession session =request.getSession();
		session.removeAttribute("userD");
		HttpSession session2= request.getSession();
		session2.setAttribute("logoutMsg", "Logout Successfully...");
		response.sendRedirect("login.jsp");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	
 
}
