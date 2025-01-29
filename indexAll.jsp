<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="java.sql.*"%>
<!DOCTYPE html>

<jsp:scriptlet>

String email=(String)session.getAttribute("session_email");

</jsp:scriptlet>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css">
     <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet " type="text/css" href="CSS/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container-fluid" style="background-color:lightyellow">
	
		<jsp:scriptlet>
			if(email ==null ? email ==null : email.trim().equals("null"))
			{
		</jsp:scriptlet>
				
					<jsp:include page="header_part.jsp"></jsp:include>
		<jsp:scriptlet>
			}
			else{
		</jsp:scriptlet>
					<jsp:include page="profile_header.jsp"></jsp:include>
		<jsp:scriptlet>		
			}
		</jsp:scriptlet>
		
			<div class="row blue">
			<!-- <div class="col-md-8">
				<a href="indexAll.jsp">
				<img src="IMAGES/logo_infosys.jpg" class="imagesize rounded-circle" alt="image not loads"/>
				<span style="color:white">JOB PORTAL</span>
				</a>
			</div>	-->
			<!--<div class="col-md-4 text_design">
				<ul>
					<li>
						<a href="login.jsp" style="color:white">
							Login	
						</a>
							<span style="color: white;">/</span>
						<a href="register.jsp" style="color:white">
							Register
						</a>
					</li>
				</ul>
			</div>	-->
		</div>
			<div class="row" id="menubar_color">
				<div class="col-md-7 link_deco">
					<ul>
						<li><a href=" ">HOME</a></li>
						<li><a href="about_us.jsp">ABOUT US</a></li>
						<li><a href="contact_us.jsp">CONTACT US</a></li>
						<li><a href=" ">EXAMPLES</a></li>
					</ul>
				</div>
				<div class="col-md-5 link_deco">
					<ul>
						<li><a href="simple_job_search.jsp">SEARCH JOBS</a></li>
						<li><a href="companies.jsp">COMPANY</a></li>
						<li><a href=" ">INFO</a></li>
						
					</ul>
				</div>
			</div>
			<div class="row">
					<div class="col-md-12">
					
						<div>
							<img src="IMAGES/search_job.jpg" alt="image not loads" class="image_midle"/>
						</div>
						<div>
							<img src="IMAGES/search_job.jpg" alt="image not loads" class="image_midle"/>
						</div>
						<div>
							<img src="IMAGES/search_job.jpg" alt="image not loads" class="image_midle"/>
						</div>
						<div>
							<img src="IMAGES/search_job.jpg" alt="image not loads" class="image_midle"/>
						</div>
						
					
					
					</div>
			
			</div>
		
			<!--<center><h2>Find A Job at India's No.1 Job Site</h2> </center>-->

					<!--create text and search-->
				
				<div class="row text_head">
					<div class="col-md-12" style="font-weight:bold;font-size:xx-large;">
						India's No 1 Job site
					</div>
						
				</div>	
			<div class="row">
								
								<div class="col-md-12 text_demo">
									<form action="search_jobs_results.jsp" method="POST">
											<input type="text" name="technology1" placeholder="Technology"/>
											<input type="text" name="location1" placeholder="Location"/>
											<input type="submit" value="search" class="btn btn-primary"/>
									</form>
									
								</div>
								
			</div>		
					
			
			<br><br>
			<!-- details of websites-->
			
			<div class="row">
			
			
			<div class="col-md-3">
					<ul style="list-style:none;">
						<li><a href=" ">INFOSYS</a></li>
						<li><a href=" ">IBM</a></li>
						<li><a href=" ">TCS</a></li>
					</ul>
			</div>
				
				<div class="col-md-6" style="background-color: lightgray;margin-top: 10px;">
				
				<div class="row">
				<jsp:scriptlet>
				String job_profile="",company="",experience="",description="",date1="",time1="",id="";
				try
				{
					Class.forName("com.mysql.cj.jdbc.Driver");	
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","12345");
					PreparedStatement ps=con.prepareStatement("select * from jobs");
					ResultSet rs=ps.executeQuery();
					
					
					while(rs.next())
					{
						id=rs.getString("id");
						job_profile=rs.getString("job_profile");
						company=rs.getString("company");
						experience=rs.getString("experience");
						description=rs.getString("description");
						date1=rs.getString("date1");
						time1=rs.getString("time1");
						</jsp:scriptlet>
						
						
						
							<div class="col-md-12" style="background-color: lightgray;margin-top: 10px;">
									
								<span><b><jsp:expression>job_profile</jsp:expression></b></span> <span style="float:right; color: #9f9d9d;">(<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span>
							<br><br>
							<span class="glyphicon glyphicon-home"></span>&nbsp <span style="color: #9f9d9d;">Company : </span><span><jsp:expression>company</jsp:expression></span> <br><br>
							<span class="glyphicon glyphicon-book"></span>&nbsp <span style="color: #9f9d9d;">Experience : </span><span><jsp:expression>experience</jsp:expression></span><br><br>
					
							<span class="glyphicon glyphicon-file"></span>&nbsp <span style="color: #9f9d9d;">Description : </span><span><jsp:expression>description</jsp:expression></span><br>
                        		
                    	
                   			<a href="job_description.jsp?jid=<jsp:expression>id</jsp:expression>">See full details</a>
								
							<hr>
							</div>
							
						
						<jsp:scriptlet>
					}
					
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				</jsp:scriptlet>
				</div>
				</div>
			
				<div class="col-md-3">
					<ul style="list-style:none;">
						<li><a href=" ">MARUTI</a></li>
						<li><a href=" ">GOLD LUCK</a></li>
						<li><a href=" ">WHIRPOOL</a></li>
					</ul>
				</div>
		</div>
			<br><br>
			
			 <!-- <br>	<br>	<br>	<br>	<br>	<br>	<br>	<br>	<br>	<br>
				<br>	<br>	<br> 	<br>	<br>	<br> 	<br> -->
				<!--footer part menu bar-->
			<div class="row" id="footer_menubar" style="background-color:lightgrey;">
				<div class="col-md-8">
					<ul style="list-style:none;">
						<li><a href=" ">JOIN US</a></li>
						<li><a href=" ">RESOURCES</a></li>
						<li><a href=" ">MORE LEARN</a></li>
					</ul>
				</div>
				<div class="col-md-2">
					
				</div>
				<div class="col-md-2">
					<ul style="list-style:none;">
						<li><a href=" ">HELP</a></li>
						<li><a href=" ">OPPORTUNITIES</a></li>
						<li><a href=" ">SHEDULE</a></li>
					</ul>
				</div>
			</div>
				
				
				
				
			<div class="row" style="background-color: black;">
				<div class="col-md-2">
					
				</div>
				<div class="col-md-8">
					<span style="color:white; font-size:20px ;">
						Copywrite@smart website
					</span>
				</div>
				<div class="col-md-2">
					
				</div>
				
			</div>
			
 	</div> 
</body>
</html>