<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.Products"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% if(session.getAttribute("uname")==null){
	 RequestDispatcher dispatcher = super.getServletContext().getRequestDispatcher("/login.jsp");
	 dispatcher.forward(request, response);
} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
	<style type="text/css">

	hr{
		margin-top: 2rem !important;
	}
	.col{
		padding-left: 50px;
	}
	
	</style>
</head>
<body>
	<%!public static Connection getCon() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost:3306/mydb";
			String unm = "root";
			String pass = "Pranjali@04";
			con = DriverManager.getConnection(jdbcurl, unm, pass);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
	}%>
	<div class="class=" container-lg" style="padding-top: 30px;">
	<h1>Payment</h1>
		<div class="row">
		<% ArrayList<Products> cart1 = (ArrayList<Products>)session.getAttribute("cartsession"); 
			float cartcost = 0;
			for(Products p:cart1)
			{	
		%>
			<div class="col">
				<p>Name: <%=p.getNm() %></p>
				<p>Price: <%=p.getPrice() %></p>
				<p>Quantity: <%=p.getQunt() %></p>
				<p>Totalcost: <%=(p.getQunt()*p.getPrice()) %></p>
				<% 
					cartcost += p.getQunt()*p.getPrice();
				%>
			</div>
		<%}%>
		<div class="d-flex justify-content-center">
			<form action="paymentservlet" method ="post">
			<p><b>Total Cart price:</b> <%=cartcost %></p>
			<input type="hidden" value=<%=cartcost %> name="ctp">
			<textarea rows="4" cols="40" name="uaddr" placeholder="Enter Address"></textarea><br>
			<input type="submit" value="Pay" style="width: 115px">
			</form>
			<form action="cart.jsp" style="margin-top: 147px;margin-left: -110px">
			<input type="submit" value="Cancel" style="width: 115px">
			</form>
		</div> 
		
		
		</div>
	</div>
</body>
</html>