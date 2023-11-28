<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
<%@include file="all_component/all_css.jsp"%>

<link rel="stylesheet" href="all_component/signup_style.css" />
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="continer-fluid">
		<div class="login-box">
			<h2>Registration</h2>
			<c:if test="${not empty succMsg }">
				<h4 class="text-centre text-success">${succMsg}</h4>
				<c:remove var="succMsg" />
			</c:if>
			<form action="add_user" method="post">
				<div class="user-box">
					<input type="text" name="name" required=""> <label>Full
						Name</label>
				</div>
				<div class="user-box">
					<input type="text" name="qual" required=""> <label>Enter
						Qualification</label>
				</div>
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
</body>
</html>