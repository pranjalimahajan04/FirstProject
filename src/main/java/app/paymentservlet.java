package app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class paymentservlet
 */
@WebServlet("/paymentservlet")
public class paymentservlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String addr = request.getParameter("uaddr");
		HttpSession session = request.getSession();
		String un = (String) session.getAttribute("uname");
		Connection con = loginservlet.getCon();
		ArrayList<Products> c = (ArrayList<Products>)session.getAttribute("cartsession"); 
		RequestDispatcher sdispatcher = super.getServletContext().getRequestDispatcher("/success.jsp");
		PreparedStatement st ,pstmt,pst;
		try {
			st = con.prepareStatement("select orderid from orders where user=? and paymentstatus=?");
			st.setString(1, un);
			st.setString(2, "Pending");
			//ResultSet rs = st.executeQuery();
			for(Products p:c)
			{
				pstmt = con.prepareStatement("insert into purchase (quantity,productid,orderid) values(?,?,?)");
				pstmt.setInt(1, p.getQunt());
		        pstmt.setInt(2, p.getId());
		        ResultSet rs = st.executeQuery();
		        if(rs.next()) {
		        	pstmt.setString(3, rs.getString("orderid"));
				}
		        pstmt.executeUpdate();
			}
			pst = con.prepareStatement("update orders set paymentstatus= ? where user=?");
			pst.setString(1, "Successful");
			pst.setString(2, un);
			pst.executeUpdate();
			session.removeAttribute("cartsession");
			sdispatcher.forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}