
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%
	String name=(String)session.getAttribute("session_name");
	
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile smart Website</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css">
     <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet " type="text/css" href="CSS/style.css">
</head>
<body>
	<jsp:include page="profile_header.jsp"></jsp:include>
	<jsp:include page="menubar_part.jsp"></jsp:include>
	<!-- <h1>Welcome:user</h1> -->
	<!-- provide java code in scriptlet tag .type cast value in string form -->
	
		
	
	<!-- use expression tag to printing hte object -->
		
		<%-- Welcome : 	<%= name %><br>
		your gender is : <%= gender %><br>
		you are belongs to: <%= city %><br>
		you have selected field are: <%= field %> --%>
		
		
		
	<div class="row">
	
		<div class="col-md-2"></div>
		<div class="col-md-8" style="margin-top:20px">
			<div class="row" style="border: 1px solid gray; box-shadow:1px 1px 1px gray">
				<div class="col-md-4">
				<br><br>
					<img src="IMAGES/logo_infosys.jpg" style="height:100px; width:100px; margin-left:50px;" class="rounded-circle"/>
				</div>
				<div class="col-md-8">
					<form action="AddEducationDetails" method="POST">
						<br>
						<h2 style="color:red;">Add Education Details</h2>
						<br> <b><jsp:expression>name</jsp:expression></b>(<jsp:expression>session.getAttribute("session_email")</jsp:expression>)<br><br>
						
						School : <br><input type="text" name="school1" placeholder="school Name"><br><br>
						Degree : <br><input type="text"  name="degree1"  placeholder="Eg..10th or btech"><br><br>
						Year : <br><input type="text"  name="year1"  placeholder="Eg..2003-2025"><br><br>
						Grade : <br><input type="text"  name="grade1" placeholder="Eg..90">%<br><br>
						Descriptions : <br><textarea  name="description1" placeholder="activities and socities" class="text_area_design" style="height:100px;width:300px;"></textarea><br><br>
						<input type="submit" value="ADD EDUCATION" class="btn-success"><br><br>
					</form>
					
					
				</div>
				
			</div>
				
			
			
		</div>
		<div class="col-md-2">
		
		</div>
	</div>
				
	
	<br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="footer_part.jsp"></jsp:include>
</body>
</html>