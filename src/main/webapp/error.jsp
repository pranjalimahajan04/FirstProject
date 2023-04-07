<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<div class="d-flex justify-content-center" style="padding-top: 30px;">
		<h2><%=session.getAttribute("uname") %>... Your cart is empty</h2>
	</div>
	<div class="d-flex justify-content-center" style="padding-top: 30px;">
		<a class="btn btn-primary" href="Home.jsp">Home</a>
	</div>
		
	
</body>
</html>