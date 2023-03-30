package com.Infopackage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class NormalUserServlet extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String action=request.getParameter("action");
		HttpSession session=request.getSession();
		User user4=(User)session.getAttribute("current_user");
//		out.println(user4);
		if(action.equals("1")) {
			UserDao.deleteUser(user4.getUserID());
			response.sendRedirect("Logout.jsp");
		}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		if(request.getParameter("action").equals("2"))
		{
			
			int olduserid=Integer.parseInt(request.getParameter("olduserid"));
			String newusername=request.getParameter("newusername");
			String newemail=request.getParameter("newemail");
			String newphonenumber=request.getParameter("newphonenumber");
			String newpassword=request.getParameter("newpassword");
			UserDao.editProfile(olduserid,newusername,newemail,newphonenumber,newpassword);
			//toast that profile updated successfully;
			response.sendRedirect("index.jsp");
		}
	}
}
