package com.Infopackage;
import java.sql.*;
public class Database {
	static final String url="jdbc:mysql://127.0.0.1:3308/ecommerce";
	static final String dbusername="root";
	static final String dbpassword="";
	static Connection con=null;
	public static Connection getConnection()
	{
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection(url,dbusername,dbpassword);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	
}
