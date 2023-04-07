package app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registerservlet
 */
@WebServlet("/registerservlet")
public class registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String u = request.getParameter("unm");
		String p = request.getParameter("pass");
		String rp = request.getParameter("repass");
		RequestDispatcher sdispatcher = super.getServletContext().getRequestDispatcher("/login.jsp");
        RequestDispatcher udispatcher = super.getServletContext().getRequestDispatcher("/register.jsp");
		
		if(p.equals(rp)) {
			Connection con = loginservlet.getCon();
			try {
				PreparedStatement pstmt = con.prepareStatement("insert into user (username,password) values(?,?)");
				pstmt.setString(1, u);
		        pstmt.setString(2, p);
		        int rs = pstmt.executeUpdate();
		        if (rs==1) {
		        	sdispatcher.forward(request, response);
				} else {
					request.setAttribute("MessageR", "registrasion failed try again");
					udispatcher.forward(request, response);
				}
	            pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			request.setAttribute("MessageR", "passwords dont match");
			udispatcher.forward(request, response);
		}
	}

	

}