<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    
    <jsp:declaration>
		    
 	String school="",degree="",year="",grade="",description="";
    </jsp:declaration>
    
    
    <jsp:scriptlet>
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
	String id=request.getParameter("id");
	
	
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","12345");
		PreparedStatement ps=con.prepareStatement("select * from education where id=?");
		ps.setString(1,id);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			id=rs.getString("id");
			school=rs.getString("school");
			degree=rs.getString("degree");
			year=rs.getString("year");
			grade=rs.getString("grade");
			description=rs.getString("description");
		}
	}
	catch(Exception e)
	{
		out.print(e);
		//e.printStackTrace();
	}
	</jsp:scriptlet>
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
    
    
    <script>
    
    		function submitfunction(val)
    		{
    			if(val=='update')
    			{
    				document.EditEduform.action="EditEducationDetails";
    				document.EditEduform.submit();
    			}
    			if(val=='delete')
    			{
    				document.EditEduform.action="DeleteEducationDetails";
    				document.EditEduform.submit();
    			}
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
					
					<form name="EditEduform" method="POST">
						<br>
						<!-- for carring value of id on servlet page creates hidden -->
						<input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1"/>
						
						<h2 style="color:red;">Edit Education Details</h2>
						<br> <b><jsp:expression>name</jsp:expression></b>(<jsp:expression>session.getAttribute("session_email")</jsp:expression>)<br><br>
						School/College : <br><input type="text" name="school1" placeholder="school Name" value="<jsp:expression>school</jsp:expression>"/><br><br>
						Degree : <br><input type="text"  name="degree1"  placeholder="Eg..10th or btech" value="<jsp:expression>degree</jsp:expression>"><br><br>
						Year : <br><input type="text"  name="year1"  placeholder="Eg..2003-2025" value="<jsp:expression>year</jsp:expression>"><br><br>
						Grade : <br><input type="text"  name="grade1" placeholder="Eg..90" value="<jsp:expression>grade</jsp:expression>">%<br><br>
						Descriptions : <br><textarea  name="description1" placeholder="activities and socities"  class="text_area_design" style="height:100px;width:300px;"><jsp:expression>description</jsp:expression></textarea><br><br>
						<input type="submit" value="UPDATE EDUCATION" class="btn-success" onclick="submitfunction('update')">
						<input type="submit" value="DELETE EDUCATION" class="btn-danger" onclick="submitfunction('delete')"><br><br>
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