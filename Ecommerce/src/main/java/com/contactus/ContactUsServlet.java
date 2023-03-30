package com.contactus;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class ContactUsServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String message=request.getParameter("comment");
		ContactDao.saveMessage(name, email, message);
		session.setAttribute("message","Message sent successfully!!");
		response.sendRedirect("Contactus.jsp");
	}
}
