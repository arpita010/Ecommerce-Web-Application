package com.Infopackage;
import java.sql.*;
import java.util.*;
public class CardDao {
	static Connection con=null;
	public static void saveCard(Card card)
	{
		String query="insert into carddetails(userid,cardnumber,nameOnCard,futureCardName) values(?,?,?,?);";
		con=Database.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1,card.getUserID());
			pr.setString(2,card.getCardnumber());
			pr.setString(3, card.getNameOnCard());
			pr.setString(4,card.getFutureCardName());
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static List<Card> getCardsList(int userid)
	{
		List<Card> list=new ArrayList<>();
		con=Database.getConnection();
		String query="select * from carddetails where userid="+userid;
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				Card card=new Card();
				card.setUserID(rs.getString(1));
				card.setCardnumber(rs.getString(2));
				card.setNameOnCard(rs.getString(3));
				card.setFutureCardName(rs.getString(4));
				card.setCardid(rs.getString(5));
				list.add(card);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	//delete a card
	public static void deleteCard(String cardid)
	{
		String query="delete from carddetails where cardid="+cardid;
		con=Database.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
}
