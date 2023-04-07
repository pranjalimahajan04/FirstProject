package app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class buyservlet
 */
@WebServlet("/buyservlet")
public class buyservlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String un = (String) session.getAttribute("uname");
		Connection con = loginservlet.getCon();
		RequestDispatcher dispatcher = super.getServletContext().getRequestDispatcher("/buy.jsp");
		try {
				PreparedStatement pstmt = con.prepareStatement("insert into orders (dateofpurchase,user,paymentstatus,deliverystatus) values(?,?,?,?)");
				LocalDate today = LocalDate.now();
				Date td = Date.valueOf(today);
				pstmt.setDate(1, td);
		        pstmt.setString(2, un);
		        pstmt.setString(3, "Pending");
		        pstmt.setString(4, "Pending");
		        pstmt.executeUpdate();
		        dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}