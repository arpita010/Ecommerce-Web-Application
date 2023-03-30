package com.Infopackage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class EditCategoryServlet extends HttpServlet {
public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
{
response.setContentType("text/html");
PrintWriter out=response.getWriter();
String operation =request.getParameter("operation");
if(operation!=null)
{
	String cid=request.getParameter("cId");
	String newName=request.getParameter("newName");
	String newdesc=request.getParameter("newDesc");
	Category cat=new Category();
	cat.setcID(Integer.parseInt(cid));
	cat.setcTitle(newName);
	cat.setcDesc(newdesc);
	CategoryDao.editCategory(cat);

}
else
{
	String cID=request.getParameter("delId");
	CategoryDao.deleteCategory(cID);
	
}
response.sendRedirect("EditCategories.jsp");
return;
}
}
