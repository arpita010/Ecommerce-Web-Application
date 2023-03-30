package com.Infopackage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class CardServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		Card card=new Card();
		String userID=request.getParameter("userID");
		String cardnumber=request.getParameter("cardnumber");
		String nameOnCard=request.getParameter("nameOnCard");
		String futureCardName=request.getParameter("futureCardName");
		card.setUserID(userID);
		card.setCardnumber(cardnumber);
		card.setNameOnCard(nameOnCard);
		card.setFutureCardName(futureCardName);
		CardDao.saveCard(card);
		//toast
		response.sendRedirect("index.jsp");
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String cardid=request.getParameter("cardid");
		CardDao.deleteCard(cardid);
		response.sendRedirect("index.jsp");
	}
}
