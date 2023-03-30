package com.Infopackage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String phonenumber=request.getParameter("phonenumber");
		String password=request.getParameter("password");
		String usertype=request.getParameter("usertype");
		User user=new User(username,email,phonenumber,password,usertype);
		UserDao.record(user);
		HttpSession session=request.getSession();
		session.setAttribute("message","Registration successful!!" );
		response.sendRedirect("Register.jsp");
	}
}
