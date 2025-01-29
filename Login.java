package com.pankaj.myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet
{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@SuppressWarnings("unused")
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
{
	resp.setContentType("text/html");
	PrintWriter out=resp.getWriter();
	
	String Email2=req.getParameter("Email1");
	String pass2=req.getParameter("pass1");
	String remme2=req.getParameter("rememberme");
	

	
	//this is process is after registeration validation
	
	String name2="";
	String gender2="";
	String city2="";
	String field2="";
	
	
	try
	{
	Class.forName("com.mysql.cj.jdbc.Driver");	
//	System.out.println("class loaded successfully");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","12345");
	PreparedStatement ps=con.prepareStatement("select * from register where Email=? and password=?");
	ps.setString(1, Email2);
	ps.setString(2, pass2);
	
	
	ResultSet rs=ps.executeQuery();
	
	if(rs.next())
	{
		name2=rs.getString("name");
		gender2=rs.getString("gender");
		city2=rs.getString("city");
		field2=rs.getString("field");
		
		
		//create object for session
		
		HttpSession session=req.getSession();
		session.setAttribute("session_name",name2);
		session.setAttribute("session_email",Email2);
		session.setAttribute("session_pass",pass2);
		session.setAttribute("session_gender",gender2);
		session.setAttribute("session_field",field2);
		session.setAttribute("session_city",city2);
		
		String title="",skills="";
		
		PreparedStatement ps2=con.prepareStatement("select * from about_user where email=?");
		ps2.setString(1, Email2);
		ResultSet rs2=ps2.executeQuery();
		while(rs2.next())
		{
			title=rs2.getString("about");
			skills=rs2.getString("skills");
		}
		
		session.setAttribute("session_title",title);
		session.setAttribute("session_skills",skills);

		
		resp.sendRedirect("Profile.jsp");	
		
	}else
	{
		//like jsp include tag create seprate page by adding all jsp files
		
		RequestDispatcher rd1=req.getRequestDispatcher("header_part.jsp");
		rd1.include(req, resp);
		
		RequestDispatcher rd2=req.getRequestDispatcher("menubar_part.jsp");
		rd2.include(req, resp);
		
		RequestDispatcher rd3=req.getRequestDispatcher("loginerror.jsp");
		rd3.include(req, resp);
		
		RequestDispatcher rd4=req.getRequestDispatcher("logindiv.jsp");
		rd4.include(req, resp);
		
		RequestDispatcher rd5=req.getRequestDispatcher("footer_part.jsp");
		rd5.include(req, resp);
		
	}
	
	}
	catch(Exception e)
	{
		out.print(e);
		e.printStackTrace();
	}
	
	
	
	
	
	
}


}
