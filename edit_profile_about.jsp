
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%
	String name=(String)session.getAttribute("session_name");
	String gender=(String)session.getAttribute("session_gender");
	String city=(String)session.getAttribute("session_city");
	String field=(String)session.getAttribute("session_field");
	String title=(String)session.getAttribute("session_title");
	
	//if my title is null then I give message
	if(title==null || title.equals(""))
	{
		title="";
	}
	String skills=(String)session.getAttribute("session_skills");
	
	if(skills==null || skills.equals(""))
	{
		skills="";
	}
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
    
    
    <script>
    	
    	function changegender()
    	{
    		document.getElementById("changeG").value=document.getElementById("Cgender").value;
    	}
    
    	function citychange()
    	{
    		document.getElementById("chooseCity").value=document.getElementById("Citychoose" ).value;
    	}
    
    </script>
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
					<img src="IMAGES/logo_infosys.jpg" style="height:100px; margin-bottom:20px;"/>
				</div>
				<div class="col-md-8">
					<form action="EditProfileAbout" method="POST">
						<br>
						<h3 style="color:red;">Personal Details</h3>
						<br> <br>
						<b><jsp:expression>name</jsp:expression></b>(<jsp:expression>session.getAttribute("session_email")</jsp:expression>)<br><br>
						<!-- <input type="text" value="<jsp:expression>session.getAttribute("session_email")</jsp:expression>" disabled=""> -->
						<input type="text" value="<jsp:expression>name</jsp:expression>" name="name1" placeholder="Enter Name"><br><br>
						<input type="text"  id="changeG" value="<jsp:expression>gender</jsp:expression>" name="gender1" placeholder="select gender">
						<select id="Cgender" onchange="changegender()">
							<option disabled="">Select Gender</option>
							<option>Male</option>
							<option>Female</option>
						</select>
						<br><br>
						<input type="text" id="chooseCity" value="<jsp:expression>city</jsp:expression>" name="city1" placeholder="select city">
						<select id="Citychoose" onchange="citychange()">
							<option disabled="">Select City</option>
								<option value="ahmednagar">Ahmednagar</option>
								<option value="Sambhaji Nagar">Sambhaji Nagar</option>
								<option value="Pune">Pune</option>
								<option value="Thane">Thane</option>
						</select>
						
						<br><br>
						<input type="text" value="<jsp:expression>title</jsp:expression>" name="title1" placeholder="Enter Title"><br><br>
						<textarea placeholder="skills" name="skills1" class="text_area_design" style="height:100px;width:300px;"><jsp:expression>skills</jsp:expression></textarea><br><br>
						<input type="submit" value="update" class="btn-success"><br><br>
					</form>
					
					
				</div>
			</div>
				
			
			
		</div>
		<div class="col-md-2"></div>
	</div>
				
	
	<br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="footer_part.jsp"></jsp:include>
</body>
</html>