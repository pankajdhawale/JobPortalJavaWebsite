<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="java.sql.*"%>
<!DOCTYPE html>

<jsp:scriptlet>

String email=(String)session.getAttribute("session_email");
String name=(String)session.getAttribute("session_name");

</jsp:scriptlet>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us here</title>
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
						<li><a href=" ">CONTACT US</a></li>
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
			
		
			<!--<center><h2>Find A Job at India's No.1 Job Site</h2> </center>-->

					<!--create text and search-->
				
				<div class="row text_head">
					<div class="col-md-12" style="font-weight:bold;font-size:xx-large;">
						Contact Us
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
				
				
				
				<div class=col-md-2>
				
				</div>
				<div class=col-md-8 style="background-color:lightgrey; margin:10px; text-align:center; border:1px solid grey;">
					<form method="POST" action="ContactUs">
					<br>
					
					<br>
					
									<input type="text" placeholder="Enter Name" name="name1"  style="width:300px;" value="<jsp:expression>name</jsp:expression>"/> <br><br>
									<input type="text" placeholder="Enter Email" name="Email1"  style="width:300px;" value="<jsp:expression>email</jsp:expression>"/> <br><br>
									<input type="text" placeholder="Enter Subject" name="subject1"  style="width:300px;" /> <br><br>
									<textarea placeholder="Enter Message"  name="message1" style="width:300px;"></textarea>			
					 <br><br>					
					<input type="submit" value="Send" class="btn btn-primary"/>
					<br><br>
					</form>
				</div>
				<div class=col-md-2>
				
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
		
			<div class="row" style="margin-top:10px;">
				
				<div class="col-md-2"></div>
				<div class="col-md-8"><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d16877.64308621952!2d76.82140124025902!3d30.64311967385811!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390feb21654c0c43%3A0x616dfc7292ce7034!2sSmart%20Programming!5e0!3m2!1sen!2sus!4v1696446308475!5m2!1sen!2sus" width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></div>
				<div class="col-md-2"></div>
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