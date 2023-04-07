package app;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/logoutservlet")
public class logoutservlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Enumeration<String> en = request.getAttributeNames();
		while(en.hasMoreElements()) {
			String s= en.nextElement();
			session.removeAttribute(s);
		}
		session.invalidate();
		RequestDispatcher dispatcher = super.getServletContext().getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
	}

}