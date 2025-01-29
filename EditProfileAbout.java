package com.pankaj.myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditProfileAbout extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4184308521936603890L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		//resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		
		
		HttpSession session=req.getSession();
		String email2=(String)session.getAttribute("session_email");
		
		String name2=req.getParameter("name1");
		String city2=req.getParameter("city1");
		String gender2=req.getParameter("gender1");
		String title2=req.getParameter("title1");
		String skills2=req.getParameter("skills1");
		
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
//			System.out.println("class loaded successfully");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal ","root","12345");
			PreparedStatement ps1=con.prepareStatement("update register set name= ?,city=?,gender=? where email=?");
			ps1.setString(1,name2 );
			ps1.setString(2,city2 );
			ps1.setString(3,gender2 );
			ps1.setString(4,email2 );
			
			ps1.executeUpdate();
			
			int i1=ps1.executeUpdate();
			
			PreparedStatement ps2=con.prepareStatement("update about_user set about=?,skills=? where email=?");
			
			ps2.setString(1,title2);
			ps2.setString(2,skills2);
			ps2.setString(3,email2);
		
			int i2=ps2.executeUpdate();
			
			
			if(i1>0 && i2>0)
			{
				session.setAttribute("session_name",name2);
				session.setAttribute("session_email",email2);
				session.setAttribute("session_gender",gender2);
				session.setAttribute("session_city",city2);
				
				session.setAttribute("session_title",title2);
				session.setAttribute("session_skills",skills2);
				resp.sendRedirect("Profile.jsp");
				out.println("user registered successfully");
			}
			else
			{
				RequestDispatcher rd1=req.getRequestDispatcher("error_for_edit.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2=req.getRequestDispatcher("error_for_edit.jsp");
				rd2.include(req, resp);
				
			}
		}
		catch(Exception e)
		{
			
			 e.printStackTrace();
						
		}
		
		
		
		
		
		
	}

	
}
