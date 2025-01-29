package com.pankaj.myservlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class EditExperienceDetails
 */
public class EditExperienceDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out=resp.getWriter();
		
		String id2=req.getParameter("id1");
		String company2=req.getParameter("company1");
		String location2=req.getParameter("location1");
		String year2=req.getParameter("year1");
		String job_title2=req.getParameter("job_title1");
		String description2=req.getParameter("description1");
		
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","12345");
			PreparedStatement ps=con.prepareStatement("update experience set company=?,location=?,year=?,job_title=?,description=? where id=?");
			
		
			ps.setString(1, company2);
			ps.setString(2, location2);
			ps.setString(3, year2);
			ps.setString(4, job_title2);
			ps.setString(5,description2);
			ps.setString(6,id2);
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				resp.sendRedirect("Profile.jsp");
			}
			else {
				
				RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
				rd1.include(req,resp);
				
				RequestDispatcher rd2=req.getRequestDispatcher("edit_profile_experience.jsp");
				rd2.include(req,resp);
				
			}
		
		}catch(Exception e)
		{
			out.print(e);
		}
	}

}
