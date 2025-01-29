package com.pankaj.myservlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class ContactUs
 */
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 String name1=req.getParameter("name1");
	        String email1=req.getParameter("email1");
	        String subject1=req.getParameter("subject1");
	        String message1=req.getParameter("message1");
	        
	        Date d=new Date();
	        
	        SimpleDateFormat sdf1=new SimpleDateFormat("dd-MM-yyyy");
	        String date1=sdf1.format(d);
	        
	        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
	        String time1=sdf2.format(d);
	        
	        Connection con=null;
	        try
	        {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	        	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","12345");
	            PreparedStatement ps=con.prepareStatement("insert into contact_us(name, email, subject, message, date1, time1) values(?,?,?,?,?,?)");
	            ps.setString(1, name1);
	            ps.setString(2, email1);
	            ps.setString(3, subject1);
	            ps.setString(4, message1);
	            ps.setString(5, date1);
	            ps.setString(6, time1);
	            
	            int i=ps.executeUpdate();
	            if(i>0)
	            {
	              
	                
	                resp.sendRedirect("contact_us.jsp");
	                
//	                RequestDispatcher rd1=req.getRequestDispatcher("success.jsp");
//	                rd1.include(req, resp);
//	                
//	                RequestDispatcher rd2=req.getRequestDispatcher("contact-us.jsp");
//	                rd2.include(req, resp);
	            }
	            else
	            {
	               
	                
	                resp.sendRedirect("contact_us.jsp");
	                
//	                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
//	                rd1.include(req, resp);
//	                
//	                RequestDispatcher rd2=req.getRequestDispatcher("contact-us.jsp");
//	                rd2.include(req, resp);
	            }
	        }
	        catch(Exception e)
	        {
	        	e.printStackTrace();
	        }
	}

}
