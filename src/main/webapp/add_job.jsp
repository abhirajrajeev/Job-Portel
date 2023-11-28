<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Job</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.cd {
	background: gray;
}
</style>
</head>
<body style="background-image: url('content/addjob.jpg');">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card cd">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
						<c:if test="${not empty succMsg }">
							<div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" />
						</c:if>
						<h5>Add Jobs</h5>
					</div>
					<form action="add_job" method="post">
						<div class="form-group">
							<label>Enter Title</label> <input type="text"
								name="title" required class="form-control" style="background-color: gray; border-color: black">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select " id="inlineFormCustomSeLectPref"
									style="background-color: gray; border-color: black">
									<option selected>Choose...</option>
									<option value="Odisha">Odisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujurat">Gujurat</option>
									<option value="Bhubaneswar">Bhubaneswar</option>
									<option value="Delhi">Delhi</option>
									<option value="Delhi">Banglore</option>
									<option value="Delhi">Chennai</option>
									<option value="Delhi">Hydrabad</option>

								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Category</label> <select class="custom-select"
									id="inLineFormCustomSelectPref" name="category"
									style="background-color: gray; border-color: black">
									<option selected>Choose...</option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Developer">Teacher</option>
									<option value="Developer">Developer</option>
									<option value="Developer">Banking</option>
									<option value="Developer">Engineer</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-controL"
									name="status" style="background-color:gray; border-color:black">
									<option class="Active" value="Active">Active</option>
									<option class="Inactive” value="Inactive">Inactive</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>tnter Description</label>
							<textarea required rows="10" cols="60" name="desc" class="
								form-control" style="background-color: gray; border-color: black">></textarea>

						</div>
						<button class="btn btn-success">Publish Job</button>
					</form>
</body>
</html>