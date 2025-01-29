package com.pankaj.myservlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Servlet implementation class ApplyForJob
 */
public class ApplyForJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyForJob() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out=resp.getWriter();
		HttpSession session=req.getSession();
		String email=(String)session.getAttribute("session_email");
		
		
		
		String jid=req.getParameter("jobid");
		
		Date d=new Date();
		SimpleDateFormat sdf1=new SimpleDateFormat("dd-mm-yyyy");
		String date1=sdf1.format(d);
		SimpleDateFormat sdf2=new SimpleDateFormat("hh:mm:ss");
		String time1=sdf2.format(d);
		
		try
		{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","12345");
			
			PreparedStatement ps=con.prepareStatement("insert into applied_jobs(email,jobid,date1,time1) values(?,?,?,?)");
			
			ps.setString(1, email);
			ps.setString(2, jid);
			ps.setString(3,date1);
			ps.setString(4, time1);
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				RequestDispatcher rd1=req.getRequestDispatcher("success_apply.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2=req.getRequestDispatcher("job_description.jsp?jid="+jid);
				rd2.include(req, resp);
				resp.sendRedirect("indexAll.jsp");
			}
			else {
				RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2=req.getRequestDispatcher("job_description.jsp?jid="+jid);
				rd2.include(req, resp);
			}
		}
		catch(Exception e)
		{			
			e.printStackTrace();
			
		}
	}

}
