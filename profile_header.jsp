<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
	String name=(String)session.getAttribute("session_name");
	String gender=(String)session.getAttribute("session_gender");
	String city=(String)session.getAttribute("session_city");
	String field=(String)session.getAttribute("session_field");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>Welcome : 	<%= name %>
			your gender is : <%= gender %>
			you are belongs to: <%= city %>
			you have selected field are: <%= field %>
		</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
    	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>
    	<link rel="stylesheet " type="text/css" href="CSS/style.css">
</head>
<body>
		<div class="row blue">
			<div class="col-md-8">
				<a href="indexAll.jsp">
				
				<img src="IMAGES/logo_infosys.jpg"  class="imagesize rounded-circle" alt="image not loads" style="margin-top:5px; margin-bottom:5px;  margin-left:10px;"/>
				<span  style="text-decoration:none; color:white; font-size:18px;">Job Portal</span>
				</a>
				
			</div>
			<div class="col-md-4 text_design">
				<ul>
					<li>
							<a href="Profile.jsp" style="text-decoration:none; color:white; font-size:18px;"><img src="IMAGES/profile-icon.png" class="rounded-circle" height="40" width="40"/><%= name %></a>	
							<%-- your gender is : <%= gender %>
							you are belongs to: <%= city %>
							you have selected field are: <%= field %> --%>
							<span style="color: white;">/</span>
						<a href="Logout" style="color:white">
							Logout
						</a>
					</li>
				</ul>
			</div>
		</div>
</body>
</html>