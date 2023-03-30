package com.contactus;
import java.sql.*;
import com.Infopackage.Database;
public class ContactDao {
	public static void saveMessage(String name,String email,String message)
	{
		String query="insert into contactus(name,email,message)"
				+ "values(?,?,?);";
		Connection con=Database.getConnection();
		try {
		PreparedStatement pr=con.prepareStatement(query);
		pr.setString(1, name);
		pr.setString(2,email);
		pr.setString(3, message);
		pr.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
