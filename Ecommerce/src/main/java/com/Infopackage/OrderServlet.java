package com.Infopackage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class OrderServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		OrderDao.deleteOrder(request.getParameter("orderId"));
		response.sendRedirect("index.jsp");
		return;
	}
}
