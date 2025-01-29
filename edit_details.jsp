<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String name=(String)session.getAttribute("session_name");
	String gender=(String)session.getAttribute("session_gender");
	String city=(String)session.getAttribute("session_city");
	String field=(String)session.getAttribute("session_field");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile smart Website</title>
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
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-4">
					<br><br><br>
					<img src="IMAGES/logo_infosys.jpg" height="100px;" width="100px;" class="rounded-circle"/>
				</div>
				<div class="col-md-8">
					<br>
					<h3 style="color:blue;"><jsp:expression>name.toUpperCase()</jsp:expression></h3><br>
					
					<table>
							<tr>
								<td><span style="color:#acaaaa;">Gender : </span></td> 
								<td><input type="text" value="<jsp:expression>gender</jsp:expression>"/></td>
							</tr>
							
							<tr>
								<td><span style="color:#acaaaa;">City :   </span></td> 
								<td><input type="text" value="<jsp:expression>city</jsp:expression>"/></td>
							</tr>
							
							<tr>
								<td><span style="color:#acaaaa;">field :  </span></td> 
								<td><input type="text" value="<jsp:expression>field</jsp:expression>"/></td>
							</tr>
							
							<tr>
							
								<td></td>
								<td><input type="submit" value="Update" class="btn btn-danger" style="margin-top:20px;"/></td>
							</tr>
					
					</table>
					<br><br>
					
				</div>
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-8">
					
					<h5>Education details<span style="font-size:12px;">  <a href="">(edit_details)</a></span></h5>
						School: <input type="text" value="" style="width:300px;"/><br>
						year: 	<input type="text" value="" style="width:300px;"/><br>
						College:<input type="text" value="" style="width:300px;"/>	<br>
						Passing Year:<input type="text" value="" style="width:300px;"/> <br>
						Experience:<input type="text" value="" style="width:300px;"/>	<br><br>
						<input type="submit" value="Update" class="btn btn-danger"/>
					</div>
						
				</div>
			</div>
			<div class="row" style="background-color:#ececec;">
			<div class="col-md-4"></div>
			<div class="col-md-8"></div>
			
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
				
	
	<br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="footer_part.jsp"></jsp:include>
</body>
</html>