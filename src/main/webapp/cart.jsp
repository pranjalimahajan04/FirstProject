<%@page import="app.Products"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" isErrorPage="false" %>
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
	<div class="class=" container-lg" style="padding-top: 30px;">
		<div class="row">
		<%
			if (request.getAttribute("Messagec") != null) {
			%>
			<h5 style="text-align: center; background-color: rgba(255,0,0,0.3); padding: 5px;"><%=request.getAttribute("Messagec")%></h5>
			<%
			}
			%>
		<% ArrayList<Products> cart1 = (ArrayList<Products>)session.getAttribute("cartsession"); 
		if(cart1.isEmpty()){
			RequestDispatcher dispatchere = super.getServletContext().getRequestDispatcher("/error.jsp");
			dispatchere.forward(request, response);
		}
			float cartcost = 0;
			for(Products p:cart1)
			{	
		%>
			<div class="col">
				<p>Name: <%=p.getNm() %></p>
				<p>Price: <%=p.getPrice() %></p>
				<p>Quantity: <%=p.getQunt() %></p>
				<p>Totalcost: <%=(p.getQunt()*p.getPrice()) %></p>
				<form action="removeservlet2" method="post">
					<input type="hidden" value=<%=p.getId()%> name="idc" readonly="readonly">
					<input type="submit"  value="Remove" />
				</form>
				
				<% 
					cartcost += p.getQunt()*p.getPrice();
				%>
			</div>
		<%}%>
		<div class="d-flex justify-content-center">
			<form action="buyservlet" method ="post">
			<input type="hidden" value=<%=cartcost %> name="ctp">
			<p><b>Total Cart price:</b> <%=cartcost %></p>
			<input type="submit" value="Buy">
		</form>
		</div> 
		
		
		</div>
	</div>
</body>
</html>