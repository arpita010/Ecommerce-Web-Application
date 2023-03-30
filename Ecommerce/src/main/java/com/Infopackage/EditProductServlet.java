package com.Infopackage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class EditProductServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String operation=request.getParameter("operation");
		if(operation!=null)
		{
			//edit
			String pid=request.getParameter("editPid");
			String newTitle=request.getParameter("newTitle");
			String newPrice=request.getParameter("newPrice");
			String newDiscount=request.getParameter("newDiscount");
			String newQuantity=request.getParameter("newQuantity");
			Product product=new Product();
			product.setPid(Integer.parseInt(pid));
			product.setpTitle(newTitle);
			product.setpPrice(Integer.parseInt(newPrice));
			product.setpDiscount(Integer.parseInt(newDiscount));
			product.setQuantity(Integer.parseInt(newQuantity));
			ProductDao.editProduct(product);
		}
		else
		{
			//delete
			String delPid=request.getParameter("delPid");
			ProductDao.deleteProduct(delPid);
		}
		response.sendRedirect("editProduct.jsp");
		return;
	}
}
