<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img
{
background: url("content/home.jpg");
height: 95vh;
width: 100%
}
.wlcm
{
margin-right: 500px;
}
h1
{
font-size: 32px;
  text-shadow: -1px -1px #0c0, 1px 1px #060, -3px 0 4px #000;
  font-family:Arial, Helvetica, sans-serif;
  }
</style>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<div class="text-center wlcm">
			<h1 class="text-white p-4">Welcome Admin</h1>
		</div>

	</div>|
</body>
</html>