<%@page import="com.entity.jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DbConnection"%>
<%@page import="com.dao.jobdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
       <c:redirect url="login.jsp"/>
	</c:if>
	


	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>

				<c:if test="${not empty succMsg}">
					<h4 class="text-center text-danger">${succMsg }</h4>
					<c:remove var="succMsg" />
				</c:if> 

				<div class="card">
					<div class="card-body">
						<form class="form-inline" action="more-view.jsp" method="get">
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>
							<div class="form-group col-md-5 mt-1">
								<h5>Category</h5>
							</div>
							<div class="form-group col-md-5 mt-1">
								<select name="loc" class="custom-select">
									<option selected value="lo">Choose</option>
									<option value="Odisha">Odisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Bhuveneswar">Bhuveneswar</option>
									<option value="Delhi">Delhi</option>
									<option value="Banglore">Banglore</option>
									<option value="Chennai">Chennai</option>
									<option value="Hyderabad">Hyderabad</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Category</label> <select class="custom-select"
									id="inLineFormCustomSelectPref" name="cat"
									style="background-color: gray; border-color: black">
									<option value="ca" selected>Choose...</option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Teacher">Teacher</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
								</select>
							</div>
							<button class="btn btn-success">Submit</button>
						</form>
					</div>
				</div>
				<%
				jobdao dao = new jobdao(DbConnection.getcon());
				List<jobs> list = dao.getAlljobsForUser();
				
				
				for (jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>


						<h6><%=j.getTitle()%></h6>
						<%if(j.getDescription().length()>0 && j.getDescription().length()<120) {%>
						<p><%=j.getDescription() %></p>
						<%}
						else{
						%>
						<p><%=j.getDescription().substring(0,120) %>....</p>
						<%} %>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location:<%=j.getLocation() %>" readonly>


							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-controL-sm"
									value="Category:<%=j.getCategory() %>" readonly>
							</div>

							
						</div>
						<h6>Publish Date: <%=j.getPdate() %></h6>
						<div class=" text-center ">
							<a href="one_view.jsp?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">View more</a> 

						</div>
					</div>
				</div>
				<%
				}
				%>
					</div>
				</div>
			</div>
</body>
</html>