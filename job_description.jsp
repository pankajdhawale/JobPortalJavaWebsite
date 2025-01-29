<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="java.sql.*"%>
<!DOCTYPE html>

<jsp:declaration>
	String jobid;
</jsp:declaration>
<jsp:scriptlet>

String email=(String)session.getAttribute("session_email");

 jobid=request.getParameter("jid");
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
						<li><a href="indexAll.jsp">HOME</a></li>
						<li><a href=" ">ABOUT US</a></li>
						<li><a href=" ">CONTACT US</a></li>
						<li><a href=" ">EXAMPLES</a></li>
					</ul>
				</div>
				<div class="col-md-5 link_deco">
					<ul>
						<li><a href=" ">SEARCH JOBS</a></li>
						<li><a href=" ">COMPANY</a></li>
						<li><a href=" ">INFO</a></li>
						
					</ul>
				</div>
			</div>
		<!--	<div class="row">
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
			
			</div>  -->
		
			<!--<center><h2>Find A Job at India's No.1 Job Site</h2> </center>-->

					<!--create text and search<!--
				
				<div class="row text_head">
					<div class="col-md-12" style="font-weight:bold;font-size:xx-large;">
						India's No 1 Job site
					</div>
						
				</div>	
			<div class="row">
								
								<div class="col-md-12 text_demo">
									
									Select:	<input type="text" placeholder="Technology"/>
											<input type="text" placeholder="Location"/>
											<input type="submit" value="search" class="btn btn-primary"/>
								</div>
								
			</div>		
					
			
			<br><br>
			<!-- details of websites-->
			
			<div class="row" style="margin-top: 20px;">
			
			
			<div class="col-md-3">
					<ul style="list-style:none;">
						<li><a href=" ">INFOSYS</a></li>
						<li><a href=" ">IBM</a></li>
						<li><a href=" ">TCS</a></li>
					</ul>
				</div>
				
				
				<jsp:scriptlet>
				String job_profile="",company="",experience="",description="",date1="",time1="",id="",salary="", no_of_openings=""
				,job_location="",time_venue="",c_email="",c_person_name="",c_person_profile="",c_phone_no=""; 
				try
				{
					Class.forName("com.mysql.cj.jdbc.Driver");	
					Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","12345");
					PreparedStatement ps2=con2.prepareStatement("select * from jobs where id=?");
					ps2.setString(1,jobid);
					ResultSet rs2=ps2.executeQuery();
					
					while(rs2.next())
					{
						id=rs2.getString("id");
						job_profile=rs2.getString("job_profile");
						company=rs2.getString("company");
						experience=rs2.getString("experience");
						description=rs2.getString("description");
						
						
						salary=rs2.getString("salary");
						no_of_openings=rs2.getString("no_of_openings");
						job_location=rs2.getString("job_location");
						time_venue=rs2.getString("time_venue");
						c_email=rs2.getString("c_email");
						c_person_name=rs2.getString("c_person_name");
						c_person_profile=rs2.getString("c_person_profile");
						
						c_phone_no=rs2.getString("c_phone_no");
		
						date1=rs2.getString("date1");
						time1=rs2.getString("time1");
					
						
						</jsp:scriptlet>
						
						
						<div class="col-md-6" style="background-color: lightgray;">
					
						<table class="table">
							<tr>
								<td><span><b><jsp:expression>job_profile</jsp:expression></b></span></td>
								
								<td><span style="float:right; color: #9f9d9d;">(<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-home"></span></td>
								<td>&nbsp <span style="color: #9f9d9d;">Company : </span></td>
								<td><span><jsp:expression>company</jsp:expression></span></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-briefcase"></span></td>
								<td>&nbsp <span style="color: #9f9d9d;">Experience : </span><span></td>
								<td><jsp:expression>experience</jsp:expression></span></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-list-alt"></span></td>
								<td>&nbsp <span style="color: #9f9d9d;">Description : </span></td>
								<td><span><jsp:expression>description</jsp:expression></span></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-usd"></span></td>
								<td>&nbsp <span style="color: #9f9d9d;">salary : </span></td>
								<td><span><jsp:expression>salary</jsp:expression></span></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-th"></span></td>
								<td>&nbsp <span style="color: #9f9d9d;">no_of_openings : </span></td>
								<td><span><jsp:expression>no_of_openings</jsp:expression></span></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-map-marker"></span></td>
								<td>&nbsp <span style="color: #9f9d9d;">job_location : </span></td>
								<td><span><jsp:expression>job_location</jsp:expression></span></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-send"></span></td>
								<td>&nbsp <span style="color: #9f9d9d;">time_venue : </span></td>
								<td><span><jsp:expression>time_venue</jsp:expression></span></td>
							</tr>
							<tr>
								<td><span><b>Company Details</b></span></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-file"></span></td>
								<td>&nbsp <span style="color: #9f9d9d;">c_email : </span></td>
								<td><span><jsp:expression>c_email</jsp:expression></span></td>
							</tr><tr>
								<td><span class="glyphicon glyphicon-user"></span></td>
								<td>&nbsp <span style="color: #9f9d9d;">c_person_name : </span></td>
								<td><span><jsp:expression>c_person_name</jsp:expression></span></td>
							</tr><tr>
								<td><span class="glyphicon glyphicon-user"></span></td>
								<td>&nbsp <span style="color: #9f9d9d;">c_person_profile : </span></td>
								<td><span><jsp:expression>c_person_profile</jsp:expression></span></td>
							</tr><tr>
								<td><span class="glyphicon glyphicon-phone-alt"></span></td>
								<td>&nbsp <span style="color: #9f9d9d;">c_phone_no : </span></td>
								<td><span><jsp:expression>c_phone_no</jsp:expression></span></td>
							</tr>
								
								<jsp:scriptlet>
			if(email ==null ? email ==null : email.trim().equals("null"))
			{
		</jsp:scriptlet>
							
							<tr>
							
								<td></td> 
								<td><a href="login.jsp" class="btn btn-primary">Login To Apply</a></td>
								<td></td>
							</tr>
					
		<jsp:scriptlet>
			}
			else{
						try
						{
							Class.forName("com.mysql.cj.jdbc.Driver");	
							Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","12345");
							PreparedStatement ps1=con1.prepareStatement("select * from  applied_jobs where email=? and jobid=?");
							ps1.setString(1,email);
							ps1.setString(2,jobid);
							ResultSet rs1=ps1.executeQuery();
							
							if(rs1.next())
							{
							</jsp:scriptlet>	
								
								<tr>
								<td></td>
								<td></td>
								<td>
								
							<a href="indexAll.jsp"><input type="submit" value="You Already Applied to this job"  class="btn btn-primary"/></a>	
							
							<form action="DeleteMyJob" method="post">
							<br>
							<input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid" />
							<input type="submit" value="Delete This Application"  class="btn btn-danger"/>
							
							</form>
							
							
								</td>
							</tr>
								<jsp:scriptlet>
							}
							else
							{
								
							</jsp:scriptlet>	
						
								<tr>
								<td></td>
								<td>
								<form action="ApplyForJob" method="post">
								<input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid" />
									<br><input type="submit" value="Apply"  class="btn btn-primary"/>
								</form>
								</td>
								<td></td>
							</tr>
							<jsp:scriptlet>
							}
						}
						catch(Exception e)
						{
							
							e.printStackTrace();
						}
		</jsp:scriptlet>
		
					
					
							
					
		<jsp:scriptlet>		
			}
		</jsp:scriptlet>
							
							
								
						</table>
					
						</div>
						<jsp:scriptlet>
					}	
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				</jsp:scriptlet>
				
			
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