package app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String u = request.getParameter("unm");
		String p = request.getParameter("pass");
		HttpSession session = request.getSession();
		String un = (String)session.getAttribute("uname");
		
		
		
		Connection con =getCon();
		try {
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM User WHERE username=? AND password=?");
			pstmt.setString(1, u);
	        pstmt.setString(2, p);
	        ResultSet rs = pstmt.executeQuery();
	        RequestDispatcher sdispatcher = super.getServletContext().getRequestDispatcher("/Home.jsp");
	        RequestDispatcher dispatcherlogin = super.getServletContext().getRequestDispatcher("/login.jsp");
	        if (rs.next()) {
	        	if(session.isNew()||session.getAttribute("uname")==null) {
	    			session.setAttribute("uname",u);
	    		}
	        	sdispatcher.forward(request, response);
			} else {
				request.setAttribute("Message", "Login failed try again");
				dispatcherlogin.forward(request, response);
			}
            pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
    public static Connection getCon() {
		Connection con =null;
		try {
			// Activate the Driver by loading in RAM
			Class.forName("com.mysql.cj.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost:3306/mydb";
			String unm = "root";
			String pass = "Pranjali@04";
			con = DriverManager.getConnection(jdbcurl, unm, pass);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
	}

	

}