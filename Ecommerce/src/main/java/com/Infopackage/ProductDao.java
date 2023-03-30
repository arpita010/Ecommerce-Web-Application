package com.Infopackage;
import java.sql.*;
import java.util.*;
public class ProductDao {
	static Connection con=null;
	//add product into database;
	public static void addProduct(Product p)
	{
		con=Database.getConnection();
		String query="insert into products(pTitle,pDesc,pPhoto,pPrice,pDiscount,Quantity,cID)values(?,?,?,?,?,?,?);";
		try {
		PreparedStatement pr=con.prepareStatement(query);
		pr.setString(1,p.getpTitle());
		pr.setString(2,p.getpDesc());
		pr.setString(3,p.getpPhoto());
		pr.setInt(4,p.getpPrice());
		pr.setInt(5,p.getpDiscount());
		pr.setInt(6, p.getQuantity());
		pr.setInt(7, p.getCat().getcID());
		pr.execute();
		FileSaver.saveImage(p.getpPhoto());
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	public static List<Product> getProductList()
	{
		List<Product> list=new ArrayList<>();
		con=Database.getConnection();
		String query="select * from products order by cID;";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				Product p=new Product();
				p.setPid(rs.getInt(1));
				p.setpTitle(rs.getString(2));
				p.setpDesc(rs.getString(3));
				p.setpPhoto(rs.getString(4));
				p.setpPrice(rs.getInt(5));
				p.setpDiscount(rs.getInt(6));
				p.setQuantity(rs.getInt(7));
				p.setcID(rs.getInt(8));
				list.add(p);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static List<Product> getSelectedProducts(String ltype)
	{
		List<Product> list=new ArrayList<>();
		int cID=Integer.parseInt(ltype);
		String query="select * from products where cID=? order by cID;";
		con=Database.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setInt(1, cID);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				Product p=new Product();
				p.setPid(rs.getInt(1));
				p.setpTitle(rs.getString(2));
				p.setpDesc(rs.getString(3));
				p.setpPhoto(rs.getString(4));
				p.setpPrice(rs.getInt(5));
				p.setpDiscount(rs.getInt(6));
				p.setQuantity(rs.getInt(7));
				p.setcID(rs.getInt(8));
				list.add(p);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	//get product to addcart page
	public static Product getProduct(int pid)
	{
		con=Database.getConnection();
		String query="select * from products where pid=?";
		Product p=new Product();
		
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setInt(1, pid);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				p.setPid(pid);
				p.setpTitle(rs.getString(2));
				p.setpDesc(rs.getString(3));
				p.setpPhoto(rs.getString(4));
				p.setpPrice(rs.getInt(5));
				p.setpDiscount(rs.getInt(6));
				p.setQuantity(rs.getInt(7));
				p.setcID(rs.getInt(8));
				
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return p;
	}
	public static int getProductsCount()
	{
		int count=0;
		con=Database.getConnection();
		String query="select * from products";
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				count++;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public static void editProduct(Product product)
	{
		String query="update products set pTitle=?,pPrice=?,pDiscount=?,Quantity=? where pid=?;";
		con=Database.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, product.getpTitle());
			pr.setInt(2, product.getpPrice());
			pr.setInt(3, product.getpDiscount());
			pr.setInt(4, product.getQuantity());
			pr.setInt(5, product.getPid());
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void deleteProduct(String pid)
	{
		String query="delete from products where pid=?";
		con=Database.getConnection();
		try
		{
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1,pid);
			pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
