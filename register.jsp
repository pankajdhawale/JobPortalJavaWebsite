<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Register smart Website</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
    	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>
    	<link rel="stylesheet " type="text/css" href="CSS/style.css">
    	
    	<script>
    	
    		function val(a)
    		{
    			document.getElementById(a).innerHTML="";
    				
    		}
    	
    	
    		function validation()
    		{
    			var flag=true;
    			
    			var name2=document.regform.name1.value;
    			var Email2=document.regform.Email1.value;
    			var pass2=document.regform.pass1.value;
    			var gender2=document.regform.gender1.value;
    			//var fields2=document.regform.field1.value;
    			var city2=document.regform.city1.value;
				
    			/*var name_pattern=/^[a-zA-Z]{3,30}$/;
    			var Email_pattern=/^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*)([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
    			var password_pattern=/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;*/
    			/*var phon_pattern=/^[0-9]{10}$/;*/
    			
    			/*if(!name2.match(name_pattern))
    			{
    				document.getElementById("name_error").innerHTML="Name can not be in proper format";
    				flag=false;
    			}*/
    			if(name2==="")
    			{
    				document.getElementById("name_error").innerHTML="Name can not be empty";
    				flag=false;
    			}
    			/*if(!Email2.match(Email_pattern))
    			{
    				document.getElementById("Email_error").innerHTML="email can not be in proper format";
					flag=false;
    			}*/
    			if(Email2==="")
    			{
    					document.getElementById("Email_error").innerHTML="email can not be empty";
    					flag=false;
    			}
    			/*if(!pass2.match(password_pattern))
    			{
    				
    				document.getElementById("pass_error").innerHTML="password can arrange using char,num and special symbol";
					flag=false;	
    			}*/
    			if(pass2==="")
    			{
    					document.getElementById("pass_error").innerHTML="password can not be empty";
    					flag=false;
    			}
    			if(gender2==="")
    			{
    					document.getElementById("gender_error").innerHTML="please select gender";
    					flag=false;
    			}
    			/*if(fields2==="")
    			{
    					document.getElementById("field_error").innerHTML="select atleast one field";
    					flag=false;
    			}*/
    			if(city2==="Select city")
    			{
    					document.getElementById("city_error").innerHTML="Please select the city ";
    					flag=false;
    			}
    			return flag;
    			
    			
    		}
    	</script>
    	
    	
</head>
<body>
		<div class="container-fluid">
			<jsp:include page="header_part.jsp"></jsp:include>
			<jsp:include page="menubar_part.jsp"></jsp:include>
			<div class=row>
				<div class=col-md-2>
				
				</div>
				<div class=col-md-8 style="background-color:lightgrey; margin:10px; text-align:center; border:1px solid grey;">
					<form method="post" name="regform" onsubmit="return validation()" action="reg">
					<br>
					<h1>Register here</h1>
					<br>
					
									<input type="text" placeholder="Enter Name" name="name1" onkeyup="val('name_error')" style="width:300px;"/><br><span id="name_error" style="color:red"></span> <br><br>
									<input type="text" placeholder="Enter Email" name="Email1" onkeyup="val('Email_error')" style="width:300px"/><br> <span id="Email_error" style="color:red"></span><br><br>
									<input type="password" placeholder="Enter password" name="pass1" onkeyup="val('pass_error')" style="width:300px"/><br><span id="pass_error"  style="color:red"></span><br><br>
					<b>Select Gender</b> : <input type="radio" name="gender1" value="male"/>male
									<input type="radio" name="gender1" value="female"/>Female <br>  <span id="gender_error"  style="color:red" ></span><br><br>				
					<b>Select fields</b> : <input type="checkbox" name="field1" value="Information Technology"/>Information Technology
									<input type="checkbox" name="field1" value="Marketing"/>Marketing
									<input type="checkbox" name="field1" value="finance" />finance  <br>  <span id="field_error"  style="color:red"></span>
									<br><br>				
					
					<select name="city1" style="width:300px;">
						<option>Select city</option>
						<option value="ahmednagar">ahmednagar</option>
						<option value="Sambhaji Nagar">Sambhaji Nagar</option>
						<option value="Pune">Pune</option>
						<option value="Thane">Thane</option>
						
					</select><br><span id="city_error"  style="color:red"></span> <br><br>					
					<input type="submit" value="register" class="btn btn-primary"/>
					<br><br>
					</form>
				</div>
				<div class=col-md-2>
				
				</div>
			</div>
			<jsp:include page="footer_part.jsp"></jsp:include>
			
			
			
		
		</div>
	
</body>
</html>