<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class=row>
				<div class=col-md-2>
				
				</div>
				<div class=col-md-8 style="background-color:lightgrey; margin:10px; text-align:center; border:1px solid grey;">
					<form method="POST" action="login">
					<br>
					<h1>Login smart Website</h1>
					<br>
					
									
									<input type="text" placeholder="Enter Email" name="Email1"  style="width:300px;"/> <br><br>
									<input type="password" placeholder="Enter password" name="pass1" style="width:300px;"/><br><br>
							
									<input type="checkbox" name="rememberme" value="rememberme"/>Rememberme
												
					 <br><br>					
					<input type="submit" value="Login" class="btn btn-primary"/>
					<br><br>
					</form>
				</div>
				<div class=col-md-2>
				
				</div>
			</div>
</body>
</html>