package com.Infopackage;
import java.util.*;
import java.sql.*;
//userid,username,email,phone,address,map
public class OrderDao {
	static Connection con=null;
	public void saveOrder(Order order)
	{
		con=Database.getConnection();
		String query="insert into orders(userid,username,email,phonenumber,address,productIDs,total,payment) values(?,?,?,?,?,?,?,?);";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1,order.getUserid());
			pr.setString(2, order.getUsername());
			pr.setString(3,order.getEmail());
			pr.setString(4, order.getPhonenumber());
			pr.setString(5, order.getAddress());
			pr.setString(6, order.getProductIDs());
			pr.setString(7, order.getTotal());
			pr.setString(8, order.getPayment());
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void updateDatabase(HashMap<Integer,Integer> map)
	{
		con=Database.getConnection();
		String query="update products "
				+ "set Quantity=? where pid=?;";
		PreparedStatement pr=null;
		try
		{
			pr=con.prepareStatement(query);
			for(int i:map.keySet())
			{
				Product p=ProductDao.getProduct(i);
				pr.setInt(1,p.getQuantity()-map.get(i));
				pr.setInt(2, i);
				pr.executeUpdate();
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static List<Order> getSameUserOrder(int userid)
	{
		List<Order> list=new ArrayList<>();
		String query="select * from orders where userid=?";
		con=Database.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setInt(1, userid);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				Order ord=new Order();
				ord.setUserid(rs.getString(1));
				ord.setUsername(rs.getString(2));
				ord.setEmail(rs.getString(3));
				ord.setPhonenumber(rs.getString(4));
				ord.setAddress(rs.getString(5));
				ord.setProductIDs(rs.getString(6));
				ord.setTotal(rs.getString(7));
				ord.setOrderid(rs.getString(8));
				ord.setPayment(rs.getString(9));
				list.add(ord);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static void deleteOrder(String orderID)
	{
		String query="delete from orders where orderid=?";
		Connection con=Database.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1,orderID);
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
