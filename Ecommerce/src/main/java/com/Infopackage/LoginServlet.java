package com.Infopackage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
//import java.sql.*;
import javax.annotation.*;
public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		User user=UserDao.loginCheck(userEmail, userPassword);
		HttpSession session=request.getSession();
		String message="";
		if(user==null)
		{
			message="Invalid username or password ! Login again!";
			session.setAttribute("message", message);
			response.sendRedirect("Login.jsp");
			return;
		}
		else
		{
//			Part p=request.getPart("");
			session=request.getSession();
			session.setAttribute("current_user", user);
			if(user.getUsertype().equals("Admin"))
			{
				response.sendRedirect("Admin.jsp");
			}
			else if(user.getUsertype().equals("Normal"))
			{
				response.sendRedirect("index.jsp");
			}
			else
			{
				message="We are not able to identify your User type.Please Enter correct information!";
				session.setAttribute("message", message);
				response.sendRedirect("Login.jsp");
				return;
			}
		}
	}
}
