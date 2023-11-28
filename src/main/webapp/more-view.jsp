<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DbConnection"%>
<%@page import="com.entity.jobs"%>
<%@page import="com.dao.jobdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>More View</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<%
				String loc = request.getParameter("loc");
				String cat = request.getParameter("cat");
				String msg = "";

				jobdao dao = new jobdao(DbConnection.getcon());
				List<jobs> list = null;
				if ("lo".equals(loc) && "ca".equals(cat)) {
					list = new ArrayList<jobs>();
					msg = "Job Not Available";
				} else if ("lo".equals(loc) || "ca".equals(cat)) {

					list = dao.getJobsORLocationAndCate(cat, loc);
				} else {

					list = dao.getJobsAndLocationAndCate(cat, loc);
				}
				if (list.isEmpty()) {
				%>
				<h4 class="text-center text-danger">Job Not Available</h4>
				<%
				}
				if (list != null) {
				for (jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h6><%=j.getTitle() %></h6>
						<p><%=j.getDescription() %></p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>

							</div>
						</div>
						<h6>
							Publish Date:
							<%=j.getPdate().toString()%></h6>
						<div class=" text-center ">
							<a href="one_view. jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">OneView</a>
						</div>
					</div>
				</div>
				<%
				}
				}else{
				%>
				<h4 class="text-centre text-danger"><%=msg %></h4>
				<%} %>
			</div>


		</div>
	</div>
	</body>
</html>