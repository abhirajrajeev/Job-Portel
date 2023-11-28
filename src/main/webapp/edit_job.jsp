<%@page import="com.entity.jobs"%>
<%@page import="com.DB.DbConnection"%>
<%@page import="com.dao.jobdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card cd">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
						
<%
int id=Integer.parseInt(request.getParameter("id"));
jobdao dao=new jobdao(DbConnection.getcon());
jobs j=dao.getjobsbyID(id);
%>
						<h5>Edit Jobs</h5>
					</div>
					<form action="update" method="post">
					<input type="hidden" value="<%=j.getId()%>" name="id">
						<div class="form-group">
							<label>Enter Title</label> <input type="text" name="title"
								required class="form-control"
								style="background-color: gray; border-color: black" value="<%=j.getTitle()%>">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select " id="inlineFormCustomSeLectPref"
									style="background-color: gray; border-color: black">
									<option value="<%=j.getLocation() %>"><%=j.getLocation() %></option>
									<option value="Odisha">Odisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujurat">Gujurat</option>
									<option value="Bhubaneswar">Bhubaneswar</option>
									<option value="Delhi">Delhi</option>
									<option value="Banglore">Banglore</option>
									<option value="Chennai">Chennai</option>
									<option value="Hydrabad">Hydrabad</option>

								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Category</label> <select class="custom-select"
									id="inLineFormCustomSelectPref" name="category"
									style="background-color: gray; border-color: black">
									<option <%=j.getCategory() %>><%=j.getCategory() %></option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Teacher">Teacher</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-controL" name="status"
									style="background-color: gray; border-color: black" >
									<option class="Active" value="Active"><%=j.getStatus() %></option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive” value="Inactive">Inactive</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>tnter Description</label>
							<textarea required rows="10" cols="60" name="desc"
								class="
								form-control"
								style="background-color: gray; border-color: black"><%=j.getDescription() %></textarea>

						</div>
						<button class="btn btn-success">Update Job</button>
					</form>
</body>
</html>