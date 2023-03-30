package com.Infopackage;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
	static Connection con=null;
	//add category into database;
		public static void addCategory(Category cat)
		{
			String query="insert into categories(cTitle,cDesc) values(?,?);";
			con=Database.getConnection();
			try {
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1, cat.getcTitle());
			pr.setString(2, cat.getcDesc());
			pr.execute();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		//get categories list for products list
		public static List<Category> getCategories()
		{
			List<Category> l=new ArrayList<Category>();
			con=Database.getConnection();
			String query="select * from categories";
			try
			{
				PreparedStatement pr=con.prepareStatement(query);
				ResultSet rs=pr.executeQuery();
				while(rs.next())
				{
					Category c=new Category();
					c.setcID(rs.getInt(1));
					c.setcTitle(rs.getString(2));
					c.setcDesc(rs.getString(3));
					l.add(c);
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return l;
		}
		//get category for product
		public static Category getCategory(String cidtype)
		{
			Category cat=new Category();
			String query="select * from categories where cID=?";
			con=Database.getConnection();
			try
			{
				PreparedStatement pr=con.prepareStatement(query);
				pr.setString(1,cidtype);
				ResultSet rs=pr.executeQuery();
				while(rs.next())
				{
					cat.setcID(rs.getInt(1));
					cat.setcTitle(rs.getString(2));
					cat.setcDesc(rs.getString(3));
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return cat;
		}
		//get categories count
		public static int getCategoriesCount()
		{
			int count=0;
			con=Database.getConnection();
			String query="select * from categories";
			try {
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
		public static void editCategory(Category cat)
		{
			con=Database.getConnection();
			String query="update categories set cTitle=?,cDesc=? where cID=?;";
			try
			{
				PreparedStatement pr=con.prepareStatement(query);
				pr.setString(1, cat.getcTitle());
				pr.setString(2, cat.getcDesc());
				pr.setInt(3, cat.getcID());
				pr.execute();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		public static void deleteCategory(String cID)
		{
			String query="delete from categories where cID=?";
			con=Database.getConnection();
			try
			{
				PreparedStatement pr=con.prepareStatement(query);
				pr.setString(1, cID);
				pr.execute();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
}
