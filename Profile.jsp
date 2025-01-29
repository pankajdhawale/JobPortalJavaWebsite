<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.DriverManager" %>
    <%@page import="java.sql.PreparedStatement" %>
    <%@page import="java.io.IOException" %>
    <%@page import="java.io.PrintWriter"%>
    <%@page import="java.sql.*"%>
    
    <%@page import="jakarta.servlet.http.HttpSession"%>
    <%@page import="jakarta.servlet.http.HttpServletResponse"%>
    <%@page import="jakarta.servlet.http.HttpServletRequest"%>
    <%@page import="jakarta.servlet.http.HttpServlet"%>
    <%@page import="jakarta.servlet.ServletException"%>
    <%@page import="jakarta.servlet.RequestDispatcher"%>
    
    
    <%
	String name=(String)session.getAttribute("session_name");
	String gender=(String)session.getAttribute("session_gender");
	String city=(String)session.getAttribute("session_city");
	String field=(String)session.getAttribute("session_field");
	if(field==null || field.equals(""))
	{
		field="Not Available _ _ _";
	}
	String title=(String)session.getAttribute("session_title");
	String skills=(String)session.getAttribute("session_skills");
	%>
	<jsp:scriptlet>
	if(name==null || name.equals(""))
	{
		response.sendRedirect("login.jsp");
	}
	</jsp:scriptlet>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome : <jsp:expression>name</jsp:expression></title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
					<a href="edit_profile_pic.jsp" style="font-size:12px; float:right;  margin-right:70px;"><span class="glyphicon glyphicon-pencil"></span></a>
					<img src="IMAGES/profile-icon.png" style="height:100px; margin-bottom:20px; margin-left:30px; width:100px;" class="rounded-circle"/>
					
				</div>
				<div class="col-md-8">
					<br>
					<h3 style="color:blue;"><jsp:expression>name.toUpperCase()</jsp:expression><a href="edit_profile_about.jsp" style="font-size:12px; float:right;"><span class="glyphicon glyphicon-pencil"></span></a></h3>
					<span style="color:#acaaaa">title :  </span><jsp:expression>title</jsp:expression><br><br>
						<span style="color:#acaaaa">Skills :  </span><jsp:expression>skills</jsp:expression><br><br>
					
						<span style="color:#acaaaa">Gender :  </span><jsp:expression>gender</jsp:expression><br>
						<span style="color:#acaaaa">City :  </span><jsp:expression>city</jsp:expression><br>
						<span style="color:#acaaaa">field :  </span><jsp:expression>field</jsp:expression><br><br>
				
					
				
				</div>
				
			</div>
				<div class="row" style="border: 1px solid gray; box-shadow:1px 1px 1px gray; margin-top:10px;" >
					
					<div class="col-md-12">
					<br><br>
					<h5>Education details<a href="Add_Profile_education.jsp" style="font-size:12px; float:right;"><span class="glyphicon glyphicon-plus"></span></a></h5>
					
					<jsp:scriptlet>
					
						String school="",degree="",grade="",year="",id="";
						
						String email=(String)session.getAttribute("session_email");
						try{
							
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal ","root","12345");
							PreparedStatement ps=con.prepareStatement("select * from education where email=?");
							ps.setString(1,email);
							
							ResultSet rs=ps.executeQuery();
							
							while(rs.next())
							{
								id=rs.getString("id");
								school=rs.getString("school");
								degree=rs.getString("degree");
								grade=rs.getString("grade");
								year=rs.getString("year");
								</jsp:scriptlet>
							
							<div class="row" style="background-color:#eeecec">
								<div class="col-md-2"></div>
								<div class="col-md-10">
								<br>
								<a href="EditProfileEducation.jsp?id=<jsp:expression>id</jsp:expression>"><span class="glyphicon glyphicon-pencil" style="float:right"></a>
								<span class="glyphicon glyphicon-home" ></span>  <jsp:expression>school</jsp:expression><br><br>
								 <span class="glyphicon glyphicon-education"></span> <jsp:expression>degree</jsp:expression><br><br>
								<span class="glyphicon glyphicon-sort-by-alphabet"></span> <jsp:expression>grade</jsp:expression>%<br><br>
								<span class="glyphicon glyphicon-calendar"></span><jsp:expression>year</jsp:expression><br><br>
								</div>
							</div>
								<jsp:scriptlet>	
								
							}
						}
						catch(Exception e)
						{
							out.print(e);
						}
					</jsp:scriptlet>
					</div>
						
				</div>
			<br><br>
			
			<!-- experience Details -->
			
			<div class="row" style="border: 1px solid gray; box-shadow:1px 1px 1px gray; margin-top:10px;" >
					
					<div class="col-md-12">
					<br><br>
					<h5>Experience Details<a href="add_profile_experience.jsp" style="font-size:12px; float:right;"><span class="glyphicon glyphicon-plus"></span></a></h5>
					
					<jsp:scriptlet>
							String company1="",location1="",job_title1="",year1="",id1="";
						
						
						
						try{
							
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","12345");
							

							PreparedStatement ps1=con1.prepareStatement("select * from experience where email=?");
							  ps1.setString(1, email);
							
							ResultSet rs1=ps1.executeQuery();
							
							while(rs1.next())
							{
								id1=rs1.getString("id");
								company1=rs1.getString("company");
								location1=rs1.getString("location");
								job_title1=rs1.getString("job_title");
								year1=rs1.getString("year");
								
								</jsp:scriptlet>
							
							<div class="row" style="background-color:#eeecec">
								<div class="col-md-2"></div>
								<div class="col-md-10">
								<br>
								<a href="edit_profile_experience.jsp?id=<jsp:expression>id1</jsp:expression>"><span class="glyphicon glyphicon-pencil" style="float:right" ></span></a>
								
							
								
								<span class="glyphicon glyphicon-home" ></span>  <jsp:expression>company1</jsp:expression><br><br>
								 <span class="glyphicon glyphicon-education"></span> <jsp:expression>location1</jsp:expression><br><br>
								<span class="glyphicon glyphicon-sort-by-alphabet"></span> <jsp:expression>year1</jsp:expression><br><br>
								<span class="glyphicon glyphicon-calendar"></span><jsp:expression>job_title1</jsp:expression><br><br>
								</div>
							</div>
								<jsp:scriptlet>	
								
							}
						}
						catch(Exception e)
						{
							out.print(e);
						}
					</jsp:scriptlet>
					</div>
						
				</div>
			
			<div class="row" style="background-color:#ececec; margin-top:10px;">
					<div class="col-md-4">
					
					</div>
					<div class="col-md-8">
						<input type="submit" value="follow" />
					</div>
				
			</div>
				
			
			</div>
		
		<div class="col-md-2"></div>
	</div>
				
	
	<br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="footer_part.jsp"></jsp:include>
</body>
</html>