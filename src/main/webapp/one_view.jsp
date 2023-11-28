<%@page import="com.DB.DbConnection"%>
<%@page import="com.entity.jobs"%>
<%@page import="com.dao.jobdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View</title>
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
				int id = Integer.parseInt(request.getParameter("id"));
				jobdao dao = new jobdao(DbConnection.getcon());
				jobs j = dao.getjobsbyID(id);
				%>
				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>




							<h6><%=j.getTitle()%></h6>
							<p><%=j.getDescription()%>.
							</p>
							<br>
							<div class="form-row"></div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-controL-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-controL-sm"
									value="Category:<%=j.getCategory()%>" readonly>
							</div>
							<div>
								<h6>
									Publish Date:
									<%=j.getPdate().toString()%></h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>