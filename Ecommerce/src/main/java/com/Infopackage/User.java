package com.Infopackage;

public class User {
	int UserID;
	 String Username;
	 String Email;
	 String PhoneNumber;
	 String Password;
	 String Usertype;
	 public User()
	 {
		 
	 }
	public User(String Username,String Email,String PhoneNumber,String Password,String Usertype)
	{
		this.Username=Username;
		this.Email=Email;
		this.PhoneNumber=PhoneNumber;
		this.Password=Password;
		this.Usertype=Usertype;
	}
	public User(int id,String Username,String Email,String PhoneNumber,String Password,String Usertype)
	{
		this.UserID=id;
		this.Username=Username;
		this.Email=Email;
		this.PhoneNumber=PhoneNumber;
		this.Password=Password;
		this.Usertype=Usertype;
	}
	public int getUserID() {
		return UserID;
	}
	public String getUsername() {
		return Username;
	}
	public String getEmail() {
		return Email;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public String getPassword() {
		return Password;
	}
	public String getUsertype()
	{
		return Usertype;
	}
	 public void setUserID(int userID) {
			UserID = userID;
		}
		public void setUsername(String username) {
			Username = username;
		}
		public void setEmail(String email) {
			Email = email;
		}
		public void setPhoneNumber(String phoneNumber) {
			PhoneNumber = phoneNumber;
		}
		public void setPassword(String password) {
			Password = password;
		}
		public void setUsertype(String usertype) {
			Usertype = usertype;
		}
		
}
