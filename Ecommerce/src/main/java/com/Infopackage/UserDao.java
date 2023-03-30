package com.Infopackage;
import java.sql.*;
import java.util.*;
public class UserDao {
	//save user data;
		static Connection con=null;
		public static void record(User user)
		{
			String query="insert into user(Username,Email,PhoneNumber,Password,Usertype)values(?,?,?,?,?);";
			con=Database.getConnection();
			try {
			PreparedStatement pr=con.prepareStatement(query);
			pr.setString(1,user.getUsername());
			pr.setString(2,user.getEmail());
			pr.setString(3,user.getPhoneNumber());
			pr.setString(4,user.getPassword());
			pr.setString(5,user.getUsertype());
			pr.executeUpdate();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		//user login check
		public static User loginCheck(String email,String password)
		{
			User user=null;
			con=Database.getConnection();
			String query="select * from user where Email=? AND Password=?";
			try
			{
				PreparedStatement pr=con.prepareStatement(query);
				pr.setString(1,email);
				pr.setString(2,password);
				ResultSet rs=pr.executeQuery();
				boolean check=rs.next();
				if(check==false)
					return user;
				else
				{
					int userID=rs.getInt(1);
					String username=rs.getString(2);
					String Email=rs.getString(3);
					String phone=rs.getString(4);
					String pass=rs.getString(5);
					String usertype=rs.getString(6);
					user=new User(userID,username,Email,phone,pass,usertype);
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return user;
		}
		public static int getUsersCount()
		{
			int count=0;
			con=Database.getConnection();
			String query="select * from user";
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
		//deactivate account;
		public static void deleteUser(int userid)
		{
			String query="delete from user where UserID=?;";
			con=Database.getConnection();
			try
			{
				PreparedStatement pr=con.prepareStatement(query);
				pr.setInt(1, userid);
				pr.execute();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		//edit profile option
		public static void editProfile(int userid,String newusername,String newemail,String newphonenumber,String newpassword)
		{
			con=Database.getConnection();
			String query="update user"
					+ " set Username=?,Email=?,PhoneNumber=?,Password=? "
					+ "where UserID=?;";
			try
			{
				PreparedStatement pr=con.prepareStatement(query);
				pr.setString(1,newusername);
				pr.setString(2,newemail);
				pr.setString(3,newphonenumber);
				pr.setString(4, newpassword);
				pr.setInt(5, userid);
				pr.executeUpdate();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		public static List<User> getAllUsersList()
		{
			List<User> userlist=new ArrayList<User>();
			con=Database.getConnection();
			String query="select * from User";
			try
			{
				PreparedStatement pr=con.prepareStatement(query);
				ResultSet rs=pr.executeQuery();
				while(rs.next())
				{
					User user=new User();
					user.setUserID(rs.getInt(1));
					user.setUsername(rs.getString(2));
					user.setEmail(rs.getString(3));
					user.setPhoneNumber(rs.getString(4));
					user.setPassword(rs.getString(5));
					user.setUsertype(rs.getString(6));
					userlist.add(user);
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return userlist;
		}
}
