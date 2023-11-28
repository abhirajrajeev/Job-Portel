<%@page import="com.DB.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vela Illa Patathari</title>
<style type="text/css">
.back-img {
	background: url("content/home.jpg");
	width: 100%;
	height: 100vh;
	background-repeat: no-repeat;
	background-size: cover;
}

.title {
	margin-right: 900px;
}

h1 {
	font-size: 72px;
	background: -webkit-linear-gradient(#eee, #333);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}
.bottom
{
 position: relative;
 bottom: 110px;
 
}

</style>
<%@include file="all_component/all_css.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<div class="container-fluid back-img">
		<div class="text-center title">
			<h1 class="text-white p-4 title1">
				<i class="fa-solid fa-book"></i><a>.</a> VIP
			</h1>
		</div>
	</div>
	<div class="bottom"><%@include
			file="footer.jsp"%></div>
</body>
</html>