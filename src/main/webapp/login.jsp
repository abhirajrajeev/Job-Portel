<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="all_component/all_css.jsp"%>
<link rel="stylesheet" href="all_component/login-style.css">

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="continer-fluid">
		<div class="login-box">
			<h2>Login</h2>
			<c:if test="${not empty succMsg }">
			  <h4 text-centre text-danger>${succMsg}</h4>
			  <c:remove var="succMsg"/>
			</c:if>
			<form action="login" method="post">
				<div class="user-box">
					<input type="text" name="email" required=""> <label>Email</label>
				</div>
				<div class="user-box">
					<input type="password" name="pwd" required=""> <label>Password</label>
				</div>
				<button type="submit"
					style="background: transparent; border: none !important; color: white">
					<a> <span></span> <span></span> <span></span> <span></span>
						Submit
					</a>
				</button>
			</form>
		</div>
	</div>
</body>
</html>