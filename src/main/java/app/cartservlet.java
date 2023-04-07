package app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/cartservlet")
public class cartservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("id")) ;
		int pqnt = Integer.parseInt(request.getParameter("qnt")) ;
//		String pnm = request.getParameter("nm");
//		String pdc = request.getParameter("desc");
//		String pct = request.getParameter("ct");
//		float pc = Float.parseFloat(request.getParameter("cs")) ;
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = super.getServletContext().getRequestDispatcher("/Home.jsp");
		ArrayList<Products> cart = (ArrayList<Products>) session.getAttribute("cartsession");
		Connection con = loginservlet.getCon();
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from products where id=?");
			pstmt.setInt(1, pid);
	        
	        ResultSet rs = pstmt.executeQuery();
	       
	       if (rs.next()) {
	    	   	String name = rs.getString("name");
				String desc = rs.getString("description");
				String cat = rs.getString("category");
				Float cost = rs.getFloat("price");
				Products p = new Products(pid, name, desc, cat, cost,pqnt);
				if ( cart == null) {
	       			cart = new ArrayList<Products>();
	       			cart.add(p);
	       			session.setAttribute("cartsession", cart);
	       		}else {
	       			
	       			Iterator<Products> iter = cart.iterator();
	       			boolean isfound = false;
	       			while (iter.hasNext()) {
	       				Products a = iter.next();
	       				System.out.println(a.getNm());
	       				if(a.compareTo(p)==0) {
	       					int cq = a.getQunt();
		       				a.setQunt(cq+pqnt);
		       				isfound = true;
	       					break;
	       				}
	       						

	       			}//end of while loop
	       			if(isfound==false) {
	       				cart.add(p);
	       			}
	       			
		       		session.setAttribute("cartsession", cart);
	       			
	       		}
	        	
	       		request.setAttribute("Message", "Added to the cart.");
				dispatcher.forward(request, response);
			}
	       
            pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
}