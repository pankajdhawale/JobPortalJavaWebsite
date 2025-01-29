<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    
    <jsp:declaration>
		    
 	String company="",location="",year="",job_title="",description="";
    </jsp:declaration>
    
    
    <jsp:scriptlet>
	String name=(String)session.getAttribute("session_name");
	
	
	
	String id=request.getParameter("id");
	
	
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","12345");
		PreparedStatement ps=con.prepareStatement("select * from experience where id=?");
		ps.setString(1,id);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			id=rs.getString("id");
			company=rs.getString("company");
			location=rs.getString("location");
			year=rs.getString("year");
			job_title=rs.getString("job_title");
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
    
    	function submitfunction(val)
    	{
    		if(val=='update')
    		{
    			document.EditExpform.action="EditExperienceDetails";
    			document.EditExpform.submit();
    		}
    		if(val=='delete')
    		{
    			document.EditExpform.action="DeleteExperienceDetails";
    			document.EditExpform.submit();
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
					
					<form name="EditExpform" method="POST">
						<br>
						<!-- for carring value of id on servlet page creates hidden -->
						<input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1"/>
						
						<h2 style="color:red;">edit profile experience Details</h2>
						<br> <b><jsp:expression>name</jsp:expression></b>(<jsp:expression>session.getAttribute("session_email")</jsp:expression>)<br><br>
						Company : <br><input type="text" name="company1" placeholder="Company Name" value="<jsp:expression>company</jsp:expression>"/><br><br>
						Location : <br><input type="text"  name="location1"  placeholder="Eg..Delhi" value="<jsp:expression>location</jsp:expression>"><br><br>
						Year : <br><input type="text"  name="year1"  placeholder="Eg..2003-2025" value="<jsp:expression>year</jsp:expression>"><br><br>
						job_title : <br><input type="text"  name="job_title1" placeholder="Eg..Jr Java developer" value="<jsp:expression>job_title</jsp:expression>"><br><br>
						Descriptions : <br><textarea  name="description1" placeholder="activities and socities" class="text_area_design" style="height:100px;width:300px;"><jsp:expression>description</jsp:expression></textarea><br><br>
						<input type="submit" value="UPDATE EXPERIRNCE" class="btn-success" onclick="submitfunction('update')">
						<input type="submit" value="DELETE EXPERIRNCE" class="btn-danger" onclick="submitfunction('delete')"><br><br>
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