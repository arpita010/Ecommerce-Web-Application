package com.Infopackage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class EditUserServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int userid=Integer.parseInt(request.getParameter("userId"));
		UserDao.deleteUser(userid);
		response.sendRedirect("EditUsers.jsp");
	}
}
