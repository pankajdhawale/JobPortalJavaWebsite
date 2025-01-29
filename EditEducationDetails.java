package com.pankaj.myservlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class EditEducationDetails
 */
public class EditEducationDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//create object for checking errors in code on user interface
				PrintWriter out=resp.getWriter();
				
				
				
				//for getting email by using http-sessions
				//HttpSession session=req.getSession();
				//String email2=(String)session.getAttribute("session_email");
				
				
				//for getting values
				String school2=req.getParameter("school1");
				String degree2=req.getParameter("degree1");
				String year2=req.getParameter("year1");
				String grade2=req.getParameter("grade1");
				String description2=req.getParameter("description1");
				String id2=req.getParameter("id1");
				try
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal ","root","12345");
					PreparedStatement ps=con.prepareStatement("update education set school=?,degree=?,year=?,grade=?,description=? where id=?");
					ps.setString(1, id2);
					ps.setString(1,school2);
					ps.setString(2, degree2);
					ps.setString(3, year2);
					ps.setString(4, grade2);
					ps.setString(5, description2);
					ps.setString(6, id2);
					int i=ps.executeUpdate();
					
					if(i>0)
					{
					resp.sendRedirect("Profile.jsp");	
					}
					else
					{
						RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
						rd1.include(req, resp);
						
						RequestDispatcher rd2=req.getRequestDispatcher("EditProfileEducation.jsp");	//Edit_Profile_education.jsp
						rd2.include(req, resp);
					}
				}
				catch(Exception e)
				{
					out.println(e);
					//e.printStackTrace();
				}
	}

}
