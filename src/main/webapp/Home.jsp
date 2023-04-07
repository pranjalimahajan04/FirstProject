<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	input:not(.cbtn) {
	color: black;
	width: 30%;
	
}
	.col-sm-4{
		padding-left: 50px;
		margin-bottom: 50px;
	}
	
	</style>
</head>
<body>
	<header>
		<%@ include file="menu.jsp"%>

		<div class="p-5 text-center bg-image"
			style="background-image: url('bg.jpeg'); background-size: cover; height: 400px; width: 100%;">
			<div class="mask"
				style="background-color: rgba(0, 0, 0, 0.6); margin-top: 100px;">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-white">
						<h1 class="mb-3">
							Welcome
							<%=session.getAttribute("uname")%></h1>
					</div>
				</div>
			</div>
		</div>
	</header>
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

		<div class="row">
			<%
			if (request.getAttribute("Message") != null) {
			%>
			<h5 style="text-align: center; background-color: rgba(102,245,66,0.3); padding: 5px;"><%=request.getAttribute("Message")%></h5>
			<%
			}
			%>
			<h2 class="mb-3" style="text-align: center;">Electronics</h2>
			<%
			Connection con = getCon();
			Statement st = con.createStatement();
			String sql = "select * from products where category='Electronics'";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String desc = rs.getString("description");
				String cat = rs.getString("category");
				Float cost = rs.getFloat("price");
			%>
			<div class="col-sm-4">
				<p> Name: <%=name%></p>
				<p> Category: <%=cat%></p>
				<p>Description: <%=desc%></p>
				<p>Price: <%=cost%></p>
				<form action="cartservlet" method="post">
					<input type="hidden" value=<%=id%> name="id" readonly="readonly">
					<input type="number" name="qnt"  min="1" value="1">
					<input type="submit" class="cbtn" value="Add to cart">
				</form>
			</div>
			<%
			}
			%>
			<hr>
			<h2 class="mb-3" style="text-align: center;">Clothing</h2>
			<%
			String sql1 = "select * from products where category='Clothing'";
			ResultSet rs1 = st.executeQuery(sql1);
			while (rs1.next()) {
				int id1 = rs1.getInt("id");
				String name1 = rs1.getString("name");
				String desc1 = rs1.getString("description");
				String cat1 = rs1.getString("category");
				Float cost1 = rs1.getFloat("price");
			%>
			<div class="col-sm-4">
				<p> Name: <%=name1%></p>
				<p> Category: <%=cat1%></p>
				<p>Description: <%=desc1%></p>
				<p>Price: <%=cost1%></p>
				<form action="cartservlet" method="post">
					<input type="hidden" value=<%=id1%> name="id" readonly="readonly">
					<input type="number" name="qnt" min="1" value="1">
					<input type="submit" class="cbtn" value="Add to cart">
				</form>
			</div>
			<%
			}
			%>
			<hr>
			<h2 class="mb-3" style="text-align: center;">Stationary</h2>
			<%
			String sql2 = "select * from products where category='Stationary'";
			ResultSet rs2 = st.executeQuery(sql2);
			while (rs2.next()) {
				int id2 = rs2.getInt("id");
				String name2 = rs2.getString("name");
				String desc2 = rs2.getString("description");
				String cat2 = rs2.getString("category");
				Float cost2 = rs2.getFloat("price");
			%>
			<div class="col-sm-4">
				<p> Name: <%=name2%></p>
				<p> Category: <%=cat2%></p>
				<p>Description: <%=desc2%></p>
				<p>Price: <%=cost2%></p>
				<form action="cartservlet" method="post">
					<input type="hidden" value=<%=id2%> name="id" readonly="readonly">
					<input type="number" name="qnt" min="1" value="1">
					<input type="submit" class="cbtn" value="Add to cart">
				</form>
			</div>
			<%
			}
			%>
			<hr>
			<h2 class="mb-3" style="text-align: center;">Food</h2>
			<%
			String sql3 = "select * from products where category='Food'";
			ResultSet rs3 = st.executeQuery(sql3);
			while (rs3.next()) {
				int id3 = rs3.getInt("id");
				String name3 = rs3.getString("name");
				String desc3 = rs3.getString("description");
				String cat3 = rs3.getString("category");
				Float cost3 = rs3.getFloat("price");
			%>
			<div class="col-sm-4">
				<p> Name: <%=name3%></p>
				<p> Category: <%=cat3%></p>
				<p>Description: <%=desc3%></p>
				<p>Price: <%=cost3%></p>
				<form action="cartservlet" method="post">
					<input type="hidden" value=<%=id3%> name="id" readonly="readonly">
					<input type="number" name="qnt" min="1" value="1">
					<input type="submit" class="cbtn" value="Add to cart">
				</form>
			</div>
			<%
			}
			%>
			
			
			
		</div>
	</div>
</body>
</html>