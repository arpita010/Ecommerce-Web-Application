package com.Infopackage;
import javax.servlet.*;
//import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
//import javax.servlet.http.Part.*;
import java.io.*;

public class ProductCategoryAddServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String operation=request.getParameter("operation");
		out.println(operation);
		HttpSession session=request.getSession();
		if(operation.equals("category"))
		{
			String cTitle=request.getParameter("cTitle");
			String cDesc=request.getParameter("cDesc");
			Category cat=new Category();
			cat.setcTitle(cTitle);
			cat.setcDesc(cDesc);
			CategoryDao.addCategory(cat);
			session.setAttribute("message","Category added successfully!!");
			response.sendRedirect("Admin.jsp");
			return;
		}
		else if(operation.equals("product"))
		{
			//fetch details from request object;
			String pTitle=request.getParameter("pTitle");
			String pDesc=request.getParameter("pDesc");
			String pPhoto=request.getParameter("pPhoto");
		
			int pPrice=Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
			int Quantity=Integer.parseInt(request.getParameter("Quantity"));
				//type list of categories;
			String cidtype=request.getParameter("type");
			Category cat=CategoryDao.getCategory(cidtype);
			//end of fetching//
			Product product=new Product();
			product.setpTitle(pTitle);
			product.setpDesc(pDesc);
			product.setpPhoto(pPhoto);
			product.setpPrice(pPrice);
			product.setpDiscount(pDiscount);
			product.setQuantity(Quantity);
			product.setCat(cat);
			ProductDao.addProduct(product);
			session.setAttribute("message","Product added successfully!!");
			response.sendRedirect("Admin.jsp");
			return;
		}
	}
}
